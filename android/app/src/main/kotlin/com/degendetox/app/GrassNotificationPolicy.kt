package com.degendetox.app

/** Stable IDs: channel choices belong to the user after first creation. */
object GrassNotificationPolicy {
    const val CHANNEL = "touch_grass_birds_v1"
    const val PREVIOUS_CHANNEL = "touch_grass_v2"
    const val SOUND_RESOURCE = "touch_grass_birds"
    fun importance(previous: Int?): Int = previous ?: 4 // IMPORTANCE_HIGH
    fun allowSound(previousExists: Boolean, previousHasSound: Boolean): Boolean =
        !previousExists || previousHasSound
}
