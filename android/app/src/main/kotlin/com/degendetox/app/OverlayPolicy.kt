package com.degendetox.app

/** Pure policy: the HOME transition we trigger must not erase the notice.
 * Other apps, system UI and the lock screen still get immediate priority. */
object OverlayPolicy {
    const val NOTICE_DURATION_MS = 10_000L

    fun dismissFor(
        foreground: String,
        ownPackage: String,
        homePackages: Set<String>,
        blockedPackages: List<String>,
        locked: Boolean
    ): Boolean {
        if (locked) return true
        return foreground != ownPackage &&
            foreground !in homePackages &&
            foreground !in blockedPackages
    }
}
