# Degen Detox Android lifecycle patch

Vendored from solana_mobile_client 0.1.2. Upstream license is retained in LICENSE.

The Flutter Android ActivityAware binding now registers and unregisters the ActivityResultListener. Previously startActivityForResult's pending result was never dispatched to this listener.

Scenario.close now awaits the native close future on a worker thread (bounded to five seconds) before reporting completion. Callbacks are posted via the main Looper even during activity reattachment, rather than silently discarded when the activity reference is temporarily null.

Missing host activity or launch failure returns an error rather than pretending a successful handoff. The app observes that asynchronous error and keeps financial receipt/pending-transaction validation unchanged.

Background: [Mobile Wallet Adapter integration guide](https://github.com/solana-mobile/mobile-wallet-adapter/blob/main/android/docs/integration_guide.md) describes closing the Scenario after signing so the wallet can finish its UI and return control to the dapp.

This is a narrowly scoped compatibility patch, not an upstream version upgrade. Real Seeker return behavior still requires device acceptance; unit tests do not prove Android task behavior.
