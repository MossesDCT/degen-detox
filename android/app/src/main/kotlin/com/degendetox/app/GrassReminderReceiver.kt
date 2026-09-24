package com.degendetox.app

import android.Manifest
import android.app.AlarmManager
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build

object GrassSchedule {
    const val ACTION = "com.degendetox.app.GRASS"
    private const val ID = 9010
    fun schedule(context: Context, hours: Int, title: String, body: String) {
        require(hours in 1..8)
        context.getSharedPreferences("degen_grass", Context.MODE_PRIVATE).edit()
            .putBoolean("active", true).putInt("hours", hours)
            .putString("title", title).putString("body", body).apply()
        next(context, hours * 3600000L)
    }
    fun next(context: Context, delay: Long) {
        val intent = Intent(context, GrassReminderReceiver::class.java).setAction(ACTION)
        val pi = PendingIntent.getBroadcast(context, ID, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        val am = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        am.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, System.currentTimeMillis() + delay, pi)
    }
    fun cancel(context: Context) {
        context.getSharedPreferences("degen_grass", Context.MODE_PRIVATE).edit()
            .putBoolean("active", false).apply()
        val pi = PendingIntent.getBroadcast(context, ID,
            Intent(context, GrassReminderReceiver::class.java).setAction(ACTION),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        (context.getSystemService(Context.ALARM_SERVICE) as AlarmManager).cancel(pi)
        (context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager).cancel(ID)
    }
    fun notify(context: Context) {
        if (Build.VERSION.SDK_INT >= 33 &&
            context.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) return
        val prefs = context.getSharedPreferences("degen_grass", Context.MODE_PRIVATE)
        val manager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val channel = "touch_grass_v2"
        if (Build.VERSION.SDK_INT >= 26) {
            manager.createNotificationChannel(NotificationChannel(channel, "Touch Grass",
                NotificationManager.IMPORTANCE_HIGH).apply { enableVibration(true) })
        }
        val open = Intent(context, MainActivity::class.java)
            .putExtra("open_grass", true)
            .addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP)
        val pi = PendingIntent.getActivity(context, ID, open,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        val builder = if (Build.VERSION.SDK_INT >= 26) Notification.Builder(context, channel)
            else Notification.Builder(context)
        manager.notify(ID, builder.setSmallIcon(R.drawable.ic_notification)
            .setContentTitle(prefs.getString("title", "Touch Grass"))
            .setContentText(prefs.getString("body", "A moment for yourself"))
            .setContentIntent(pi).setAutoCancel(true)
            .setCategory(Notification.CATEGORY_REMINDER)
            .setDefaults(Notification.DEFAULT_ALL).build())
    }
}

class GrassReminderReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        val prefs = context.getSharedPreferences("degen_grass", Context.MODE_PRIVATE)
        if (intent?.action == "com.degendetox.app.GRASS_TEST") {
            GrassSchedule.notify(context)
            return
        }
        if (!prefs.getBoolean("active", false)) return
        if (intent?.action == GrassSchedule.ACTION) GrassSchedule.notify(context)
        GrassSchedule.next(context, prefs.getInt("hours", 2).coerceIn(1, 8) * 3600000L)
    }
}
