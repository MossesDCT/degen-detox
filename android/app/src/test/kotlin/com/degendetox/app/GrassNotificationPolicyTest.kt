package com.degendetox.app

import org.junit.Assert.*
import org.junit.Test

class GrassNotificationPolicyTest {
    @Test fun firstInstallUsesHighImportance() {
        assertEquals(4, GrassNotificationPolicy.importance(null))
        assertTrue(GrassNotificationPolicy.allowSound(false, false))
    }
    @Test fun migrationPreservesBlockedLowAndSilentChoices() {
        for (importance in 0..5) assertEquals(importance, GrassNotificationPolicy.importance(importance))
        assertFalse(GrassNotificationPolicy.allowSound(true, false))
        assertTrue(GrassNotificationPolicy.allowSound(true, true))
    }
    @Test fun newChannelAndStableResourceName() {
        assertNotEquals(GrassNotificationPolicy.PREVIOUS_CHANNEL, GrassNotificationPolicy.CHANNEL)
        assertEquals("touch_grass_birds_v1", GrassNotificationPolicy.CHANNEL)
        assertEquals("touch_grass_birds", GrassNotificationPolicy.SOUND_RESOURCE)
    }
}
