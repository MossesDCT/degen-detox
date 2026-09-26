# Degen Detox v0.4 QA

## Required checks

- Exact recipient `6vqJTwDWoNXauztA3e8psbnrm4bNWFDAG218NbAMPgaG`, valid Base58 32-byte value, shared by SOL transfer, SKR ATA derivation, verifier and displayed checkout.
- Previous recipient absent from active source, working docs, generated web JS and new APK's Flutter binary. Historical Git commits and already-delivered versions are not rewritten.
- Exactly one home brand slogan; no eyebrow or second introduction. Descriptions use factual feature copy.
- Today and Rituals order: breathing, impulse, education, then morning blocking, recipes, wind-down, then Touch Grass. Check-ins stay in the free home section.
- Six-language tests at 360px and checkout tests at 390px. Tab changes reset scrolling.
- Mobile dark/light and desktop screenshots; paywall displays new recipient and unchanged prices.
- Negative checks: incorrect-recipient receipts rejected, preview cannot grant paid native access, wallet self-payment check remains.
- Final release APK version 0.4.0+4, production flavor, ARM64, signature matches v0.3, archive contains exactly one APK.

## Scope boundary

No real funds sent, no phone connected. Cannot verify ownership of recipient or successful real-wallet handoff from address syntax alone. Old on-chain receipts paid to another recipient are not restored by the new verifier; cached existing entitlements are left intact.

## Results

- Static analysis: no issues. Automated suite: 47 passed.
- Browser regression: completed with zero page errors, covering setup preview, duration/app selection, saved check-in, breathing pause/resume, reminder preview, language and appearance changes.
- Additional Lithuanian browser QA: checkout recipient visually verified; Today and Rituals free-first order, dark/light and desktop screenshots reviewed.
- Old recipient scan: absent from active source, working Markdown docs, generated web JS and extracted ARM64 libapp.so. New recipient present in the compiled binary and checkout screenshot.
- APK metadata: package com.degendetox.app, 0.4.0+4, SDK 24+, target 36, ARM64. Signature valid and matches v0.3.
- Installer ZIP contains exactly one APK.
