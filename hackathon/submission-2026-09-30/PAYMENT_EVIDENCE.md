# Degen Detox: payment implementation and test evidence

Prepared 30 September 2026. This is a maintainer-produced source map, not an independent audit. Links pin the implementation to commit `ae01ce576a43f431b1fc2af6d8de4a21fc6dff50`; subsequent submission-document changes do not modify the v0.10 runtime or APKs.

## Implementation map

| Area | Existing implementation |
| --- | --- |
| Prices, recipient and SKR mint | [`payments.dart`, constants and tier eligibility](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L19-L59): 100,000,000 lamports for SOL Pro; 500,000,000 base units for six-decimal SKR. |
| Payer, signature and memo | [`verifyPayment`](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L61-L91): successful metadata, matching transaction signature, payer as first signing account, one correctly structured wallet-bound purchase memo. |
| SOL transfer | [SOL validation](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L92-L107): System Program, source, recipient, exact transfer amount and recipient balance increase. |
| SKR transfer | [SKR validation](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L109-L144): SPL program, transferChecked, authority, mint, destination associated token account, decimals, exact amount and matching debit/credit. |
| Finality before unlock | [`_checkReceipt`](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L257-L279): successful finalized status and finalized transaction lookup precede receipt acceptance. |
| Wallet signing and broadcast | [`buy`](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L297-L424): Mobile Wallet Adapter signing, exact returned message comparison, Ed25519 signature check, then RPC broadcast. |
| Pending and tier persistence | [Persistence rules](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L282-L303) and [pending-before-broadcast](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L388-L417): existing SKR cannot be downgraded by a SOL receipt; pending checkout prevents another purchase attempt. |
| Restoration | [Wallet proof and restoration](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/payments.dart#L426-L530): nonce-bound signed-message proof, explicit receipt verification, pending/cached receipt handling and a bounded transaction-history scan. |
| SOL versus SKR access | [`AccessPolicy`](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/domain.dart#L1-L20): verified SOL grants Pro, while verified SKR also grants Touch Grass. Preview display state is separate from authorization. |
| Wallet return | [`wallet_handoff.dart`](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/lib/degen/wallet_handoff.dart) contains lifecycle coordination; [`wallet_handoff_test.dart`](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/test/wallet_handoff_test.dart) exercises callback, disconnect, cancellation and foreground-recovery cases. |

## Existing tests and observed result

- [Payment verifier tests](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/test/payment_verifier_test.dart): valid SOL/SKR, failed transactions, wrong recipient/source/amount, unsigned payer, invalid memo/mint/decimals/program, mismatched receipt binding and malformed inputs.
- [Upgrade tests](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/test/upgrade_v08_test.dart): SOL-to-SKR eligibility, persistence, preservation of base Pro, duplicate/pending purchase prevention, later SKR restoration and localized upgrade/cancel UI.
- [Wallet-return tests](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/test/wallet_handoff_test.dart): lifecycle behavior and preservation of existing receipts.
- [Domain tests](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/test/degen_domain_test.dart): access-policy separation and domain constraints.

The following focused run completed with **45 tests passing** on 30 September 2026:

```sh
flutter test --no-pub \
  test/degen_domain_test.dart \
  test/payment_verifier_test.dart \
  test/upgrade_v08_test.dart \
  test/wallet_handoff_test.dart --reporter expanded
```

These are unit/widget regression tests, including simulated RPC and wallet outcomes. They are not a fresh on-chain transaction, a full end-to-end Seeker test, or independent security certification. Source references locate implementation; their presence alone does not prove absence of defects.

## Trust boundaries and replay semantics

The client trusts the configured HTTPS Solana RPC responses. It is not a Solana light client and does not independently verify consensus. Local checks and secure receipt storage do not prevent a modified binary or a compromised device from bypassing feature gates. A proprietary licensing backend or smart contract is not deployed.

A receipt is bound to its original payer and transaction signature. Restoration requires proof of the paying wallet. Reusing that wallet's valid lifetime receipt to restore access is intentional, not a new purchase. The memo nonce is checked for its format and is covered by the signed transaction; there is no server-maintained registry of globally consumed nonces or single-device licences. The checkout checks the returned signed message against the exact transaction it constructed.

The separate QA APK deliberately unlocks features without payment. QA access is not evidence of Mainnet checkout, and the QA package is not the customer payment build.

## Recorded checkout and remaining evidence gaps

The main three-minute product video shows an already activated SKR entitlement. The supplementary [Live SKR payment demonstration](https://drive.google.com/file/d/1wMlqvnSXjzpJkJTefM3B_jLDQ1l73hly/view?usp=drivesdk), recorded on Seeker on 30 September 2026, shows initial cancellation, a subsequent transaction-signing flow, return to the app, a pending state and activation of SKR access, followed by Touch Grass settings and its nature scene.

This 87-second clip preserves the original continuous sequence at normal speed and adds English narration, side-panel explanations and opaque redaction of wallet identifiers. The wallet verification warning and app status messages remain visible. An additional wallet request is cancelled after activation; the resulting generic "No purchase was confirmed" status appears alongside the active entitlement and is a confusing UI message, not proof of another payment or successful restoration.

Successful purchase restoration, a fresh SOL checkout and independent transaction-finality verification are not demonstrated by this clip. The source map and unit tests are separate evidence, not a substitute for those remaining checks.

The portal report supplied by the owner lists Android as its reviewed area. Its unverified exported-launcher item is discussed in [the maintainer's contextual review](SECURITY_FINDING_REVIEW.md). It does not establish a comprehensive audit of these Dart payment paths.
