package com.degendetox.app

import android.app.AlarmManager
import android.app.AppOpsManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.net.Uri
import android.os.Build
import android.os.Process
import android.provider.Settings
import org.json.JSONArray
import java.util.Calendar
import android.text.TextUtils
import android.util.Base64
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.util.concurrent.TimeUnit

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        // Android 12+ (API 31): transition from the system launch screen to Flutter.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            splashScreen.setOnExitAnimationListener { splashScreenView ->
                splashScreenView.remove()
            }
        }
        super.onCreate(savedInstanceState)
    }

    private val channelName = "com.degendetox.app/app_blocker"

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getInstalledApps" -> handleGetInstalledApps(result)
                    "checkPermissions" -> handleCheckPermissions(result)
                    "requestAccessibilityPermission" -> handleRequestAccessibility(result)
                    "openAppDetails" -> {
                        try {
                            startActivity(Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                                Uri.parse("package:$packageName")))
                            result.success(true)
                        } catch (e: Exception) {
                            result.error("SETTINGS_ERROR", e.message, null)
                        }
                    }
                    "startBlocking" -> handleStartBlocking(call, result)
                    "stopBlocking" -> handleStopBlocking(result)
                    "isBlockingActive" -> handleIsBlockingActive(result)
                    "scheduleBlocking" -> handleScheduleBlocking(call, result)
                    "cancelSchedule" -> handleCancelSchedule(result)
                    "isScheduleActive" -> handleIsScheduleActive(result)
                    "setGrass" -> {
                        val h = call.argument<Int>("hours") ?: 0
                        if (h !in 1..8) result.error("INVALID_HOURS", "1..8 required", null)
                        else {
                            GrassSchedule.schedule(this, h, call.argument<String>("title") ?: "Touch Grass",
                                call.argument<String>("body") ?: "")
                            result.success(true)
                        }
                    }
                    "cancelGrass" -> { GrassSchedule.cancel(this); result.success(true) }
                    "grassLaunch" -> {
                        val open = intent.getBooleanExtra("open_grass", false)
                        intent.removeExtra("open_grass")
                        result.success(open)
                    }
                    "testGrass" -> {
                        val i = Intent(this, GrassReminderReceiver::class.java).setAction("com.degendetox.app.GRASS_TEST")
                        val pi = PendingIntent.getBroadcast(this, 9011, i,
                            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
                        (getSystemService(Context.ALARM_SERVICE) as AlarmManager)
                            .setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, System.currentTimeMillis() + 10000, pi)
                        result.success(true)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun handleGetInstalledApps(result: MethodChannel.Result) {
        try {
            val pm = packageManager
            val mainIntent = Intent(Intent.ACTION_MAIN).apply {
                addCategory(Intent.CATEGORY_LAUNCHER)
            }
            @Suppress("DEPRECATION")
            val resolveInfos = pm.queryIntentActivities(mainIntent, 0)

            val ownPackage = applicationContext.packageName
            val apps = mutableListOf<Map<String, String>>()

            for (info in resolveInfos) {
                val pkg = info.activityInfo.packageName
                if (pkg == ownPackage || !BlockSafety.allowed(this, pkg)) continue

                val appInfo = try {
                    pm.getApplicationInfo(pkg, 0)
                } catch (e: Exception) {
                    continue
                }

                val appName = pm.getApplicationLabel(appInfo).toString()
                val iconBase64 = try {
                    val drawable = pm.getApplicationIcon(appInfo)
                    drawableToBase64(drawable)
                } catch (e: Exception) {
                    ""
                }

                apps.add(
                    mapOf(
                        "packageName" to pkg,
                        "appName" to appName,
                        "icon" to iconBase64
                    )
                )
            }

            apps.sortBy { it["appName"]?.lowercase() }
            result.success(apps)
        } catch (e: Exception) {
            result.error("GET_APPS_ERROR", e.message, null)
        }
    }

    private fun drawableToBase64(drawable: Drawable): String {
        val bitmap = if (drawable is BitmapDrawable && drawable.bitmap != null) {
            drawable.bitmap
        } else {
            val width = if (drawable.intrinsicWidth > 0) drawable.intrinsicWidth else 48
            val height = if (drawable.intrinsicHeight > 0) drawable.intrinsicHeight else 48
            val bmp = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
            val canvas = Canvas(bmp)
            drawable.setBounds(0, 0, canvas.width, canvas.height)
            drawable.draw(canvas)
            bmp
        }

        val scaled = Bitmap.createScaledBitmap(bitmap, 96, 96, true)
        val stream = ByteArrayOutputStream()
        scaled.compress(Bitmap.CompressFormat.PNG, 100, stream)
        val bytes = stream.toByteArray()
        return Base64.encodeToString(bytes, Base64.NO_WRAP)
    }

    // ── Permission checks ──────────────────────────────────────────────────────

    private fun handleCheckPermissions(result: MethodChannel.Result) {
        val hasAccessibility = hasAccessibilityPermission()
        result.success(
            mapOf(
                "hasAccessibilityPermission" to hasAccessibility,
                "serviceConnected" to BlockerAccessibilityService.isRunning
            )
        )
    }

    /**
     * Checks whether our BlockerAccessibilityService is enabled in system settings.
     * Reads Settings.Secure for the enabled accessibility services string.
     */
    private fun hasAccessibilityPermission(): Boolean {
        val expectedService = android.content.ComponentName(this, BlockerAccessibilityService::class.java)
        val enabledServices = Settings.Secure.getString(
            contentResolver,
            Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES
        ) ?: return false
        val colonSplitter = TextUtils.SimpleStringSplitter(':')
        colonSplitter.setString(enabledServices)
        while (colonSplitter.hasNext()) {
            val component = android.content.ComponentName.unflattenFromString(colonSplitter.next())
            if (component == expectedService) {
                return true
            }
        }
        return false
    }

    // ── Permission requests ────────────────────────────────────────────────────

    private fun handleRequestAccessibility(result: MethodChannel.Result) {
        try {
            val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
            result.success(true)
        } catch (e: Exception) {
            result.error("ACCESSIBILITY_ERROR", e.message, null)
        }
    }

    // ── Blocking control ───────────────────────────────────────────────────────

    /**
     * Starts a bounded session through the user-enabled Accessibility service.
     */
    private fun handleStartBlocking(call: MethodCall, result: MethodChannel.Result) {
        try {
            val blockedPackages = call.argument<List<String>>("blockedPackages")?.filter { BlockSafety.allowed(this, it) }
            val durationMinutes = call.argument<Int>("durationMinutes")

            if (blockedPackages == null || durationMinutes == null) {
                result.error("INVALID_ARGS", "blockedPackages and durationMinutes required", null)
                return
            }
            if (durationMinutes !in 1..240 || blockedPackages.isEmpty()) {
                result.error("INVALID_ARGS", "Invalid duration or apps", null); return
            }
            getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE).edit()
                .putBoolean("flutter.blocker_schedule_active", false).apply()
            cancelAlarm(this)

            if (!BlockerAccessibilityService.isRunning) {
                result.error("ACCESSIBILITY_REQUIRED", "Enable Accessibility first", null); return
            }
            BlockerAccessibilityService.blockedPackages = blockedPackages
            BlockerAccessibilityService.blockEndTimeMs =
                System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(durationMinutes.toLong())
            BlockerAccessibilityService.isBlockingActive = true

            result.success(true)
        } catch (e: Exception) {
            result.error("START_ERROR", e.message, null)
        }
    }

    private fun handleStopBlocking(result: MethodChannel.Result) {
        try {
            // Stop accessibility-based blocking
            if (BlockerAccessibilityService.isBlockingActive) {
                BlockerAccessibilityService.stopFromOutside()
            }

            result.success(true)
        } catch (e: Exception) {
            result.error("STOP_ERROR", e.message, null)
        }
    }

    private fun handleIsBlockingActive(result: MethodChannel.Result) {
        val active = BlockerAccessibilityService.isBlockingActive
        result.success(active)
    }

    // ── Schedule-based blocking ────────────────────────────────────────────

    /**
     * Schedules daily blocking, starting immediately if already inside the window.
     * Blocking starts at wakeHour:wakeMinute and lasts durationHours.
     */
    private fun handleScheduleBlocking(call: MethodCall, result: MethodChannel.Result) {
        try {
            val blockedPackages = call.argument<List<String>>("blockedPackages")?.filter { BlockSafety.allowed(this, it) }
            val wakeHour = call.argument<Int>("wakeHour")
            val wakeMinute = call.argument<Int>("wakeMinute")
            val durationHours = call.argument<Int>("durationHours")

            if (blockedPackages == null || wakeHour == null ||
                wakeMinute == null || durationHours == null) {
                result.error("INVALID_ARGS", "All args required", null)
                return
            }
            if (blockedPackages.isEmpty() || wakeHour !in 0..23 ||
                wakeMinute !in 0..59 || durationHours !in 1..4) {
                result.error("INVALID_ARGS", "Invalid morning plan", null); return
            }
            if (!hasAccessibilityPermission() || !BlockerAccessibilityService.isRunning) {
                result.error("ACCESSIBILITY_REQUIRED", "Enable and connect Accessibility first", null)
                return
            }

            // Save schedule to SharedPreferences
            val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            prefs.edit()
                .putString("flutter.blocker_packages", JSONArray(blockedPackages).toString())
                .putInt("flutter.blocker_wake_hour", wakeHour)
                .putInt("flutter.blocker_wake_minute", wakeMinute)
                .putInt("flutter.blocker_duration_hours", durationHours)
                .putBoolean("flutter.blocker_schedule_active", true)
                .apply()

            BlockSchedule.refresh(this)

            result.success(true)
        } catch (e: Exception) {
            result.error("SCHEDULE_ERROR", e.message, null)
        }
    }

    private fun handleCancelSchedule(result: MethodChannel.Result) {
        try {
            val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            prefs.edit().putBoolean("flutter.blocker_schedule_active", false).apply()
            cancelAlarm(this)

            // Also stop any active blocking
            if (BlockerAccessibilityService.isBlockingActive) {
                BlockerAccessibilityService.stopFromOutside()
            }
            result.success(true)
        } catch (e: Exception) {
            result.error("CANCEL_ERROR", e.message, null)
        }
    }

    private fun handleIsScheduleActive(result: MethodChannel.Result) {
        val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        result.success(prefs.getBoolean("flutter.blocker_schedule_active", false))
    }

    companion object {
        fun scheduleAlarm(context: Context, triggerAtMs: Long) {
            val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
            val intent = Intent(context, BlockerAlarmReceiver::class.java)
            val pi = PendingIntent.getBroadcast(
                context, 7777, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            // Use canScheduleExactAlarms check for Android 12+
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && am.canScheduleExactAlarms()) {
                am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAtMs, pi)
            } else if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
                am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAtMs, pi)
            } else {
                // Fallback: inexact alarm (may be off by a few minutes)
                am.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAtMs, pi)
            }
        }

        fun cancelAlarm(context: Context) {
            val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
            val intent = Intent(context, BlockerAlarmReceiver::class.java)
            val pi = PendingIntent.getBroadcast(
                context, 7777, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            am.cancel(pi)
        }
    }
}
