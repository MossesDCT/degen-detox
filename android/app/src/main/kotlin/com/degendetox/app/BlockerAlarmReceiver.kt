package com.degendetox.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import org.json.JSONArray
import java.util.Calendar

/**
 * Fires at wake time each morning. Activates blocking on the
 * AccessibilityService and schedules the next day's alarm.
 */
class BlockerAlarmReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent?) {
        val prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        val active = prefs.getBoolean("flutter.blocker_schedule_active", false)
        if (!active) return

        val packagesJson = prefs.getString("flutter.blocker_packages", "[]") ?: "[]"
        val durationHours = prefs.getInt("flutter.blocker_duration_hours", 2)
        val wakeHour = prefs.getInt("flutter.blocker_wake_hour", 7)
        val wakeMinute = prefs.getInt("flutter.blocker_wake_minute", 0)

        // Parse packages
        val arr = JSONArray(packagesJson)
        val packages = (0 until arr.length()).map { arr.getString(it) }
        if (packages.isEmpty()) return

        // Activate blocking NOW (this receiver fires AT wake time)
        val endTimeMs = System.currentTimeMillis() + durationHours * 3600_000L
        BlockerAccessibilityService.blockedPackages = packages
        BlockerAccessibilityService.blockEndTimeMs = endTimeMs
        BlockerAccessibilityService.isBlockingActive = true

        // Schedule tomorrow's alarm
        val tomorrowWake = Calendar.getInstance().apply {
            set(Calendar.HOUR_OF_DAY, wakeHour)
            set(Calendar.MINUTE, wakeMinute)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
            add(Calendar.DAY_OF_YEAR, 1)
        }.timeInMillis
        MainActivity.scheduleAlarm(context, tomorrowWake)
    }
}
