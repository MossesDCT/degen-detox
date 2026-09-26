import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:degen_detox/degen/domain.dart';
import 'package:degen_detox/degen/payments.dart';
import 'package:degen_detox/degen/purchase_panel.dart';
import 'package:degen_detox/degen/upgrade_strings.dart';
import 'package:degen_detox/degen/strings.dart';
import 'payment_verifier_test.dart' as fixture;

class RestoreService extends PaymentService {
  bool scanned = false;
  @override
  Future<String> proveWalletOwnership() async => fixture.payer;
  @override
  Future<String> recipientTokenAccount() async => fixture.ata;
  @override
  Future<dynamic> rpc(String method, List<dynamic> params) async {
    if (method == 'getGenesisHash') return mainnetGenesis;
    if (method == 'getSignatureStatuses') {
      return {
        'value': [
          {'confirmationStatus': 'finalized', 'err': null}
        ]
      };
    }
    if (method == 'getTransaction') {
      final tx = fixture.transaction(skr: params.first == 'new-skr');
      tx['transaction']['signatures'] = [params.first];
      return tx;
    }
    if (method == 'getSignaturesForAddress') {
      scanned = true;
      return [
        {'signature': 'new-skr', 'err': null, 'memo': 'DD1|lifetime|SKR'}
      ];
    }
    throw StateError(method);
  }
}

class OfflineService extends PaymentService {
  bool attempted = false;
  @override
  Future<dynamic> rpc(String method, List<dynamic> params) async {
    attempted = true;
    throw const PaymentFailure('networkError');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final sol = PurchaseReceipt(fixture.payer, 'old-sol', AccessTier.sol);
  final skr = PurchaseReceipt(fixture.payer, 'new-skr', AccessTier.skr);
  void storage({PurchaseReceipt? receipt, bool pending = false}) {
    FlutterSecureStorage.setMockInitialValues({
      if (receipt != null)
        'degen_mainnet_receipt_v1': jsonEncode(receipt.toJson()),
      if (pending)
        'degen_pending_v1': jsonEncode({
          'signature': 'new-skr',
          'wallet': fixture.payer,
          'lastValidBlockHeight': 1,
        }),
    });
  }

  test('eligibility matrix permits only SOL to SKR upgrade', () {
    for (final owned in [null, ...AccessTier.values]) {
      expect(canPurchaseTier(owned, AccessTier.free), isFalse);
      expect(canPurchaseTier(owned, AccessTier.sol),
          owned == null || owned == AccessTier.free);
      expect(canPurchaseTier(owned, AccessTier.skr), owned != AccessTier.skr);
    }
  });
  test('verified upgrade survives relaunch and cannot be downgraded', () async {
    storage(receipt: sol);
    final service = PaymentService();
    await service.load();
    await service.persistVerifiedReceipt(skr);
    await service.persistVerifiedReceipt(sol);
    final reloaded = PaymentService();
    await reloaded.load();
    expect(reloaded.receipt?.tier, AccessTier.skr);
    expect(reloaded.receipt?.signature, 'new-skr');
  });
  test('old SOL restore preserves pending upgrade; SKR confirmation clears it',
      () async {
    storage(receipt: sol, pending: true);
    final service = PaymentService();
    await service.load();
    await service.persistVerifiedReceipt(sol);
    expect(service.pending?['signature'], 'new-skr');
    final reloaded = PaymentService();
    await reloaded.load();
    expect(reloaded.pending?['signature'], 'new-skr');
    await reloaded.persistVerifiedReceipt(skr);
    expect(reloaded.pending, isNull);
    final again = PaymentService();
    await again.load();
    expect(again.pending, isNull);
    expect(again.receipt?.tier, AccessTier.skr);
  });
  test('failed upgrade keeps SOL and allows a later retry', () async {
    storage(receipt: sol);
    final service = OfflineService();
    await service.load();
    await expectLater(
        service.buy(AccessTier.skr), throwsA(isA<PaymentFailure>()));
    expect(service.attempted, isTrue);
    expect(service.busy, isFalse);
    expect(service.receipt?.tier, AccessTier.sol);
    final reloaded = PaymentService();
    await reloaded.load();
    expect(reloaded.receipt?.signature, 'old-sol');
  });
  test('duplicate SOL purchase and pending SKR never reach RPC', () async {
    storage(receipt: sol);
    final service = OfflineService();
    await service.load();
    await expectLater(
        service.buy(AccessTier.sol), throwsA(isA<PaymentFailure>()));
    expect(service.attempted, isFalse);
    storage(receipt: sol, pending: true);
    await service.load();
    await expectLater(
        service.buy(AccessTier.skr), throwsA(isA<PaymentFailure>()));
    expect(service.attempted, isFalse);
  });
  test('restore scans past cached SOL and verifies later SKR transaction',
      () async {
    storage(receipt: sol);
    final service = RestoreService();
    await service.load();
    final restored = await service.restore();
    expect(service.scanned, isTrue);
    expect(restored.tier, AccessTier.skr);
    expect(service.receipt?.signature, 'new-skr');
  });
  for (final locale in languages) {
    testWidgets('SOL upgrade offer and cancellation in $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final service = OfflineService()..receipt = sol;
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: PurchasePanel(
                          service: service,
                          locale: locale,
                          onChanged: () {},
                          onPreview: (_) {}))))));
      await tester.pumpAndSettle();
      final buy = find.text(upgradeText('buy', locale));
      await tester.ensureVisible(buy);
      await tester.tap(buy);
      await tester.pumpAndSettle();
      expect(find.text(tr('confirmPayment', locale)), findsOneWidget);
      await tester.tap(find.text(tr('cancel', locale)));
      await tester.pumpAndSettle();
      expect(service.attempted, isFalse);
      expect(service.receipt?.tier, AccessTier.sol);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('SKR owners are not offered duplicate upgrade', (tester) async {
    final service = PaymentService()..receipt = skr;
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                child: PurchasePanel(
                    service: service,
                    locale: 'en',
                    onChanged: () {},
                    onPreview: (_) {})))));
    expect(find.text(upgradeText('buy', 'en')), findsNothing);
  });
}
