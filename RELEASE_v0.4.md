# Degen Detox v0.4 release record

- Version: 0.4.0+4, production flavor, ARM64.
- Application ID: `com.degendetox.app`.
- Recipient: `6vqJTwDWoNXauztA3e8psbnrm4bNWFDAG218NbAMPgaG`.
- Prices unchanged: 100,000,000 lamports or 500,000,000 base units of SKR (6 decimals).
- APK filename: `Degen-Detox-v0.4.apk`, 21,351,633 bytes.
- APK SHA-256: `8c58003f073a76dac1140750d4ed73621c9c43cf03dd2d00f4ad735ae11205f7`.
- Installer ZIP SHA-256: `ef3b6cfab73c7fffa146a6c3393d1060594584fdb2be80c5ef10448f6d43ac4e`.
- Signing certificate SHA-256: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`; same development certificate as v0.3.

## Requested changes

Rotated the single shared recipient constant used by SOL transfers, derived SKR associated-token destination, receipt verification and checkout display. Removed the obsolete recipient from working documentation. Existing historical builds and Git history are not rewritten.

Replaced three home promotional texts with one translated slogan, simplified feature descriptions and checkout titles, and made native blocking text factual. Today and Rituals use the same vertical Free → Pro → SKR grouping, including education links in the free group. Home retains check-ins in the free group and adds the existing wind-down feature to the Pro group. Tab navigation resets scroll position.

## Verification and limits

47 tests pass; analyzer clean. Browser regression has zero page errors. Exact recipient verified in checkout screenshot and ARM64 compiled app strings; previous recipient absent from new generated app code. Signature and version verified; ZIP contains one APK. See QA_v0.4.md.

No real funds sent. Owner must check the receiving address in their own wallet before authorizing a mainnet transaction. A valid address format does not prove wallet control. The app still uses public RPC and development signing; this is not a claim of store approval or an independent payment-security audit.
