package com.degendetox.app

import org.junit.Assert.*
import org.junit.Test

class StrictBlockPolicyTest {
    @Test fun refusesChangesBeforeDeadline() = assertTrue(StrictBlockPolicy.isActive(true, 2000, 1000))
    @Test fun releasesAtExactDeadline() = assertFalse(StrictBlockPolicy.isActive(true, 2000, 2000))
    @Test fun releasesAfterDeadline() = assertFalse(StrictBlockPolicy.isActive(true, 2000, 2001))
    @Test fun inactiveScheduleIsEditable() = assertFalse(StrictBlockPolicy.isActive(false, 2000, 1000))
    @Test fun staleEndTimeCannotActivateInactiveBlock() = assertFalse(StrictBlockPolicy.isActive(false, Long.MAX_VALUE, 1000))
    @Test fun restoredPersistedActiveWindowStillLocks() {
        assertTrue(StrictBlockPolicy.isActive(true, 14400000, 120000))
    }
}
