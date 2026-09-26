import 'dart:async';
import 'package:flutter/services.dart';

/// Observe immediately so a launch error cannot become an unhandled async error.
Future<bool> observeWalletReturn(Future<void> activity) =>
    activity.then((_) => true, onError: (Object _, StackTrace __) => false);

/// Orderly session shutdown followed by a bounded return to the SAME Android
/// activity. Neither UI cleanup nor a platform focus error can mask the original
/// signing result or discard the pending transaction persisted by PaymentService.
Future<void> finishWalletHandoff({
  required Future<void> Function() close,
  required Future<bool> walletReturned,
  required bool operationCompleted,
  Future<void> Function()? restoreApp,
  Duration closeTimeout = const Duration(seconds: 6),
  Duration returnTimeout = const Duration(seconds: 2),
}) async {
  try {
    await close().timeout(closeTimeout);
  } catch (_) {
    // Continue returning to the app even when socket teardown fails.
  }
  var returned = false;
  try {
    returned = await walletReturned.timeout(returnTimeout);
  } catch (_) {
    // Some wallets do not send an Activity result on disconnect.
  }
  // Do not pull the user back after an abandoned/failed launch with no result.
  if (!operationCompleted && !returned) return;
  try {
    await (restoreApp ?? _restoreExistingActivity)()
        .timeout(const Duration(seconds: 2));
  } catch (_) {
    // A payment result must survive Android refusing a foreground request.
  }
}

Future<void> _restoreExistingActivity() async {
  await const MethodChannel('com.degendetox.app/app_blocker')
      .invokeMethod<void>('returnFromWallet');
}
