# Degen Detox v0.7 QA

## Coverage

- Configure: single sheet after repeated callback invocations; zero installed-app enumeration before opening. Immediate sheet with bounded native status loading.
- Package scan off Android main thread, shared home lookup and per-package deduplication before icon work. Native compilation and source inspection.
- Active block: countdown/deadline and selected list; no edit, duration, app selector, permissions shortcut or stop controls. Six-language widget tests.
- Native start/stop/cancel/reschedule endpoints call the same persisted-state guard before mutation. StrictBlockPolicy boundary tests; source review verifies placement.
- Restart/reconnect state derives from persisted schedule, not transient Flutter state. Real Seeker reboot acceptance remains pending.
- Race: native BLOCK_ACTIVE rejection does not persist proposed Flutter changes; UI refreshes to locked state. Widget test.
- Status failure: editing unavailable until retry succeeds. Widget test.
- Time: numeric only, first-touch select-all, valid 24h input, invalid ranges rejected, six-language widgets and browser keyboard interaction.
- Owner reset: compile-gated off by default, manual confirmation, secure receipt backup, refuses pending payments and concurrent work, preserves unrelated keys; new SKR receipt survives subsequent loads.
- Public build: reset method denied with default build flags.
- Existing payment verifier, receipt retention, wallet-return lifecycle, app search and other feature regressions retained.
- Physical device only: actual responsiveness, active-block endpoint behavior across reboot, keyboard behavior, real SKR payment and notification delivery.

## Safety and scope

No real payment made by agent. No automatic receipt wipe migration. No Android settings, emergency control, uninstall or system-level permission removal blocked. Strictness is in-app, not a claim of an unbreakable device lock.

The owner-test APK must not be used as the public store artifact. Build without DEGEN_OWNER_TEST_TOOLS for public distribution.
