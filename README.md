# Degen Detox

Android wellbeing app for the crypto community, built with Flutter 3.41.4, Dart 3.11.1 and JDK 17. Version 0.6 improves permission onboarding, searchable app selection and selected-app visibility, and fixes the HOME transition prematurely dismissing the blocker notice. v0.5 wallet-return fixes, payment recipient, one home slogan and Free → Pro → SKR ordering are preserved. The owner confirmed a successful real v0.4 payment and that the Accessibility blocker works on Seeker.

This is a device-test release candidate. Automated tests and compilation do not establish that Seeker wallet interaction, background alarms and Accessibility behave correctly on the user's specific device.

## Lifetime price

- 0.1 SOL: lifetime Pro, morning blocking, 20 recipes and Trading Wind-down.
- 500 SKR: the same lifetime Pro plus Touch Grass.
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
- System apps, launchers, the app itself and recognized wallets are excluded from the block list. Emergency stop is available in Morning Shield and Settings.
- Recurring Grass notifications use a native receiver that schedules the next interval even without Flutter running. Android can delay inexact alarms; force-stop suppresses app background work until relaunch. Tapping the notification opens the animation; no automatic full-screen takeover.
- Six languages, dark/light appearance, free breathing, education and Impulse Check.

## Before public release

Complete `INSTALL_v0.6_LT.md`, `QA_v0.6.md` and the detailed cases in `TESTING.md` on a physical Solana Seeker. In particular verify permission navigation, 10-second notice/dismissal, search/selection persistence, wallet return and cancellation, SOL and SKR checkout, pending-payment recovery, restore, overnight blocking and background reminders. No real wallet transaction was made by the build agent. Use Restore with the existing paying wallet to exercise the shared return path without paying again. The same package, signing certificate and receipt keys preserve locally saved Pro access.

The `vendor/solana_mobile_client` override preserves upstream 0.1.2 APIs and license, with a narrow Android lifecycle patch documented in `DEGEN_PATCH.md`. The patched dependency must be included with the source project.

Production signing, native-speaker translation review, legal/contact details and hackathon eligibility confirmation remain release requirements. See `PROVENANCE.md`; this is a disclosed derivative, not a claim that all code was newly authored for a hackathon.

## Project layout and privacy

`lib/degen/` is the active app. Unused Cortisol Zero screens were moved into `legacy/lib/`, excluded from the analyzer, and their unused plugins were removed from the new build. Original source provenance is preserved.

Notes and settings stay local in SharedPreferences (notes are not encrypted). Purchase data uses secure storage. RPC queries expose IP and queried public wallet/transaction data to the RPC provider. No analytics is initialized. Native Accessibility does not retrieve window contents.

Grass artwork and Degen logo were created for this project. Manrope includes its OFL license. Review inherited asset licenses before distribution.
