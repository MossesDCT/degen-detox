# Degen Detox v0.5 release record

## Build

- Version 0.5.0+5, production flavor, ARM64, package `com.degendetox.app`.
- APK 21,351,589 bytes; SHA-256 `676cb0bf6620b6b97a6f151cd65e7915bb2ac39cee563e8e595f1319be541cda`.
- Same development signing certificate as v0.4: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`.
- Recipient, SOL/SKR amounts, receipt/pending keys and ownership proof unchanged.
- ZIP contains one APK. No real transaction performed by agent.

## Fix

User confirmed a real v0.4 payment successfully unlocked Pro, but reported leaving the app after payment. The payment currency and exact exit/crash cause were not established.

Inspection found solana_mobile_client 0.1.2's ActivityResultListener was not registered with its Flutter ActivityPluginBinding, and native close returned before the asynchronous Scenario close completed. The vendored patch fixes listener registration/detachment, awaits native close off the UI thread and reliably dispatches callbacks to the main Looper. See vendor/solana_mobile_client/DEGEN_PATCH.md.

The app observes wallet result/error immediately, then disconnects, waits a bounded time for the wallet Activity result and requests return to the existing app task after completed signing or an actual wallet return. Abandoned launch without a result does not trigger foreground recovery. No CLEAR_TASK, CLEAR_TOP or NEW_TASK flags are introduced.

Default package task affinity replaces the previous empty affinity. Foreground recovery reorders the existing MainActivity; cleanup errors cannot override financial results. The successful purchase panel adds confirmation and a Continue button that pops only the modal.

## Evidence

- `flutter analyze lib test`: no issues.
- `flutter test`: 63 passing tests. Includes shutdown ordering, missing wallet callback, close failure/timeout, abandoned launch, cancellation, refused foreground request, SOL/SKR persisted receipt compatibility and six-language Continue navigation.
- Native production Gradle build succeeds; generated plugin manifest points to the patched vendored package.
- Signature verified, same certificate as v0.4; version code 5 verified.
- Browser regression: zero page errors; existing UI flows preserved.
- Real Seeker Activity/task behavior remains a physical-device acceptance check. Unit tests and compilation are not a claim of actual on-device reproduction or successful post-fix return.

## No-cost acceptance

Update in place, verify existing Pro entitlement, then use Restore with the same payer wallet. It signs a nonce-bound ownership message, not a new transfer. This exercises the shared wallet handoff path without paying again. Never ask the user to repurchase merely to test this fix.
