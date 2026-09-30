# Degen Detox: CLOCK IN reviewer guide

Current candidate: **v0.10.0+10**, implementation commit `01ef285`. Documentation-only preparation commits follow it. The founder registered solo, self-funded the project and reports no previous hackathon entry or award for this project.

## Start with the demo

[Watch the approved three-minute English Seeker demo](https://drive.google.com/file/d/1hRMbZsmwIDRrDhzMpnDLQufvyilikdYp/view?usp=drivesdk). It shows recorded app use and an existing activated SKR purchase, not a newly executed payment. Wallet details are masked.

## Choose the APK

| Review build | Package | Meaning |
|---|---|---|
| Mainnet v0.10 | `com.degendetox.app` | Real mainnet purchases; no owner reset or QA entitlement flags |
| QA v0.10 JUDGES | `com.degendetox.app.qa` | Paid features unlocked for review; real payment controls disabled |

Use QA to inspect features without spending funds. QA blocking is real native blocking, not a UI simulation. Both packages can coexist with separate data. The creator reports successful Mainnet tests on Seeker; the separate QA package was built and package-checked but does not yet have a confirmed physical-device acceptance report.

Both APKs are ARM64, minimum API 24, target API 36. They are release-optimized **development-signed review builds**, not finalized store releases. No store approval is claimed.

## Suggested walkthrough

1. Open the QA app and check the visible QA label.
2. Try breathing and education, then add sample Impulse Check ratings. Inspect descriptive history; it is not a diagnosis.
3. Read Morning Shield's permission disclosure. If testing blocking, explicitly enable Android Accessibility. A sideloaded APK may first require Android's “Allow restricted settings” flow.
4. Search for one nonessential app. Set a wake time just before the current time and a one-hour block. Do not select something needed during the test: there is no in-app early stop.
5. Open the chosen app and inspect the block notice. Android system controls remain available; this is not an unbreakable device lock.
6. Try recipe checkboxes and a personal fourth Trading Wind-down step.
7. Enable notifications, select a Touch Grass interval and use the 10-second test. Check locked-screen behavior, then tap the notification to open the scene. Sound and delivery depend on device permissions, notification volume, DND and Android background rules.

## Real payment review

Mainnet Pro costs 0.1 SOL; 500 SKR includes Pro plus Touch Grass. Existing SOL Pro customers may separately add the full 500 SKR option; the earlier payment is not credited. Network/account-creation costs are extra and disclosed. Never send money merely to review paid features.

Relevant code: `lib/degen/payments.dart`, `purchase_panel.dart`, `wallet_handoff.dart`, native Android integration and the vendored MWA patch. Client-side finalized RPC validation checks the payer, recipient, exact amounts, memo and applicable token details. Restoration uses wallet ownership proof. No proprietary contract, server-side licensing or tamper-proof client entitlement is claimed.

## Source and build

See the root README for build commands and `THIRD_PARTY_NOTICES.md` for dependencies. Use Flutter 3.41.4, Dart 3.11.1, JDK 17 and the Android SDK.

```sh
flutter pub get
flutter analyze lib test
flutter test
flutter build apk --release --flavor production --target-platform android-arm64
flutter build apk --release --flavor qa --dart-define=DEGEN_QA=true --target-platform android-arm64
```

Never enable `DEGEN_OWNER_TEST_TOOLS` in the submitted Mainnet build. A newly generated local debug certificate will differ from the supplied review APK certificate; do not expect an in-place update across different certificates.

## Origin and eligibility

This is a disclosed derivative of the creator's older Cortisol Zero v61 project. The organizers confirmed eligibility in writing after that disclosure and accepted the two labelled APKs and private GitHub access through ALIGN. See `PROVENANCE.md` and the root README; private correspondence is held by the creator.

## Integrity

| Artifact | SHA-256 |
|---|---|
| Mainnet | `1895e16d203781e727e65bccd489fed108f26fc623a28cc8030fd5256d96255a` |
| QA JUDGES | `a5fdab441b1f04adbe12d7b8a8c5a6b4586489f59b6e25b15e371763ab22cd94` |
| Signing certificate | `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6` |

Before a store release: owner-controlled signing, content-rights and native-language reviews, final operator/privacy details, broader device and independent payment-security testing remain necessary.
