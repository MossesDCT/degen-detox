package com.degendetox.app

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.AccessibilityServiceInfo
import android.animation.ValueAnimator
import android.content.Context
import android.graphics.Color
import android.graphics.PixelFormat
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.view.accessibility.AccessibilityEvent
import android.view.animation.AccelerateDecelerateInterpolator
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import java.util.concurrent.TimeUnit

// ── Overlay translated strings (local to BlockerAccessibilityService) ──────────

private data class AccessibilityOverlayStrings(
    val quote: String,
    val subtitle: String,
    val breathe: String
)

private val accessibilityOverlayTranslations = mapOf(
    "lt" to AccessibilityOverlayStrings(
        quote = "Pasaulis palauks.\nTavo nervų sistema\ntau padėkos.",
        subtitle = "Iki ryto fokuso pabaigos",
        breathe = "Kvėpuok lėtai ir giliai..."
    ),
    "en" to AccessibilityOverlayStrings(
        quote = "The world can wait.\nYour nervous system\nwill thank you.",
        subtitle = "Until morning focus ends",
        breathe = "Breathe slowly and deeply..."
    ),
    "es" to AccessibilityOverlayStrings(
        quote = "El mundo puede esperar.\nTu sistema nervioso\nte lo agradecerá.",
        subtitle = "Hasta que termine el enfoque matutino",
        breathe = "Respira lenta y profundamente..."
    ),
    "de" to AccessibilityOverlayStrings(
        quote = "Die Welt kann warten.\nDein Nervensystem\nwird es dir danken.",
        subtitle = "Bis der Morgenfokus endet",
        breathe = "Atme langsam und tief..."
    ),
    "fr" to AccessibilityOverlayStrings(
        quote = "Le monde peut attendre.\nVotre système nerveux\nvous remerciera.",
        subtitle = "Jusqu'à la fin du focus matinal",
        breathe = "Respirez lentement et profondément..."
    ),
    "ko" to AccessibilityOverlayStrings(
        quote = "세상은 기다릴 수 있어요.\n당신의 신경계가\n감사할 거예요.",
        subtitle = "아침 집중 시간 종료까지",
        breathe = "천천히 깊게 호흡하세요..."
    )
)

// ── BlockerAccessibilityService ────────────────────────────────────────────────

class BlockerAccessibilityService : AccessibilityService() {

    companion object {
        /** True while the service is connected and alive. */
        @Volatile
        var isRunning = false
            private set

        /** Set by MainActivity to start/stop blocking. */
        @Volatile
        var isBlockingActive = false

        /** Package names that are blocked. Set from MainActivity. */
        @Volatile
        var blockedPackages: List<String> = emptyList()

        /** Epoch ms when blocking should automatically expire. */
        @Volatile
        var blockEndTimeMs: Long = 0L

        private const val PREFS_KEY_LANGUAGE = "degen_language"

        /** Live reference to the running instance (null if service not connected). */
        @Volatile
        private var instance: BlockerAccessibilityService? = null

        /**
         * Called from MainActivity to deactivate blocking and dismiss the overlay.
         * Safe to call even if the service is not running.
         */
        fun stopFromOutside() {
            isBlockingActive = false
            instance?.removeOverlay()
            instance?.stopEndTimer()
        }
    }

    // ── Overlay views ──────────────────────────────────────────────────────────

    private var windowManager: WindowManager? = null
    private var overlayView: View? = null
    private var countdownTextView: TextView? = null
    private var breathCircle: View? = null
    private var breathAnimator: ValueAnimator? = null
    private var overlayShownForPackage: String? = null

    private lateinit var overlayStr: AccessibilityOverlayStrings

    // ── Handlers ───────────────────────────────────────────────────────────────

    private val handler = Handler(Looper.getMainLooper())
    private var countdownRunnable: Runnable? = null
    private var endTimerRunnable: Runnable? = null

    // ── Service lifecycle ──────────────────────────────────────────────────────

    override fun onServiceConnected() {
        super.onServiceConnected()
        isRunning = true
        instance = this
        windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager

        // Ensure we receive TYPE_WINDOW_STATE_CHANGED events
        serviceInfo = serviceInfo?.also { info ->
            info.eventTypes = AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED
            info.feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC
            info.notificationTimeout = 100
        }

        // Resolve overlay strings from the user's saved language preference
        val prefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        val langCode = prefs.getString("flutter.$PREFS_KEY_LANGUAGE", "en") ?: "en"
        overlayStr = accessibilityOverlayTranslations[langCode]
            ?: accessibilityOverlayTranslations["en"]!!
        BlockSchedule.refresh(this)
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (event?.eventType != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) return
        BlockSchedule.refresh(this, false)

        // If blocking was deactivated externally, clean up and return
        if (!isBlockingActive) {
            if (overlayView != null) removeOverlay()
            return
        }

        // Auto-expire: time is up
        if (System.currentTimeMillis() >= blockEndTimeMs) {
            isBlockingActive = false
            removeOverlay()
            return
        }

        val pkg = event.packageName?.toString() ?: return

        if (blockedPackages.contains(pkg) && BlockSafety.allowed(this, pkg)) {
            // Blocked app detected — kick to home, then briefly show overlay
            performGlobalAction(GLOBAL_ACTION_HOME)
            if (overlayView == null) {
                showOverlay()
                overlayShownForPackage = pkg
                // AUTO-DISMISS after 4 seconds — NEVER lock the phone
                handler.postDelayed({
                    removeOverlay()
                    overlayShownForPackage = null
                }, 4000)
            }
            updateCountdownText()
        } else {
            // ANY other app (including launcher, system UI) — remove overlay
            if (overlayView != null) {
                removeOverlay()
                overlayShownForPackage = null
            }
        }
    }

    override fun onInterrupt() {
        // Required override — no action needed
    }

    override fun onDestroy() {
        isRunning = false
        isBlockingActive = false
        instance = null
        stopCountdownUpdates()
        stopEndTimer()
        removeOverlay()
        super.onDestroy()
    }

    // ── End-timer (auto-stop when blockEndTimeMs is reached) ──────────────────

    fun startEndTimer() {
        stopEndTimer()
        val remaining = blockEndTimeMs - System.currentTimeMillis()
        if (remaining <= 0) {
            isBlockingActive = false
            removeOverlay()
            return
        }
        endTimerRunnable = Runnable {
            isBlockingActive = false
            removeOverlay()
        }
        handler.postDelayed(endTimerRunnable!!, remaining)
    }

    fun stopEndTimer() {
        endTimerRunnable?.let { handler.removeCallbacks(it) }
        endTimerRunnable = null
    }

    // ── Countdown text updater ────────────────────────────────────────────────

    private fun startCountdownUpdates() {
        stopCountdownUpdates()
        countdownRunnable = object : Runnable {
            override fun run() {
                if (overlayView == null) return
                updateCountdownText()
                handler.postDelayed(this, 1000L)
            }
        }
        handler.postDelayed(countdownRunnable!!, 1000L)
    }

    private fun stopCountdownUpdates() {
        countdownRunnable?.let { handler.removeCallbacks(it) }
        countdownRunnable = null
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

    // ── Overlay ───────────────────────────────────────────────────────────────

    private fun showOverlay() {
        if (overlayView != null) return

        val layout = buildOverlayLayout()
        overlayView = layout

        // Reserve 48dp at the bottom for Android navigation gesture area
        val screenHeight = resources.displayMetrics.heightPixels
        val navBarReserve = dp(48)
        val overlayHeight = screenHeight - navBarReserve

        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            overlayHeight,
            WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY,
            // FLAG_NOT_FOCUSABLE ensures home/back gestures always work
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL,
            PixelFormat.OPAQUE
        )
        params.gravity = Gravity.TOP or Gravity.START
        params.x = 0
        params.y = 0

        try {
            windowManager?.addView(layout, params)
            startBreathAnimation()
            startCountdownUpdates()
        } catch (e: Exception) {
            overlayView = null
        }
    }

    fun removeOverlay() {
        stopCountdownUpdates()

        breathAnimator?.cancel()
        breathAnimator = null

        overlayView?.let {
            try {
                windowManager?.removeView(it)
            } catch (_: Exception) {}
        }
        overlayView = null
        countdownTextView = null
        breathCircle = null
        overlayShownForPackage = null
    }

    private fun buildOverlayLayout(): View {
        val context: Context = this

        // ── Root — opaque sage green ──
        val root = FrameLayout(context).apply {
            setBackgroundColor(Color.parseColor("#B8F2BD"))
            isClickable = true
            // isFocusable must stay false so FLAG_NOT_FOCUSABLE remains effective
            isFocusable = false
        }

        // ── Breathing circle ──
        val circleSize = dp(180)
        val circle = View(context).apply {
            val gd = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(Color.parseColor("#80A8E6B0"))
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

        // App name label
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

        // Countdown
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

        // Subtitle
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

        root.addView(
            content,
            FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
            )
        )

        return root
    }

    private fun startBreathAnimation() {
        breathAnimator?.cancel()
        breathAnimator = ValueAnimator.ofFloat(0.6f, 1.2f).apply {
            duration = 4000
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

    // ── Dimension helpers ─────────────────────────────────────────────────────

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
}
