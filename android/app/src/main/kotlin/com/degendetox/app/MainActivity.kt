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
        // Android 12+ (API 31): remove the system splash screen as soon as possible
        // so our Flutter video splash takes over immediately.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            splashScreen.setOnExitAnimationListener { splashScreenView ->
                splashScreenView.remove()
            }
        }
        super.onCreate(savedInstanceState)
    }

    private val channelName = "com.degendetox.app/app_blocker"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getInstalledApps" -> handleGetInstalledApps(result)
                    "checkPermissions" -> handleCheckPermissions(result)
                    "requestUsageStatsPermission" -> handleRequestUsageStats(result)
                    "requestOverlayPermission" -> handleRequestOverlay(result)
                    "requestAccessibilityPermission" -> handleRequestAccessibility(result)
                    "startBlocking" -> handleStartBlocking(call, result)
                    "stopBlocking" -> handleStopBlocking(result)
                    "isBlockingActive" -> handleIsBlockingActive(result)
                    "scheduleBlocking" -> handleScheduleBlocking(call, result)
                    "cancelSchedule" -> handleCancelSchedule(result)
                    "isScheduleActive" -> handleIsScheduleActive(result)
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
                if (pkg == ownPackage) continue

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
        val hasUsageStats = hasUsageStatsPermission()
        val hasOverlay = Settings.canDrawOverlays(this)
        val hasAccessibility = hasAccessibilityPermission()
        result.success(
            mapOf(
                "hasUsageStatsPermission" to hasUsageStats,
                "hasOverlayPermission" to hasOverlay,
                "hasAccessibilityPermission" to hasAccessibility
            )
        )
    }

    private fun hasUsageStatsPermission(): Boolean {
        val appOps = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = appOps.unsafeCheckOpNoThrow(
            AppOpsManager.OPSTR_GET_USAGE_STATS,
            Process.myUid(),
            packageName
        )
        return mode == AppOpsManager.MODE_ALLOWED
    }

    /**
     * Checks whether our BlockerAccessibilityService is enabled in system settings.
     * Reads Settings.Secure for the enabled accessibility services string.
     */
    private fun hasAccessibilityPermission(): Boolean {
        val expectedService = "$packageName/${BlockerAccessibilityService::class.java.name}"
        val enabledServices = Settings.Secure.getString(
            contentResolver,
            Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES
        ) ?: return false
        val colonSplitter = TextUtils.SimpleStringSplitter(':')
        colonSplitter.setString(enabledServices)
        while (colonSplitter.hasNext()) {
            val component = colonSplitter.next()
            if (component.equals(expectedService, ignoreCase = true)) {
                return true
            }
        }
        return false
    }

    // ── Permission requests ────────────────────────────────────────────────────

    private fun handleRequestUsageStats(result: MethodChannel.Result) {
        try {
            val intent = Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
            result.success(true)
        } catch (e: Exception) {
            result.error("USAGE_STATS_ERROR", e.message, null)
        }
    }

    private fun handleRequestOverlay(result: MethodChannel.Result) {
        try {
            val intent = Intent(
                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                Uri.parse("package:$packageName")
            )
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
            result.success(true)
        } catch (e: Exception) {
            result.error("OVERLAY_ERROR", e.message, null)
        }
    }

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
     * Starts blocking via BlockerAccessibilityService (if running) with fallback
     * to the legacy AppBlockerService foreground service.
     */
    private fun handleStartBlocking(call: MethodCall, result: MethodChannel.Result) {
        try {
            val blockedPackages = call.argument<List<String>>("blockedPackages")
            val durationMinutes = call.argument<Int>("durationMinutes")

            if (blockedPackages == null || durationMinutes == null) {
                result.error("INVALID_ARGS", "blockedPackages and durationMinutes required", null)
                return
            }

            if (BlockerAccessibilityService.isRunning) {
                // Primary path: use the AccessibilityService
                BlockerAccessibilityService.blockedPackages = blockedPackages
                BlockerAccessibilityService.blockEndTimeMs =
                    System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(durationMinutes.toLong())
                BlockerAccessibilityService.isBlockingActive = true
                // The instance starts its own end-timer
                // (accessed via the static stopFromOutside / startEndTimer pattern)
            } else {
                // Fallback: legacy UsageStats foreground service
                val intent = Intent(this, AppBlockerService::class.java).apply {
                    action = AppBlockerService.ACTION_START
                    putStringArrayListExtra(
                        AppBlockerService.EXTRA_BLOCKED_PACKAGES,
                        ArrayList(blockedPackages)
                    )
                    putExtra(AppBlockerService.EXTRA_DURATION_MINUTES, durationMinutes)
                }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    startForegroundService(intent)
                } else {
                    startService(intent)
                }
            }

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

            // Also stop legacy service if it happens to be running
            if (AppBlockerService.isRunning) {
                val intent = Intent(this, AppBlockerService::class.java).apply {
                    action = AppBlockerService.ACTION_STOP
                }
                startService(intent)
            }

            result.success(true)
        } catch (e: Exception) {
            result.error("STOP_ERROR", e.message, null)
        }
    }

    private fun handleIsBlockingActive(result: MethodChannel.Result) {
        val active = BlockerAccessibilityService.isBlockingActive || AppBlockerService.isRunning
        result.success(active)
    }

    // ── Schedule-based blocking ────────────────────────────────────────────

    /**
     * Schedules daily blocking. NEVER blocks immediately.
     * Blocking starts at wakeHour:wakeMinute and lasts durationHours.
     */
    private fun handleScheduleBlocking(call: MethodCall, result: MethodChannel.Result) {
        try {
            val blockedPackages = call.argument<List<String>>("blockedPackages")
            val wakeHour = call.argument<Int>("wakeHour")
            val wakeMinute = call.argument<Int>("wakeMinute")
            val durationHours = call.argument<Int>("durationHours")

            if (blockedPackages == null || wakeHour == null ||
                wakeMinute == null || durationHours == null) {
                result.error("INVALID_ARGS", "All args required", null)
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

            val now = System.currentTimeMillis()
            val todayWake = Calendar.getInstance().apply {
                set(Calendar.HOUR_OF_DAY, wakeHour)
                set(Calendar.MINUTE, wakeMinute)
                set(Calendar.SECOND, 0)
                set(Calendar.MILLISECOND, 0)
            }.timeInMillis
            val todayWakeEnd = todayWake + durationHours * 3600_000L

            android.util.Log.d("BlockerMain", "scheduleBlocking: now=$now todayWake=$todayWake todayWakeEnd=$todayWakeEnd packages=$blockedPackages")

            // Check if we are currently INSIDE today's blocking window
            if (now in todayWake..todayWakeEnd) {
                // We're in the window right now — activate blocking immediately
                android.util.Log.d("BlockerMain", "Currently IN blocking window — activating NOW")
                if (BlockerAccessibilityService.isRunning) {
                    BlockerAccessibilityService.blockedPackages = blockedPackages
                    BlockerAccessibilityService.blockEndTimeMs = todayWakeEnd
                    BlockerAccessibilityService.isBlockingActive = true
                }
                // Also schedule tomorrow
                val tomorrowWake = todayWake + 24 * 3600_000L
                scheduleAlarm(this, tomorrowWake)
                android.util.Log.d("BlockerMain", "Also scheduled tomorrow at $tomorrowWake")
            } else {
                // Outside window — schedule next wake time
                val nextWake = if (now < todayWake) todayWake else todayWake + 24 * 3600_000L
                scheduleAlarm(this, nextWake)
                android.util.Log.d("BlockerMain", "Outside window — alarm set for $nextWake")
            }

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
            if (AppBlockerService.isRunning) {
                val intent = Intent(this, AppBlockerService::class.java)
                intent.action = AppBlockerService.ACTION_STOP
                startService(intent)
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
