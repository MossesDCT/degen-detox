# Degen Detox

Android wellbeing app for the crypto community, built with Flutter 3.41.4, Dart 3.11.1 and JDK 17. Current review version: **0.10.0+10**. Solo, self-funded, AI-assisted development with hands-on Solana Seeker testing.

**Your morning belongs to you, not the market.** Morning Shield creates a chosen 1–4-hour boundary between waking up and social feeds, trading charts and alarming headlines. Start with breakfast, a breath or something positive before opening the market. This is digital-wellbeing support, not a claim of guaranteed cortisol reduction or addiction treatment.

## Start here: CLOCK IN judges

- [Public presentation: readable Google Docs version](https://docs.google.com/document/d/1j15pdTg-JvIWPIyru7ky2o1sPCmHgumvs2GiaqNcQ6w/mobilebasic)
- [Visual PDF pitch deck with screenshots](https://mossesdct.github.io/degen-detox-deck/Degen-Detox-CLOCK-IN-Deck.pdf)
- [Approved three-minute real-device demo](https://drive.google.com/file/d/1hRMbZsmwIDRrDhzMpnDLQufvyilikdYp/view?usp=drivesdk)
- [Mainnet APK: real purchases](https://drive.google.com/uc?id=1_F9o0LUrRtx_xBpP-b3aqX3-eIHQCYUL&export=download)
- [QA APK: unlocked features, no payment required](https://drive.google.com/uc?id=1L5U3hxeNwyJeD86yBX8mGMDHKvb5IoMm&export=download)
- [Current judge guide and APK integrity](hackathon/submission-2026-09-30/JUDGES_GUIDE.md)
- [Pre-existing code and new-work disclosure](PROVENANCE.md)
- [Third-party dependencies and notices](THIRD_PARTY_NOTICES.md)
- [Final form copy](hackathon/submission-2026-09-30/APPLICATION.md)
- [Maintainer review of the portal's exported-launcher finding](hackathon/submission-2026-09-30/SECURITY_FINDING_REVIEW.md)
- [Payment implementation and test evidence map](hackathon/submission-2026-09-30/PAYMENT_EVIDENCE.md)

The organizers confirmed eligibility in written correspondence received by the creator on 29 September 2026, after explicit disclosure of the older Cortisol Zero foundation. They also accepted separately labelled Mainnet and unlocked QA APKs and private-repository review via the ALIGN GitHub application. The creator retains the email; we do not publish private correspondence or claim that all code was newly written for this event.

This repository preserves its actual development history. The submitted v0.10 APK implementation is commit `01ef285`; later preparation changes are documentation only. On 30 September 2026, the owner explicitly authorized making this source repository public for code review and the hackathon's public-repository security module. Earlier deck and preparation references to private access describe the previous state. Publication is not a completed security audit.

## Pre-existing code, new work and libraries

| Category | Scope |
|---|---|
| **Pre-existing: Cortisol Zero v61** | Earlier Flutter/Android scaffolding, blocking-service foundations, localized recipe and breathing content, inherited audio and retained legacy screens. The baseline predates CLOCK IN. |
| **New: Degen Detox** | Crypto-specific product/UI, MWA SOL/SKR checkout, strict receipt checks and wallet-proof restoration, distinct SKR entitlement and upgrade path, wallet-return lifecycle fixes, native blocker UX/refinements, urge history, custom evening ritual, Touch Grass reminders and birdsong channel. |
| **Third party** | Flutter/Dart; Android/Kotlin; `solana`, locally patched `solana_mobile_client`, `flutter_secure_storage`, `shared_preferences`, `permission_handler`, `http`, `cryptography`, `bs58`, `equatable`, `intl`, `url_launcher`, Flutter localization/testing/lints, AndroidX/JUnit/desugaring and font assets. Exact direct versions and the vendor patch are listed in `THIRD_PARTY_NOTICES.md`; the full Dart dependency graph is pinned in `pubspec.lock`. |

Code reuse was authorized by the owner. The first Degen Detox commit dates from 24 September 2026; that date is not represented as the creation date of the inherited code.

The delivered v0.10 APK uses normal production flags, without owner reset tools. It adds a bundled 3.2-second birdsong notification, conservative channel migration and a channel-settings shortcut. On 27 September 2026 the owner reported that the update works on Seeker; this is owner acceptance, not an independent device matrix. Existing purchases, check-ins and block settings are preserved; there is no entitlement reset migration. Ingredient checks and user-authored ritual text stay in local preferences, not an encrypted medical record; browser previews keep these only in memory.

This is a device-test release candidate. Automated tests and compilation do not establish that Seeker wallet interaction, background alarms and Accessibility behave correctly on the user's specific device.

## Lifetime price

- 0.1 SOL: lifetime Pro, morning blocking, 20 recipes and Trading Wind-down.
- 500 SKR: the same lifetime Pro plus Touch Grass.
- Existing SOL Pro owners can separately pay the full 500 SKR later to add Touch Grass. Their prior SOL payment is not credited or refunded. SOL access stays active on cancellation, failure or pending confirmation; existing SKR owners are not offered another upgrade.
- No subscriptions or monthly app payments. Solana fees are separate.
- Payment recipient: `6vqJTwDWoNXauztA3e8psbnrm4bNWFDAG218NbAMPgaG`.
- Mainnet SKR mint: `SKRbvo6Gf7GondiT3BbTfuRDPqLWei4j2Qy2NPGZhW3`, six decimals, standard SPL Token program. Official mint reference: [Solana Mobile](https://solanamobile.com/skr).

## Build and test

```sh
flutter pub get
flutter analyze lib test
flutter test
# No real payments; all features available, separate application ID:
flutter build apk --release --flavor qa --dart-define=DEGEN_QA=true --target-platform android-arm64
# Real mainnet wallet checkout; no QA access:
flutter build apk --release --flavor production --target-platform android-arm64
# OWNER ONLY: real payments, manual local receipt reset, never for public distribution:
flutter build apk --release --flavor production --target-platform android-arm64 --dart-define=DEGEN_OWNER_TEST_TOOLS=true
# Browser UI only; checkout disabled:
flutter build web --release
```

The QA package is `com.degendetox.app.qa`, the payment candidate is `com.degendetox.app`. QA flags are rejected by the normal entry point when paired with a non-QA flavor. Test APKs use Android debug signing even though they contain release-optimized code. Configure an owner-controlled release key before store distribution.

## Payment implementation

The user explicitly reviews price, network fees, recipient, and token mint before opening their wallet. Wallet authorization and transaction signing use [Mobile Wallet Adapter](https://docs.solanamobile.com/get-started/flutter/overview). The app does not generate or hold a user's private key.

SOL uses a System Program transfer. SKR uses `transferChecked` and, if necessary, an idempotent associated-token-account creation. The purchaser may fund the recipient account's rent; the UI explicitly discloses this in addition to the network fee. Only the payer's associated SKR account is supported by this initial checkout.

Every transaction carries a `DD1|lifetime|TOKEN|WALLET|NONCE` memo. Returned signed bytes must match the exact compiled transaction, and the payer signature is cryptographically verified before broadcast. Pending signature and last-valid block height are persisted before broadcasting. No automatic second payment is attempted.

The app checks the RPC's mainnet genesis hash, finalized status, successful execution, exact recipient, payer signer, exact amount, exact token mint/program/decimals, memo, and credited/debited balances. A SOL receipt cannot unlock SKR benefits.

Receipt and pending-payment data are stored using Android-backed secure storage; valid cached Pro access does not expire when offline. Fresh installation/restoration requires a wallet-signed, nonce-bound proof of ownership. Restoration first checks supplied/pending/cached receipts, then up to 1,000 recent wallet signatures; older purchases can be restored by pasting their transaction signature. Keep your receipt and access to the paying wallet.

There is no deployed centralized licensing server. Verification trusts the configured HTTPS Solana RPC response, followed by strict local validation. This does not prevent a rooted device or a modified binary from bypassing local feature gates. A dedicated production RPC endpoint and independent payment-security review are recommended before public rollout. Public RPC can rate-limit clients; no API secret is embedded.

## Android features

- Accessibility observes window-change package names, not screen content. The overlay uses `TYPE_ACCESSIBILITY_OVERLAY`; the main UI requests Accessibility explicitly.
- Native schedules handle midnight, local calendar days, reboot, package update and clock/timezone changes.
- System apps, launchers, the app itself and recognized wallets are excluded from the block list. v0.7 has no in-app stop button. During an active block, native endpoints reject stop, cancel, reschedule and replacement sessions until the deadline; Android system control remains available.
- Recurring Grass notifications use a native receiver that schedules the next interval even without Flutter running. Android can delay inexact alarms; force-stop suppresses app background work until relaunch. Tapping the notification opens the animation; no automatic full-screen takeover.
- Six languages, dark/light appearance, free breathing, education and Impulse Check.

## Before public release

Current submission documents are in [`hackathon/submission-2026-09-30/`](hackathon/submission-2026-09-30/JUDGES_GUIDE.md). The 27 September preparation folder is historical; its then-pending registration and eligibility statements have been superseded. The creator has registered as a solo participant and received eligibility confirmation. The separate v0.10 QA flavor has been built and package-checked, but still needs a physical installation check. Final submission status must be verified in ALIGN, not inferred from this repository.

Complete `INSTALL_v0.7_LT.md`, `QA_v0.7.md` and relevant cases in `TESTING.md` on a physical Solana Seeker. Superseded historical stop-button checks no longer apply. Verify fast opening, strict timing, numeric entry, wallet return, SKR checkout and Grass reminders. No real wallet transaction was made by the build agent. Restore remains available without repurchase. The same package, signing certificate and receipt keys preserve local Pro until the owner explicitly uses the test-only reset. Public builds must omit DEGEN_OWNER_TEST_TOOLS.

The `vendor/solana_mobile_client` override preserves upstream 0.1.2 APIs and license, with a narrow Android lifecycle patch documented in `DEGEN_PATCH.md`. The patched dependency must be included with the source project.

Production signing, native-speaker translation review, content-rights review and legal/contact details remain store-release requirements. Hackathon eligibility has been confirmed as described above. See `PROVENANCE.md`; this is a disclosed derivative, not a claim that all code was newly authored for a hackathon.

## Project layout and privacy

`lib/degen/` is the active app. Unused Cortisol Zero screens were moved into `legacy/lib/`, excluded from the analyzer, and their unused plugins were removed from the new build. Original source provenance is preserved.

Notes and settings stay local in SharedPreferences (notes are not encrypted). Purchase data uses secure storage. RPC queries expose IP and queried public wallet/transaction data to the RPC provider. No analytics is initialized. Native Accessibility does not retrieve window contents.

Grass artwork and Degen logo were created for this project. Manrope includes its OFL license. Review inherited asset licenses before distribution.
