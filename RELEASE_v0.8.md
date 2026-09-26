# Degen Detox v0.8 release record

## Artifact

- Version `0.8.0+8`, package `com.degendetox.app`, production flavor, ARM64, target SDK 36.
- Normal production flags. No `DEGEN_OWNER_TEST_TOOLS`, no `DEGEN_QA`, no automatic receipt-reset migration.
- APK size: 21,351,537 bytes.
- SHA-256: `bc23ecbb41f590e7d7857122ca6d49b433a848e5b2fc9816e946a85005d8c15a`.
- Certificate SHA-256: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`, unchanged development certificate. Still requires an owner-controlled release-signing plan before store distribution.
- Update in place. ZIP contains one APK. Existing secure receipt, pending payment, local entries and block preferences keep their keys and are not cleared.

## Payment upgrade

`canPurchaseTier` permits unpaid users to buy either paid tier and SOL owners to buy only SKR. SKR owners cannot buy again. SOL owners receive a localized upgrade offer explaining the full additional 500 SKR, no prior-payment credit/refund, no subscription and retention of existing access. Existing fee, recipient, mint and wallet confirmation displays remain.

Finalized receipt persistence does not erase an unrelated pending upgrade when an older SOL receipt is restored. A verified SKR receipt replaces SOL only after persistence succeeds. SKR is never downgraded by a SOL restore. Restore verifies the cached SOL payment but continues scanning for a later valid SKR purchase instead of prematurely returning the base tier. Bounded history scanning and explicit signature import remain.

The transaction signing and on-chain verification path, recipient, amounts, mint and network are unchanged. Tests use synthetic RPC/secure-storage fixtures and do not initiate real transfers.

## Free self-observation

`UrgeInsights` validates date and integer 1–10 scores, ignores future/out-of-window/corrupt records, and aggregates the last 30 days. Legacy local timestamps remain readable; new entries capture the original local hour and UTC offset. No server or analytics service is introduced.

Three records unlock a descriptive mean, min/max and up to 14 recent labelled bars. Four fixed local-hour buckets show counts and means. Comparative higher/lower labels require at least five records and at least two buckets containing two records each. Ties are explicit. One-record buckets are not ranked. This is a descriptive threshold, not a statistical-significance claim. Small-sample, sampling-bias and non-medical limitations are displayed.

Recent history shows up to ten records with optional notes. Both the free Today summary and Impulse Check sheet link to the overview. All new explanatory/UI strings cover EN/LT/ES/FR/DE/KO.

## App picker and Today screen

`BlockSafety` previously excluded every FLAG_SYSTEM application, unintentionally hiding preinstalled Google consumer apps. An exact-package `ConsumerAppPolicy` allowlist now admits named consumer apps, while unknown system packages, essential system services, launchers, the app itself and supported wallets remain excluded. This does not broadly permit all Google or system packages.

Today uses the existing forest asset in a framed, bottom-aligned image card with one slogan, a finite 1.8-second image entrance respecting reduced-motion settings, and concise icon action cards. Free → Pro → SKR vertical ordering remains. No new remote assets or tracking dependencies.

## Verification

- Full Flutter suite: 119 passing with normal/default flags, including 25 new tests for upgrade persistence/restore/cancel/eligibility, all six upgrade locales, valid/invalid insight inputs, sample thresholds, ties, legacy records, all six insight layouts and reduced-motion/large-text hero.
- Android JUnit: 19 passing, including two new exact-package allowlist/protected-system tests and 17 retained overlay/strict-block tests.
- Flutter static analysis: no issues.
- After the final forest-image crop adjustment, static analysis and 32 focused upgrade/insight/six-language-ordering tests passed again.
- ARM64 production release APK builds and passes signing/package/version inspection.
- Web release builds. A pre-existing unused CupertinoIcons font warning remains; used Material icons render correctly in inspected screens.
- Playwright regression: zero page errors; mobile/desktop, LT dark/light, numeric wake entry, selected-app search/save/cancel, paywall preview, breathing, Touch Grass and three actual UI-created impulse check-ins.
- UI-created scores 5, 3, 9 display mean 5.7/10, range 3/9 and three correctly labelled bars. Screenshot inspection confirms the image framing, readability and no overflow at 390px. Six-locale layout checks also run at 360px in Flutter tests.
- Existing private web preview artifact updated successfully. Browser checkout remains disabled; use the Android APK for wallet and Accessibility testing.

## Device acceptance still required

The owner confirmed a real SKR checkout worked before v0.8. That is not evidence of testing the newly added SOL-owner upgrade flow. New real upgrade/cancellation and cached-SOL-to-SKR restoration need Seeker wallet acceptance; the build agent has made no transfer.

Exact-package filtering is unit-tested, but installed Google-app discovery and actual Accessibility interception must be checked on the physical Seeker. App updates are designed to retain existing access, data and strict schedule; do not uninstall or clear storage.
