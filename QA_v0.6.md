# Degen Detox v0.6 QA inventory

## Claims and checks

- Search filters by case-insensitive trimmed app name/package; deduplicates package IDs. Dart unit and six-language widget tests; browser real typing.
- Selected-only filter preserves selections across search; deselect and save. Six-language widget tests; browser round trip.
- Explicit picker Save commits selection; closing cancels draft. Component callback and browser cancel check.
- Morning Shield displays names/icons, saved names fallback. Widget summary test and browser visual screenshot.
- Picker errors show retry and preserve selection. Mock bridge failure widget test.
- Ready permission state hides unnecessary consent/setup controls. Mock enabled/connected test.
- Restricted settings help conditional, App info direct action, return only checks actual permission. Mock channel and lifecycle test; physical OEM navigation still pending.
- Direct service details is an optional AOSP action with public settings fallback. Native build, source inspection; cannot claim Seeker navigation tested.
- HOME transition retains notice; dialer, system UI, wallets, settings, other apps and lock screen dismiss. Kotlin JUnit policy tests.
- Notice bounded to 10 seconds; tracked callback cancelled on dismiss, duplicate events do not extend deadline; expiration checked on tick. Constant test and native source inspection; visual duration needs physical Seeker.
- Existing entitlement and wallet return code untouched. Regression suite includes cached SOL/SKR receipt and wallet lifecycle tests; compare signature and version.

## Browser visual checks

390px mobile: normal home; picker search, no results, selected filter; summary and cancelled draft. Desktop 1440px: home. Check no overflow and no browser page errors. Permissions are deliberately Android-only in the shipping web preview; their normal/help/ready flow is tested with Flutter widget tests and native bridge mocks instead.

## Device acceptance still required

Seeker: update in place, Pro remains, list survives restart; search; allow restricted setting and service detail route; blocked-app notice readable for up to 10s, countdown ticks, immediate dismiss keeps block active. Emergency/system UI stays accessible. No live payment needed.
