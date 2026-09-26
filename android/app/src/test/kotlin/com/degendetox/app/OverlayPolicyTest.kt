package com.degendetox.app

import org.junit.Assert.*
import org.junit.Test

class OverlayPolicyTest {
    private fun dismiss(pkg: String, locked: Boolean = false) = OverlayPolicy.dismissFor(
        pkg, "com.degendetox.app", setOf("com.android.launcher", "custom.home"),
        listOf("com.binance.dev", "com.twitter.android"), locked)

    @Test fun homeTransitionKeepsNotice() = assertFalse(dismiss("com.android.launcher"))
    @Test fun customLauncherKeepsNotice() = assertFalse(dismiss("custom.home"))
    @Test fun ownOverlayEventKeepsNotice() = assertFalse(dismiss("com.degendetox.app"))
    @Test fun repeatedBlockedAppKeepsNotice() = assertFalse(dismiss("com.binance.dev"))
    @Test fun dialerTakesPriority() = assertTrue(dismiss("com.android.dialer"))
    @Test fun settingsTakesPriority() = assertTrue(dismiss("com.android.settings"))
    @Test fun walletTakesPriority() = assertTrue(dismiss("com.solana.wallet"))
    @Test fun systemUITakesPriority() = assertTrue(dismiss("com.android.systemui"))
    @Test fun otherAppsTakePriority() = assertTrue(dismiss("com.example.notes"))
    @Test fun lockScreenAlwaysTakesPriority() = assertTrue(dismiss("com.android.launcher", true))
    @Test fun noticeIsBoundedToTenSeconds() = assertEquals(10_000L, OverlayPolicy.NOTICE_DURATION_MS)
}
