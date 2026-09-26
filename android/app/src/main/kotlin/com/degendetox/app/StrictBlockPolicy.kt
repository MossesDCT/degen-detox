package com.degendetox.app

object StrictBlockPolicy {
    fun isActive(enabled: Boolean, endTimeMs: Long, nowMs: Long): Boolean =
        enabled && endTimeMs > nowMs
}
