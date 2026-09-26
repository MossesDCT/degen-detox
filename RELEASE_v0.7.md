# Degen Detox v0.7 release record

## Owner-test artifact

- Version `0.7.0+7`, package `com.degendetox.app`, production flavor, ARM64.
- Delivered build enables `DEGEN_OWNER_TEST_TOOLS=true`. Real mainnet payments remain enabled; no QA entitlement override.
- Public distribution must omit that flag. No automatic entitlement-reset migration exists.
- APK size: 21,285,865 bytes.
- SHA-256: `7d17d9c9dd9f4e753b06a6ccd3f76689f0f1c3fae035df347bef7bdabea1bb9a`.
- Signature SHA-256: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`, same development certificate as earlier updates.
- ZIP contains one APK. Update in place; do not uninstall or clear app data.

## Changes and reasons

The Configure button awaited enumeration, icon decoding, scaling and PNG encoding of all installed apps before opening a sheet. Enumeration was also running on Android's main thread. v0.7 removes the scan from the opening path, opens a stateful sheet immediately, ignores duplicate opens, and moves enumeration to a single worker executor. Launcher lookup and duplicate-package work are reduced.

MorningShieldPanel checks persisted native status rather than trusting an editable Flutter draft. During an active block it displays the automatic deadline, ticking remaining time and actual native blocked-package list. Editing controls and both in-app stop buttons are removed. Start, stop, cancel and reschedule method-channel handlers all reject changes before the active deadline. Persisting Flutter configuration occurs only after native schedule acceptance, including a race-to-active rejection path.

The timer expires naturally; future daily scheduling is retained. The app does not block system settings, emergency functions, supported wallets, uninstallation or OS permission control. This is in-app strictness, not a tamper-proof device-management implementation. Existing accessibility overlay dismissal only hides the notice and does not cancel blocking.

The numeric wake-time dialog directly focuses input, selects the full two-digit value on first focus/touch, accepts 24-hour input and validates ranges. Short labels plus separate range hints avoid clipping on narrow phones.

The test-only Settings action asks for explicit confirmation and shows the existing wallet/signature. It backs up the receipt in secure storage, clears only the local entitlement and refuses pending/concurrent payment work. Existing blockchain history is not changed; no refund is issued. Block schedule, app selection and check-ins are not cleared. Optional Grass reminders are cancelled after the reset. New purchases are never cleared automatically on launch.

## Verification

- Flutter static analysis: no issues.
- Owner-flag full Flutter suite: 94 passing, including first-touch numeric entry in six languages, active-block readonly state, status failure/retry, native save race, immediate single-sheet opening with zero package scans, payment verification and owner reset.
- Focused changed-feature suite: 20 passing.
- Default-flag owner reset test validates reset is denied in public builds. Conditional test branches only run with their matching compile flag.
- Android JUnit: 17 passing, including 11 overlay policy tests and 6 strict deadline policy cases.
- Release APK builds; apksigner and package/version checks pass.
- Web release builds; Playwright regression ends with zero page errors. Actual keyboard input changes wake time, then list search/filter/save/cancel and existing feature flows pass.
- Mobile numeric entry screenshot visually inspected: labels fit without truncation, ranges visible, direct two-field input. Desktop/mobile home and list views retained.

## Not physically verified here

The user already confirmed v0.6's timed overlay behavior on Seeker. v0.7 native main-thread responsiveness, strict state across reboot/permission reconnect, real SKR checkout and notification delivery still require device acceptance. No real SOL/SKR payment was made by the build agent.
