package com.degendetox.app

/** Preinstalled consumer apps are not the same as critical Android components.
 * Unknown system packages remain protected; there is no broad "allow Google". */
object ConsumerAppPolicy {
    private val safePreinstalledApps = setOf(
        "com.google.android.youtube",
        "com.google.android.apps.youtube.music",
        "com.google.android.gm",
        "com.android.chrome",
        "com.google.android.apps.photos",
        "com.google.android.apps.maps",
        "com.google.android.apps.docs",
        "com.google.android.apps.docs.editors.docs",
        "com.google.android.apps.docs.editors.sheets",
        "com.google.android.apps.docs.editors.slides",
        "com.google.android.apps.magazines",
        "com.google.android.apps.books",
        "com.google.android.videos",
        "com.google.android.apps.translate",
        "com.google.android.apps.tachyon",
        "com.google.android.googlequicksearchbox"
    )
    fun allowSystemPackage(pkg: String): Boolean = pkg in safePreinstalledApps
}
