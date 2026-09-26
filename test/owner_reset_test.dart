import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:degen_detox/degen/payments.dart';
import 'package:degen_detox/degen/domain.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const storage = FlutterSecureStorage();
  const receiptKey = 'degen_mainnet_receipt_v1';
  const pendingKey = 'degen_pending_v1';
  final old = jsonEncode(
      const PurchaseReceipt('payer', 'old-signature', AccessTier.sol).toJson());
  setUp(() => FlutterSecureStorage.setMockInitialValues(
      {receiptKey: old, 'unrelated': 'keep'}));
  test('public build never allows local entitlement reset', () async {
    if (ownerTestTools) return;
    final service = PaymentService();
    await service.load();
    await expectLater(
        service.resetLocalProForOwnerTest(), throwsA(isA<PaymentFailure>()));
    expect(await storage.read(key: receiptKey), old);
  });
  test(
      'owner reset only clears local entitlement and preserves backup across restart',
      () async {
    if (!ownerTestTools) return;
    final service = PaymentService();
    await service.load();
    await service.resetLocalProForOwnerTest();
    expect(service.receipt, isNull);
    expect(await storage.read(key: receiptKey), isNull);
    expect(await storage.read(key: 'degen_owner_test_receipt_backup_v1'), old);
    expect(await storage.read(key: 'unrelated'), 'keep');
    final reopened = PaymentService();
    await reopened.load();
    expect(reopened.receipt, isNull);
    // No startup migration wipes a subsequent SKR purchase.
    final skr = jsonEncode(
        const PurchaseReceipt('payer', 'new-skr', AccessTier.skr).toJson());
    await storage.write(key: receiptKey, value: skr);
    final next = PaymentService();
    await next.load();
    expect(next.receipt!.tier, AccessTier.skr);
    expect(await storage.read(key: receiptKey), skr);
  });
  test('owner reset refuses an unresolved payment even before service.load',
      () async {
    if (!ownerTestTools) return;
    await storage.write(key: pendingKey, value: '{"signature":"pending"}');
    final service = PaymentService();
    await expectLater(
        service.resetLocalProForOwnerTest(), throwsA(isA<PaymentFailure>()));
    expect(await storage.read(key: receiptKey), old);
    expect(await storage.read(key: pendingKey), isNotNull);
    expect(service.busy, isFalse);
  });
}
