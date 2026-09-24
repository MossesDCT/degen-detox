package com.degendetox.app

import android.animation.ValueAnimator
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.ActivityManager
import android.app.Service
import android.app.usage.UsageEvents
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.os.CountDownTimer
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.view.animation.AccelerateDecelerateInterpolator
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import java.util.concurrent.TimeUnit

/**
 * Overlay translated strings per locale.
 */
private data class OverlayStrings(
    val quote: String,
    val subtitle: String,
    val breathe: String
)

private val overlayTranslations = mapOf(
    "lt" to OverlayStrings(
        quote = "Pasaulis palauks.\nTavo nervų sistema\ntau padėkos.",
        subtitle = "Iki ryto fokuso pabaigos",
        breathe = "Kvėpuok lėtai ir giliai..."
    ),
    "en" to OverlayStrings(
        quote = "The world can wait.\nYour nervous system\nwill thank you.",
        subtitle = "Until morning focus ends",
        breathe = "Breathe slowly and deeply..."
    ),
    "es" to OverlayStrings(
        quote = "El mundo puede esperar.\nTu sistema nervioso\nte lo agradecerá.",
        subtitle = "Hasta que termine el enfoque matutino",
        breathe = "Respira lenta y profundamente..."
    ),
    "de" to OverlayStrings(
        quote = "Die Welt kann warten.\nDein Nervensystem\nwird es dir danken.",
        subtitle = "Bis der Morgenfokus endet",
        breathe = "Atme langsam und tief..."
    ),
    "fr" to OverlayStrings(
        quote = "Le monde peut attendre.\nVotre système nerveux\nvous remerciera.",
        subtitle = "Jusqu'à la fin du focus matinal",
        breathe = "Respirez lentement et profondément..."
    ),
    "ko" to OverlayStrings(
        quote = "세상은 기다릴 수 있어요.\n당신의 신경계가\n감사할 거예요.",
        subtitle = "아침 집중 시간 종료까지",
        breathe = "천천히 깊게 호흡하세요..."
    )
)

class AppBlockerService : Service() {

    companion object {
        const val ACTION_START = "com.degendetox.app.ACTION_START_BLOCKING"
        const val ACTION_STOP = "com.degendetox.app.ACTION_STOP_BLOCKING"
        const val EXTRA_BLOCKED_PACKAGES = "blocked_packages"
        const val EXTRA_DURATION_MINUTES = "duration_minutes"

        private const val CHANNEL_ID = "app_blocker_channel"
        private const val NOTIFICATION_ID = 9001
        private const val POLL_INTERVAL_MS = 400L
        private const val PREFS_KEY_LANGUAGE = "language_code"

        @Volatile
        var isRunning = false
            private set
    }

    /** Resolved overlay strings based on user locale from SharedPreferences. */
    private lateinit var overlayStr: OverlayStrings

    private var blockedPackages = listOf<String>()
    private var blockEndTimeMs = 0L

    private val handler = Handler(Looper.getMainLooper())
    private var pollRunnable: Runnable? = null

    private var windowManager: WindowManager? = null
    private var overlayView: View? = null
    private var countdownTimer: CountDownTimer? = null
    private var countdownTextView: TextView? = null
    private var breathCircle: View? = null
    private var breathAnimator: ValueAnimator? = null

    // Track last known foreground app to avoid flicker
    private var lastForegroundPackage: String? = null
    private var overlayShownForPackage: String? = null

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        createNotificationChannel()

        // Read language from SharedPreferences (same key Flutter uses)
        val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        val langCode = prefs.getString("flutter.$PREFS_KEY_LANGUAGE", "en") ?: "en"
        overlayStr = overlayTranslations[langCode] ?: overlayTranslations["en"]!!
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START -> {
                val packages = intent.getStringArrayListExtra(EXTRA_BLOCKED_PACKAGES) ?: arrayListOf()
                val durationMinutes = intent.getIntExtra(EXTRA_DURATION_MINUTES, 30)
                startBlocking(packages, durationMinutes)
            }
            ACTION_STOP -> {
                stopBlocking()
            }
        }
        return START_STICKY
    }

    private fun startBlocking(packages: List<String>, durationMinutes: Int) {
        blockedPackages = packages
        blockEndTimeMs = System.currentTimeMillis() + TimeUnit.MINUTES.toMillis(durationMinutes.toLong())
        isRunning = true

        val notification = buildNotification(durationMinutes)
        startForeground(NOTIFICATION_ID, notification)

        startPolling()
    }

    private fun stopBlocking() {
        isRunning = false
        stopPolling()
        removeOverlay()
        stopForeground(STOP_FOREGROUND_REMOVE)
        stopSelf()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "App Blocker",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Morning focus mode — blocking stressful apps"
                setShowBadge(false)
            }
            val nm = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            nm.createNotificationChannel(channel)
        }
    }

    private fun buildNotification(durationMinutes: Int): Notification {
        val builder = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Notification.Builder(this, CHANNEL_ID)
        } else {
            @Suppress("DEPRECATION")
            Notification.Builder(this)
        }

        return builder
            .setContentTitle("Degen Detox")
            .setContentText("🛡️ Blocking ${blockedPackages.size} apps for ${durationMinutes / 60}h ${durationMinutes % 60}m")
            .setSmallIcon(android.R.drawable.ic_lock_lock)
            .setOngoing(true)
            .build()
    }

    // ── Polling ──────────────────────────────────────────────────────────────

    private fun startPolling() {
        stopPolling()
        pollRunnable = object : Runnable {
            override fun run() {
                if (!isRunning) return

                // Check if time expired
                if (System.currentTimeMillis() >= blockEndTimeMs) {
                    stopBlocking()
                    return
                }

                val fg = getForegroundPackage()

                // Update last known foreground (only if we got a valid reading)
                if (fg != null) {
                    lastForegroundPackage = fg
                }

                val effectiveFg = lastForegroundPackage

                if (effectiveFg != null && blockedPackages.contains(effectiveFg)) {
                    // Blocked app is in foreground — show/keep overlay
                    if (overlayView == null) {
                        showOverlay()
                        overlayShownForPackage = effectiveFg
                    }
                    updateCountdownText()
                } else if (effectiveFg != null && !blockedPackages.contains(effectiveFg)) {
                    // User navigated away to a non-blocked app — remove overlay
                    if (overlayView != null) {
                        removeOverlay()
                        overlayShownForPackage = null
                    }
                }
                // If fg is null (no reading), keep current state to avoid flicker

                handler.postDelayed(this, POLL_INTERVAL_MS)
            }
        }
        handler.post(pollRunnable!!)
    }

    private fun stopPolling() {
        pollRunnable?.let { handler.removeCallbacks(it) }
        pollRunnable = null
    }

    private fun getForegroundPackage(): String? {
        // ── Method 1: UsageEvents (works for normal app launches) ──
        val usageStatsManager = getSystemService(Context.USAGE_STATS_SERVICE) as? UsageStatsManager

        if (usageStatsManager != null) {
            val endTime = System.currentTimeMillis()
            val startTime = endTime - 5000

            val usageEvents = usageStatsManager.queryEvents(startTime, endTime)
            var latestForegroundPackage: String? = null
            var latestTimestamp = 0L

            val event = UsageEvents.Event()
            while (usageEvents.hasNextEvent()) {
                usageEvents.getNextEvent(event)
                if (event.eventType == UsageEvents.Event.MOVE_TO_FOREGROUND ||
                    event.eventType == UsageEvents.Event.ACTIVITY_RESUMED) {
                    if (event.timeStamp >= latestTimestamp) {
                        latestTimestamp = event.timeStamp
                        latestForegroundPackage = event.packageName
                    }
                }
            }

            if (latestForegroundPackage != null) return latestForegroundPackage
        }

        // ── Method 2: getRunningTasks fallback ──
        // When switching via recent-apps, UsageEvents may not fire.
        // getRunningTasks is deprecated but still returns the top activity
        // on most Android devices.
        try {
            @Suppress("DEPRECATION")
            val am = getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager
            val tasks = am?.getRunningTasks(1)
            if (!tasks.isNullOrEmpty()) {
                return tasks[0].topActivity?.packageName
            }
        } catch (_: Exception) { }

        return null
    }

    // ── Overlay ──────────────────────────────────────────────────────────────

    private fun showOverlay() {
        if (overlayView != null) return

        val layout = buildOverlayLayout()
        overlayView = layout

        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            // STICKY flags: covers entire screen, intercepts all touch,
            // blocks back button by consuming key events
            WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                    WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
                    WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH,
            PixelFormat.OPAQUE
        )
        params.gravity = Gravity.TOP or Gravity.START
        params.x = 0
        params.y = 0

        try {
            windowManager?.addView(layout, params)
            startBreathAnimation()
        } catch (e: Exception) {
            overlayView = null
        }
    }

    private fun buildOverlayLayout(): View {
        val context: Context = this

        // ── Root container with opaque sage green background ──
        val root = FrameLayout(context).apply {
            setBackgroundColor(Color.parseColor("#B8F2BD"))
            isClickable = true
            isFocusable = true
        }

        // ── Breathing circle (behind content) ──
        val circleSize = dp(180)
        val circle = View(context).apply {
            val gd = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(Color.parseColor("#80A8E6B0")) // semi-transparent sage
            }
            background = gd
            alpha = 0.6f
        }
        breathCircle = circle
        val circleParams = FrameLayout.LayoutParams(circleSize, circleSize).apply {
            gravity = Gravity.CENTER_HORIZONTAL or Gravity.BOTTOM
            bottomMargin = dp(120)
        }
        root.addView(circle, circleParams)

        // ── Content column ──
        val content = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER_HORIZONTAL
            setPadding(dp(32), dp(80), dp(32), dp(40))
        }

        // App name
        val appName = TextView(context).apply {
            text = "Degen Detox"
            setTextColor(Color.parseColor("#1A4D1A"))
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f)
            typeface = Typeface.create("sans-serif-medium", Typeface.BOLD)
            gravity = Gravity.CENTER
            alpha = 0.6f
        }
        content.addView(appName, linearParams().apply {
            bottomMargin = dp(48)
        })

        // Main quote
        val quote = TextView(context).apply {
            text = overlayStr.quote
            setTextColor(Color.parseColor("#1A4D1A"))
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 26f)
            typeface = Typeface.create("sans-serif", Typeface.BOLD)
            gravity = Gravity.CENTER
            setLineSpacing(dp(6).toFloat(), 1f)
        }
        content.addView(quote, linearParams().apply {
            bottomMargin = dp(48)
        })

        // Countdown timer
        countdownTextView = TextView(context).apply {
            text = formatRemainingTime()
            setTextColor(Color.parseColor("#2D6E2D"))
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 52f)
            typeface = Typeface.MONOSPACE
            gravity = Gravity.CENTER
            letterSpacing = 0.1f
        }
        content.addView(countdownTextView, linearParams().apply {
            bottomMargin = dp(16)
        })

        // "Until morning focus ends"
        val subtitle = TextView(context).apply {
            text = overlayStr.subtitle
            setTextColor(Color.parseColor("#3D7E3D"))
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f)
            gravity = Gravity.CENTER
        }
        content.addView(subtitle, linearParams().apply {
            bottomMargin = dp(80)
        })

        // Breathing instruction
        val breathText = TextView(context).apply {
            text = overlayStr.breathe
            setTextColor(Color.parseColor("#4D8E4D"))
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f)
            gravity = Gravity.CENTER
            alpha = 0.7f
        }
        content.addView(breathText)

        val contentParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        root.addView(content, contentParams)

        // Intercept all touch events to prevent user from accessing app behind
        root.setOnTouchListener { _, _ -> true }

        return root
    }

    private fun startBreathAnimation() {
        breathAnimator?.cancel()

        breathAnimator = ValueAnimator.ofFloat(0.6f, 1.2f).apply {
            duration = 4000 // 4 seconds inhale
            repeatMode = ValueAnimator.REVERSE
            repeatCount = ValueAnimator.INFINITE
            interpolator = AccelerateDecelerateInterpolator()
            addUpdateListener { anim ->
                val scale = anim.animatedValue as Float
                breathCircle?.scaleX = scale
                breathCircle?.scaleY = scale
                breathCircle?.alpha = 0.3f + (scale - 0.6f) * 0.5f
            }
            start()
        }
    }

    private fun updateCountdownText() {
        countdownTextView?.text = formatRemainingTime()
    }

    private fun formatRemainingTime(): String {
        val remaining = blockEndTimeMs - System.currentTimeMillis()
        if (remaining <= 0) return "00:00:00"

        val hours = TimeUnit.MILLISECONDS.toHours(remaining)
        val minutes = TimeUnit.MILLISECONDS.toMinutes(remaining) % 60
        val seconds = TimeUnit.MILLISECONDS.toSeconds(remaining) % 60

        return String.format("%02d:%02d:%02d", hours, minutes, seconds)
    }

    private fun removeOverlay() {
        breathAnimator?.cancel()
        breathAnimator = null

        countdownTimer?.cancel()
        countdownTimer = null

        overlayView?.let {
            try {
                windowManager?.removeView(it)
            } catch (_: Exception) {
            }
        }
        overlayView = null
        countdownTextView = null
        breathCircle = null
    }

    private fun dp(value: Int): Int {
        return TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value.toFloat(),
            resources.displayMetrics
        ).toInt()
    }

    private fun linearParams(): LinearLayout.LayoutParams {
        return LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        )
    }

    override fun onDestroy() {
        stopPolling()
        removeOverlay()
        isRunning = false
        super.onDestroy()
    }
}
