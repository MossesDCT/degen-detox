# Degen Detox

Flutter Android wellbeing app for the crypto community. Version 0.1.0 is an implementation milestone and interactive design preview, not a production release.

## Run

Tested with Flutter 3.41.4 / Dart 3.11.1.

```sh
flutter pub get
flutter test
flutter analyze lib/degen lib/main.dart test
flutter run
flutter build web --release
```

An Android SDK is required for `flutter build apk`. A signed Android build and physical-device tests have not yet been completed.

## Implementation

- New entry point: `lib/main.dart`. The old Cortisol Zero navigation and Play Billing initialization are not launched.
- New application: `lib/degen/`. Green Manrope-based interface, dark/light themes, phone and desktop layouts.
- Six interface languages: English, Lithuanian, Spanish, French, German, Korean.
- Free: breathing sessions, localized evidence-linked education, local Impulse Check.
- Pro preview: wake time, 1–4 hour morning schedule, app chooser, 20 localized recipes, Trading Wind-down.
- SKR Pro preview: 1–8 hour Touch Grass interval and animated grass experience.
- Original Android blocking services retained under `com.degendetox.app`, awaiting integration, safety audit and real-device validation.
- Notification adapter prepares a seven-day schedule. Notification permission, cold launch, replenishment, reboot and battery behavior require end-to-end integration/testing.

## Payment and access safety

No wallet connection or SOL/SKR transaction is implemented in this build. No payment is requested or simulated as successful. The explicitly labeled preview tier is temporary and does not create a paid entitlement.

`AccessPolicy.pro` and `.grass` use only verified access. Preview unlocks UI through `.showPro` and `.showGrass`. Native blocking and notification scheduling fail closed because no verified receipt is available.

Production integration requires wallet signing, an independently verified receipt, exact network and token mint validation, recipient and amount checks, duplicate-proof attribution, confirmation/finality handling, restore access and SKR-specific entitlements. A token symbol is not an identity check.

## Content and privacy

New visible educational material links to supporting sources. Legacy recipe health-benefit and cortisol-percentage claims are not shown; recipes retain titles, ingredients and instructions only. No measured hormone reductions are promised.

Native preferences and optional Impulse Check notes use local SharedPreferences, not encrypted secure storage. Browser preview state is session-only. No analytics is initialized in the new entry point. Legacy dependencies and permissions remain to be minimized and audited before release.

Files `PRIVACY_POLICY.md` and `TERMS_OF_SERVICE.md` are inherited historical documents, NOT approved Degen Detox legal policies. They must be replaced before publication. Release signing still needs a production key; never publish debug-signed builds.

## Provenance and eligibility

See `PROVENANCE.md`. Reusing Cortisol Zero must be disclosed; this repository is not evidence that all underlying code is new. Hackathon eligibility is unresolved until the organizers confirm in writing.

## Assets

- Grass image: generated specifically for Degen Detox.
- Degen mark: original vector artwork.
- Manrope: bundled with `assets/fonts/Manrope-OFL.txt`.
- Legacy Nunito and source assets: inherited from the supplied Cortisol Zero project; retain and review licensing before distribution.
