# Degen Detox v0.6 release record

## Artifact

- Version `0.6.0+6`; production flavor; ARM64; package `com.degendetox.app`.
- APK: 21,482,529 bytes.
- SHA-256: `7b502be673a2788a973f5e37f89b03704ef049c1f92525c1854eaa8278c7e11b`.
- Signing certificate SHA-256: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`, unchanged development certificate.
- Delivery ZIP contains exactly one APK. In-place update; do not uninstall or clear data.
- Merchant, SOL/SKR prices, secure receipt keys and v0.5 wallet handoff implementation unchanged.

## Changes

- Permission onboarding: concise disclosure, explicit consent, optional restricted-settings help with a highlighted three-dot menu schematic and direct own-App-info button. Actual permission/service state refreshed on resume. Ready state hides setup.
- Optional AOSP accessibility service detail action uses the flattened ComponentName string expected by Settings. Unsupported OEM route falls back to public ACTION_ACCESSIBILITY_SETTINGS. This is navigation only, never a restriction bypass.
- Root cause of early blocker notice removal: GLOBAL_ACTION_HOME generated a launcher event, and the old `else` branch removed the overlay on every nonblocked app event, including that launcher event.
- HOME and own overlay events now retain the notice. Ten-second cancellable deadline, immediate dismiss button, ticking remaining time, cleanup on expiry/lock, and other-app/system-UI priority. Dismissal does not alter the block schedule.
- Explicit HOME package-visibility query supports detecting installed launchers.
- Searchable, virtualized installed-app picker with icons, case-insensitive name/package filtering, selected-only filter, deduplication, loading/error/retry states and draft selection.
- Selected app names/icons now visible in Morning Shield; saved label fallback supports subsequent launches. Existing package IDs preserved.
- All new Flutter and native overlay strings cover EN/LT/ES/FR/DE/KO.

## Checks

- `flutter analyze lib test`: no issues.
- `flutter test --reporter expanded`: 74 passing.
- `:app:testProductionReleaseUnitTest`: 11 passing, zero failures/errors.
- `flutter build apk --release --flavor production --target-platform android-arm64`: successful.
- `flutter build web --release --no-wasm-dry-run`: successful.
- APK signature and package/version checked with apksigner and aapt.
- Browser regression via Playwright: search with actual keyboard input, empty search, clear, selected-only filter, save, selected-name chip, cancelled draft, existing breathing/impulse/grass/settings/language/theme flows. Zero page errors.
- Visually inspected mobile search and selected-list screenshots. Desktop/mobile home captures retained.
- Browser cannot run native Android permissions/overlays. Those are covered by bridge/widget/policy tests and source inspection, not by a claim of actual Seeker operation.

## Remaining device checks

User previously confirmed blocker works and a real purchase unlocked Pro. v0.6 permission deep link and actual overlay duration are not physically tested by the agent. Test update in place, existing entitlement, selection persistence, 10-second notice, manual dismissal, other-app/system safety, and Settings routing. Do not repurchase for testing.

## Platform references

- Restricted settings and user confirmation: [Google Android help](https://support.google.com/android/answer/12623953?hl=en).
- Detail action reads flattened component string and enforces service restrictions: [AOSP AccessibilityDetailsSettingsFragment](https://android.googlesource.com/platform/packages/apps/Settings/+/refs/heads/master/src/com/android/settings/accessibility/AccessibilityDetailsSettingsFragment.java).
- Installation source affects restricted settings: [Android Authority explanation](https://www.androidauthority.com/android-15-restricted-settings-sideloading-3481098/).

No concrete claim is made about the exact installer or permission history of Cortisol Zero on the user's current phone.
