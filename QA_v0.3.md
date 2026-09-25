# Degen Detox v0.3 QA inventory

## Scope

- Visual: forest background is visible but readable; gold Pro titles/prices; icon has an actual gold D/leaf, including Android adaptive and monochrome assets. Mobile 390px and desktop; dark and light.
- Motion: subtle scroll-linked forest displacement and tab entry; reduced-animation preference bypasses both. No uncontrolled perpetual animation in the shell.
- Free education: eight articles, six complete translations, practical steps, evidence URLs, health limitations. Open and close articles.
- Permissions: not enabled, enabled but disconnected, connected, failure; explicit consent before opening accessibility; app-info restricted-settings path; lifecycle refresh. Native schedule refuses disconnected service.
- Privacy: local notes versus secure payment receipt versus public-chain/RPC disclosure. No absolute “no personal data” promise. No screen-content retrieval.
- Existing flows: morning settings 1–4h, selection, save, impulse note, breathing start/pause, recipes, wind-down, SKR reminder interval/scene, language/theme toggles.
- Mainnet: exact 0.1 SOL / 500 SKR, separate entitlements, wrong mint/amount/recipient rejected, wallet ownership and pending-payment recovery preserved.
- Packaging: production flavor, no QA grant, ARM64, APK signature valid, version 0.3.0+3, ZIP contains one APK only.

## Negative paths

- Permission granted but native service disconnected must not show protection ready or save an active schedule.
- A free user must not gain paid native privileges from browser preview.
- Forged, failed, insufficient, wrong-mint and mismatched-wallet receipts must remain locked.
- Missing optional settings UI must not suggest disabling Android security.

## Physical-device exclusions

No Seeker is connected to this environment. Actual wallet handoff, SOL/SKR transfer, reboot scheduling, notification delivery, OS restricted-setting menu and blocking another app require device acceptance. Browser QA is not a substitute for those checks. Mainnet transfer spends real funds and is not performed by the agent.

## Results

- `flutter analyze lib test`: no issues.
- `flutter test`: 40 passed, including permission opt-in/off/waiting/connected states and six-language article rendering.
- `node qa.cjs`: main UI regression passed; browser `pageerror` list empty. Morning preview duration/app selection/save, check-in, breathing start/pause, SKR scene/interval, Lithuanian switch and light theme exercised.
- Additional browser pass: eight article cards rendered; article opened and closed; gold paywall and mobile dark/light screenshots reviewed.
- Desktop, mobile home, paywall, article and light-theme screenshots inspected. No observed overflow or missing icon; intended scrolling remains.
- Android ARM64 release-flavor build and APK signature verification pass. Same certificate as v0.2 Mainnet. Actual device steps remain excluded as above.
- Web deployment is a visual preview only; real checkout remains disabled there.
