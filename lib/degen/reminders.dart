import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'domain.dart';

/// Native receiver reschedules the next reminder after every alarm, including
/// when Flutter is not running. Android may delay inexact alarms in deep sleep.
class GrassReminders {
  static const _channel = MethodChannel('com.degendetox.app/app_blocker');
  bool ready = false;
  Future<void> init(VoidCallback openGrass) async {
    if (kIsWeb) return;
    ready = true;
    await checkLaunch(openGrass);
  }

  Future<void> checkLaunch(VoidCallback openGrass) async {
    if (kIsWeb) return;
    if (await _channel.invokeMethod<bool>('grassLaunch') == true) openGrass();
  }

  Future<bool> schedule(
      int hours, String title, String body, AccessPolicy access) async {
    if (kIsWeb || !ready || !access.grass || hours < 1 || hours > 8) {
      return false;
    }
    if (!await Permission.notification.request().isGranted) return false;
    await _channel.invokeMethod(
        'setGrass', {'hours': hours, 'title': title, 'body': body});
    await (await SharedPreferences.getInstance())
        .setInt('degen_grass_hours', hours);
    return true;
  }

  Future<void> test() async {
    if (kIsWeb || !await Permission.notification.request().isGranted) return;
    await _channel.invokeMethod('testGrass');
  }

  Future<void> cancel() async {
    if (kIsWeb) return;
    await _channel.invokeMethod('cancelGrass');
    await (await SharedPreferences.getInstance()).remove('degen_grass_hours');
  }
}
