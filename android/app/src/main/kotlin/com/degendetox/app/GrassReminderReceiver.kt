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
import android.media.AudioAttributes
import android.net.Uri

object GrassSchedule {
    const val ACTION = "com.degendetox.app.GRASS"
    private const val ID = 9010
    private val soundAttributes = AudioAttributes.Builder()
        .setUsage(AudioAttributes.USAGE_NOTIFICATION_EVENT)
        .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION).build()
    private val vibration = longArrayOf(0, 180, 100, 180)
    fun soundUri(context: Context): Uri = Uri.parse(
        "android.resource://${context.packageName}/raw/${GrassNotificationPolicy.SOUND_RESOURCE}")

    /** A new channel installs the requested birds, without defeating old mute
     * choices or overwriting subsequent user edits to the new channel. */
    fun ensureChannel(context: Context): String {
        val id = GrassNotificationPolicy.CHANNEL
        if (Build.VERSION.SDK_INT < 26) return id
        val manager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (manager.getNotificationChannel(id) != null) return id
        val previous = manager.getNotificationChannel(GrassNotificationPolicy.PREVIOUS_CHANNEL)
        val sound = when {
            !GrassNotificationPolicy.allowSound(previous != null, previous?.sound != null) -> null
            Build.VERSION.SDK_INT >= 30 && previous?.hasUserSetSound() == true -> previous.sound
            else -> soundUri(context)
        }
        manager.createNotificationChannel(NotificationChannel(id, "Touch Grass",
            GrassNotificationPolicy.importance(previous?.importance)).apply {
            setSound(sound, soundAttributes)
            vibrationPattern = previous?.vibrationPattern ?: vibration
            enableVibration(previous?.shouldVibrate() ?: true)
            lockscreenVisibility = previous?.lockscreenVisibility
                ?.takeIf { it == Notification.VISIBILITY_SECRET || it == Notification.VISIBILITY_PRIVATE }
                ?: Notification.VISIBILITY_PUBLIC
            setBypassDnd(false)
        })
        return id
    }
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
        val channel = ensureChannel(context)
        val open = Intent(context, MainActivity::class.java)
            .putExtra("open_grass", true)
            .addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP)
        val pi = PendingIntent.getActivity(context, ID, open,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        val builder = if (Build.VERSION.SDK_INT >= 26) Notification.Builder(context, channel)
            else Notification.Builder(context)
        // Pre-channel Android still gets the same sound, not DEFAULT_SOUND.
        if (Build.VERSION.SDK_INT < 26) {
            builder.setPriority(Notification.PRIORITY_HIGH)
                .setSound(soundUri(context), soundAttributes).setVibrate(vibration)
        }
        manager.notify(ID, builder.setSmallIcon(R.drawable.ic_notification)
            .setContentTitle(prefs.getString("title", "Touch Grass"))
            .setContentText(prefs.getString("body", "A moment for yourself"))
            .setContentIntent(pi).setAutoCancel(true)
            .setCategory(Notification.CATEGORY_REMINDER)
            .setVisibility(Notification.VISIBILITY_PUBLIC)
            .setOnlyAlertOnce(false).build())
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
