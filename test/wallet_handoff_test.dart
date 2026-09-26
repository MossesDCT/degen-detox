import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:degen_detox/degen/domain.dart';
import 'package:degen_detox/degen/payments.dart';
import 'package:degen_detox/degen/purchase_panel.dart';
import 'package:degen_detox/degen/strings.dart';
import 'package:degen_detox/degen/wallet_handoff.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('wallet result and launch errors are observed without leaking errors',
      () async {
    expect(await observeWalletReturn(Future<void>.value()), isTrue);
    expect(
        await observeWalletReturn(Future<void>.error(StateError('no wallet'))),
        isFalse);
  });
  test('return waits for disconnect AND Android wallet activity result',
      () async {
    final disconnected = Completer<void>();
    final returned = Completer<bool>();
    final order = <String>[];
    final done = finishWalletHandoff(
      close: () {
        order.add('disconnect');
        return disconnected.future;
      },
      walletReturned: returned.future,
      operationCompleted: true,
      restoreApp: () async {
        order.add('return');
      },
    );
    await Future<void>.delayed(Duration.zero);
    expect(order, ['disconnect']);
    disconnected.complete();
    await Future<void>.delayed(Duration.zero);
    expect(order, ['disconnect']);
    returned.complete(true);
    await done;
    expect(order, ['disconnect', 'return']);
  });
  test('signed result still returns if wallet omits activity callback',
      () async {
    var restored = false;
    await finishWalletHandoff(
      close: () async {},
      walletReturned: Completer<bool>().future,
      operationCompleted: true,
      returnTimeout: Duration.zero,
      restoreApp: () async {
        restored = true;
      },
    );
    expect(restored, isTrue);
  });
  test('failed disconnect does not mask signing result or prevent return',
      () async {
    var restored = false;
    await finishWalletHandoff(
      close: () async {
        throw StateError('socket closed');
      },
      walletReturned: Future.value(true),
      operationCompleted: true,
      restoreApp: () async {
        restored = true;
      },
    );
    expect(restored, isTrue);
  });
  test('stalled disconnect is bounded', () async {
    var restored = false;
    await finishWalletHandoff(
      close: () => Completer<void>().future,
      closeTimeout: Duration.zero,
      walletReturned: Future.value(true),
      operationCompleted: true,
      restoreApp: () async {
        restored = true;
      },
    );
    expect(restored, isTrue);
  });
  test('abandoned launch cannot pull an unrelated activity to foreground',
      () async {
    var restored = false;
    await finishWalletHandoff(
      close: () async {},
      walletReturned: Future.value(false),
      operationCompleted: false,
      restoreApp: () async {
        restored = true;
      },
    );
    expect(restored, isFalse);
  });
  test('wallet cancellation with activity result returns to app', () async {
    var restored = false;
    await finishWalletHandoff(
      close: () async {},
      walletReturned: Future.value(true),
      operationCompleted: false,
      restoreApp: () async {
        restored = true;
      },
    );
    expect(restored, isTrue);
  });
  test('foreground recovery failure cannot invalidate successful payment',
      () async {
    await expectLater(
        finishWalletHandoff(
          close: () async {},
          walletReturned: Future.value(true),
          operationCompleted: true,
          restoreApp: () async {
            throw StateError('Android denied foreground');
          },
        ),
        completes);
  });
  for (final tier in [AccessTier.sol, AccessTier.skr]) {
    test('existing ${tier.name} receipt survives update unchanged', () async {
      final receipt =
          PurchaseReceipt('existing-owner', 'existing-signature', tier);
      FlutterSecureStorage.setMockInitialValues({
        'degen_mainnet_receipt_v1': jsonEncode(receipt.toJson()),
      });
      final service = PaymentService();
      await service.load();
      expect(service.receipt?.tier, tier);
      expect(service.receipt?.signature, 'existing-signature');
      expect(service.receipt?.wallet, 'existing-owner');
    });
  }
  for (final locale in languages) {
    testWidgets(
        'successful purchase stays in app and Continue closes only sheet $locale',
        (tester) async {
      final service = PaymentService()
        ..receipt = const PurchaseReceipt(
            'existing-owner', 'existing-signature', AccessTier.skr);
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: Builder(
                  builder: (context) => TextButton(
                      onPressed: () => showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: PurchasePanel(
                                      service: service,
                                      locale: locale,
                                      onChanged: () {},
                                      onPreview: (_) {})))),
                      child: const Text('Degen Detox home'))))));
      await tester.tap(find.text('Degen Detox home'));
      await tester.pumpAndSettle();
      expect(find.textContaining(tr('owned', locale)), findsWidgets);
      final continueButton = find.text(tr('continueInApp', locale));
      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.byType(PurchasePanel), findsNothing);
      expect(find.text('Degen Detox home'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
