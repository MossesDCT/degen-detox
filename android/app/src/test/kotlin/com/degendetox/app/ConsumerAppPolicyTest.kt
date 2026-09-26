package com.degendetox.app

import org.junit.Assert.*
import org.junit.Test

class ConsumerAppPolicyTest {
    @Test fun consumerGoogleAppsAreSelectableEvenWhenPreinstalled() {
        for (pkg in listOf("com.google.android.youtube", "com.google.android.gm",
            "com.android.chrome", "com.google.android.apps.youtube.music",
            "com.google.android.apps.photos", "com.google.android.apps.maps",
            "com.google.android.apps.docs")) {
            assertTrue(pkg, ConsumerAppPolicy.allowSystemPackage(pkg))
        }
    }
    @Test fun essentialAndUnknownSystemPackagesStayProtected() {
        for (pkg in listOf("com.android.settings", "com.android.systemui",
            "com.google.android.gms", "com.android.vending", "com.android.phone",
            "com.google.android.dialer", "com.google.android.apps.nexuslauncher",
            "com.solanamobile.seedvault", "com.google.android.unknown",
            "com.google.android.youtube.fake", "com.degendetox.app")) {
            assertFalse(pkg, ConsumerAppPolicy.allowSystemPackage(pkg))
        }
    }
}
