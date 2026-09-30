# Degen Detox: exported launcher finding review

Reviewed 30 September 2026. This is the project maintainer's AI-assisted technical triage, not an independent audit, a portal adjudication or a certification of safety.

## Reported finding

The supplied portal screenshots show one finding, rated **Medium / Needs review / Low confidence**, described as:

> An exported component has no permission on it, so any app on the device can start it.

The report points to [`AndroidManifest.xml`, line 37 at audited commit ae01ce5](https://github.com/MossesDCT/degen-detox/blob/ae01ce576a43f431b1fc2af6d8de4a21fc6dff50/android/app/src/main/AndroidManifest.xml#L37). The screenshots also list scan limitations: `non-shipping-source`, `partial-selection`, `missing-source`, `partial-input`. The full downloadable audit report has not been supplied for this review. One visible finding must not be interpreted as complete coverage or proof that no other vulnerabilities exist.

## Disposition

**Expected public launcher exposure; exploitable impact is not established by the supplied finding. Reviewer confirmation remains pending.**

The referenced component is `.MainActivity`, the app's `MAIN` / `LAUNCHER` entry point. It is deliberately exported so the device launcher can open the app. Android's official activity documentation specifically describes `android:exported="true"` for a main activity with `android.intent.category.LAUNCHER`. This permits other apps to launch that activity; it does not by itself establish access to protected operations. See [Android activity documentation](https://developer.android.com/guide/topics/manifest/activity-element) and [Android intents and intent filters](https://developer.android.com/guide/components/intents-filters).

Changing this launcher to `exported="false"` or adding a signature-only permission merely to suppress the warning could prevent ordinary third-party launchers from opening it. Intent filters alone are not an authorization boundary, so keeping the launcher exported still requires treating incoming intents as untrusted. See [Android intent security guidance](https://developer.android.com/guide/components/intents-filters).

## Checks performed

- **Source manifest:** the flagged activity has the `MAIN` / `LAUNCHER` filter, no activity permission and no declared browsable deep-link filter. The Accessibility service has `BIND_ACCESSIBILITY_SERVICE` and `exported="false"`; both application alarm/reminder receivers are non-exported.
- **Actual submitted Mainnet APK:** `aapt2 dump xmltree` confirmed the same launcher and application component exposure in `Degen-Detox-v0.10.apk`, rather than relying on the source manifest alone. The merged URL-launcher WebView activity and AndroidX startup provider are non-exported. The AndroidX profile installer receiver is exported with `android.permission.DUMP`.
- **Application intent handling:** the reviewed native application code consumes the `open_grass` boolean as a navigation request. It does not interpret that flag as a receipt, a purchase tier or a request to grant permissions.
- **Touch Grass gate:** `openGrassScene()` checks `access.grass`; reminder initialization and resume handling also check that entitlement. An externally supplied navigation flag is not trusted as payment evidence.
- **Payment state:** Pro/SKR authorization derives from the payment receipt or the explicitly separate QA build flag. The reviewed MainActivity intent-handling path does not set a receipt or invoke purchase restoration from intent data.
- **Native method channel:** the app's Flutter method channel handles native requests inside the app; it is not an exported Android component callable merely by starting MainActivity.
- **Regression tests:** 45 existing Flutter tests passed across domain/access policy, payment verification, SOL-to-SKR upgrade and wallet-return handling. These are supporting regression evidence, not hostile-intent instrumentation tests.

Relevant code: `android/app/src/main/kotlin/com/degendetox/app/MainActivity.kt`, `GrassReminderReceiver.kt`, `lib/degen/app.dart`, `domain.dart`, `reminders.dart`, `payments.dart` and `lib/main.dart`.

## Limitations and follow-up

This review did not execute adversarial intents on a physical Seeker, did not perform a complete dependency audit, and did not validate every inherited FlutterActivity intent extra. Framework routing/entrypoint extras remain a separate hardening and runtime-test area; absence of app-defined deep-link filters is not proof that all explicit intents are rejected.

Before broader distribution, test both a fresh app start and an already-running instance using explicit intents, malformed extras and unexpected routes. Confirm that no receipt is written, no Pro/SKR tier changes, no sensitive data is returned and no blocking settings change. Exercise legitimate launcher, notification-tap and wallet-return flows in the same test matrix. The test plan is not represented as already executed.

No runtime code or manifest behavior was changed for this finding. The supplied v0.10 APKs therefore remain unchanged. The portal's finding status has not been edited or dismissed by the maintainer.

## Suggested reviewer response

> The referenced component is our MAIN/LAUNCHER activity. Its exported state is intentional and follows Android's documented launcher configuration. We checked both source and the submitted APK manifest. The app-defined incoming `open_grass` flag is used only for navigation, with the SKR entitlement checked before opening the scene; it does not grant Pro or modify receipts. Sensitive application receivers remain non-exported and the Accessibility service declares BIND_ACCESSIBILITY_SERVICE. We have not identified a privileged operation reachable solely by externally starting MainActivity in the reviewed path. We request contextual review of the generic missing-permission finding rather than treating expected launcher exposure as a confirmed exploit. This is maintainer triage, not a claim of a complete or independently passed security audit.
