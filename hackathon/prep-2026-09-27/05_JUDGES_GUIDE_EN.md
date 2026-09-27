# Degen Detox: reviewer guide

Prepared for review of v0.10.0, version code 10. This guide distinguishes real purchases from a no-payment feature-review build; eligibility under the pre-existing-project rule is still awaiting organizer clarification.

## Choose the correct APK

| Build | Android package | Purpose |
|---|---|---|
| `Degen-Detox-v0.10.apk` | `com.degendetox.app` | Real Mainnet checkout and production entitlement behavior |
| `Degen-Detox-QA-v0.10-JUDGES.apk` | `com.degendetox.app.qa` | Paid-feature review without spending funds; explicit QA status and real payment controls disabled |

Both target ARM64 Android, minimum API 24 and target API 36, and can coexist with separate app data. The QA build does not migrate or modify the Mainnet app's purchase receipt. The QA feature unlock is not evidence of payment validation.

Both review artifacts are release-optimized but signed with the existing Android development certificate, not a finalized store-release signing key. They are hackathon review candidates, not a claim of dApp Store acceptance.

## Quick walkthrough without payment

1. Install **Degen Detox QA** and confirm that the QA status is visible.
2. Open breathing and Impulse Check. Add three sample scores to inspect descriptive insights.
3. Open Morning Shield and read the permission disclosure. Grant Accessibility only if you choose to test blocking.
4. Select one nonessential app using search. Essential system apps, the launcher and supported wallets are excluded.
5. To observe blocking immediately, choose a wake time just before the current time and a one-hour duration, then deliberately confirm the strict schedule. **Do not select an app you need during that hour.** The app intentionally provides no early-stop control during the active window.
6. Open recipes, check two ingredients, leave and reopen the same recipe. Reset applies only to that recipe.
7. Open Trading Wind-down, add a personal fourth step, complete all four and reopen. The text persists; the completion checks reset.
8. Open Touch Grass, allow notifications if requested, use the 10-second test and lock the phone. Delivery timing, sound and lock-screen visibility depend on Android settings. A bundled 3.2-second birdsong is the default unless user channel choices override it.
9. Tap the notification to open the scene. The app does not force a full-screen takeover.

QA app blocking is real native blocking, not a simulated visual. Android remains under the user's control; this is not device-owner management or an unbreakable lock.

## Payment review

Mainnet price is 0.1 SOL for lifetime Pro or 500 SKR for Pro plus Touch Grass. Existing SOL owners can separately add the SKR tier for the full 500 SKR. Fees and possible token-account creation cost are additional and disclosed before signing.

Do not send funds merely to inspect paid features; use the QA APK. To inspect real payment code, see `lib/degen/payments.dart`, `purchase_panel.dart`, `wallet_handoff.dart` and the patched `vendor/solana_mobile_client` integration.

Verification checks the Mainnet genesis hash and finalized transaction evidence, including signer, recipient, amount, memo and relevant token details/balance changes. Entitlement is cached in secure storage; restore proves wallet control and checks on-chain evidence. It is client-side verification, not a server-backed tamper-proof licence.

The founder has reported real SOL and SKR purchase success on Seeker. Public transaction evidence is not included until the owner chooses to disclose it. A newly built QA APK has not itself been physically installed by the build agent.

## Build from source

The attached Git bundle preserves the commit history. It is a portable backup and **does not substitute for the required judge-accessible GitHub repository**. ([Official submission requirements](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))

```sh
git clone Degen-Detox-source-history.bundle degen-detox
cd degen-detox
flutter pub get
flutter analyze lib test
flutter test

# Real mainnet build:
flutter build apk --release --flavor production --target-platform android-arm64

# Separate, explicitly unlocked review build:
flutter build apk --release --flavor qa --dart-define=DEGEN_QA=true --target-platform android-arm64
```

Use Flutter 3.41.4/Dart 3.11.1, JDK 17 and a compatible Android SDK. The local vendor override is required and is included. Never enable `DEGEN_OWNER_TEST_TOOLS` for a submitted production build.

The two supplied APKs were built from implementation commit `01ef285`. Later preparation commits contain documentation only. Preserve `.git` history and read `PROVENANCE.md`; the initial source includes disclosed earlier Cortisol Zero material.

## Integrity

- Mainnet APK SHA-256: `1895e16d203781e727e65bccd489fed108f26fc623a28cc8030fd5256d96255a`.
- QA APK SHA-256: `a5fdab441b1f04adbe12d7b8a8c5a6b4586489f59b6e25b15e371763ab22cd94`.
- Certificate SHA-256: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`.
- `CHECKSUMS.sha256` in the preparation archive records file integrity for the packaged materials.
