package com.degendetox.app

import android.content.Context
import android.content.Intent
import android.content.pm.ApplicationInfo
import java.util.Calendar
import org.json.JSONArray

object BlockSafety {
    fun allowed(context: Context, pkg: String,
                knownInfo: ApplicationInfo? = null, knownHomes: Set<String>? = null): Boolean {
        if (pkg == context.packageName || pkg.startsWith("com.degendetox.app")) return false
        val p = pkg.lowercase()
        if (listOf("wallet", "solana", "seeker", "seedvault", "phantom", "solflare", "backpack")
                .any { p.contains(it) }) return false
        return try {
            val info = knownInfo ?: context.packageManager.getApplicationInfo(pkg, 0)
            if ((info.flags and ApplicationInfo.FLAG_SYSTEM) != 0 &&
                !ConsumerAppPolicy.allowSystemPackage(pkg)) return false
            if (knownHomes != null) return pkg !in knownHomes
            val homes = context.packageManager.queryIntentActivities(
                Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME), 0)
            homes.none { it.activityInfo.packageName == pkg }
        } catch (_: Exception) { false }
    }
}

object BlockSchedule {
    /** Calendar-day arithmetic preserves the configured local wake time across DST. */
    fun refresh(context: Context, scheduleNext: Boolean = true) {
        val prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        if (!prefs.getBoolean("flutter.blocker_schedule_active", false)) return
        val hour = prefs.getInt("flutter.blocker_wake_hour", 8).coerceIn(0, 23)
        val minute = prefs.getInt("flutter.blocker_wake_minute", 0).coerceIn(0, 59)
        val duration = prefs.getInt("flutter.blocker_duration_hours", 2).coerceIn(1, 4) * 3600000L
        val today = Calendar.getInstance().apply {
            set(Calendar.HOUR_OF_DAY, hour); set(Calendar.MINUTE, minute)
            set(Calendar.SECOND, 0); set(Calendar.MILLISECOND, 0)
        }
        val yesterday = (today.clone() as Calendar).apply { add(Calendar.DAY_OF_YEAR, -1) }
        val now = System.currentTimeMillis()
        val start = listOf(today.timeInMillis, yesterday.timeInMillis)
            .firstOrNull { now >= it && now < it + duration }
        val array = try { JSONArray(prefs.getString("flutter.blocker_packages", "[]")) }
            catch (_: Exception) { JSONArray() }
        val packages = (0 until array.length()).map { array.optString(it) }
            .filter { BlockSafety.allowed(context, it) }
        BlockerAccessibilityService.blockedPackages = packages
        BlockerAccessibilityService.isBlockingActive = start != null && packages.isNotEmpty()
        if (start != null) BlockerAccessibilityService.blockEndTimeMs = start + duration
        if (scheduleNext) {
            val next = (today.clone() as Calendar).apply {
                if (timeInMillis <= now) add(Calendar.DAY_OF_YEAR, 1)
            }
            MainActivity.scheduleAlarm(context, next.timeInMillis)
        }
    }
}
