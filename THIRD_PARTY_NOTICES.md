# Third-party dependencies and asset provenance

This inventory accompanies the CLOCK IN submission. It does not replace upstream licences or grant rights to the creator's own app code.

## Direct Dart dependencies

Versions below are the resolved values in `pubspec.lock`. That lockfile includes transitive dependencies as well.

| Dependency | Version | Use |
|---|---|---|
| Flutter, flutter_localizations, flutter_test | Flutter SDK 3.41.4 | UI, localization, testing |
| Dart | 3.11.1 | Language/toolchain |
| bs58 | 1.0.2 | Base58 encoding |
| cryptography | 2.9.0 | Signature verification |
| equatable | 2.1.0 | Value equality |
| flutter_secure_storage | 11.2.0 | Purchase/pending-state secure storage |
| http | 1.6.0 | RPC transport |
| intl | 0.20.2 | Localization utilities |
| permission_handler | 11.4.0 | Android permission integration |
| shared_preferences | 2.5.5 | Local non-secret preferences/check-ins |
| solana | 0.31.2+1 | Solana transaction and RPC primitives |
| solana_mobile_client | 0.1.2, local override | MWA; limited lifecycle patch retained with upstream licence |
| url_launcher | 6.3.2 | External navigation |
| flutter_lints | 5.0.0 | Development lint rules |

The vendored MWA dependency is in `vendor/solana_mobile_client`. Its upstream files, LICENSE and `DEGEN_PATCH.md` are retained. This patch is not represented as an original implementation of the MWA protocol.

## Android and tooling

Android/Kotlin/Gradle and Flutter's Android tooling are used. Explicit native dependencies in `android/app/build.gradle` include AndroidX Core/Core KTX 1.13.1, AndroidX Browser 1.8.0, `desugar_jdk_libs` 2.0.4 and JUnit 4.13.2. See the Gradle files and upstream artefacts for their licences and full dependency graph.

## Content and assets

- **Cortisol Zero v61:** owner-authorized source foundation, recipes, translations, breathing data and inherited audio. See `PROVENANCE.md` for the archive hash and reuse boundary.
- **Manrope:** bundled font and OFL text in `assets/fonts/Manrope-OFL.txt`.
- **Nunito:** inherited font files retained from the earlier project. Confirm and retain applicable font notices before store distribution.
- **Degen logo, forest/grass artwork:** project assets created with AI assistance and used in the new brand.
- **Touch Grass birdsong:** a 3.2-second edit from inherited `assets/audio/morning_birds.mp3`; processing and hash are documented in `RELEASE_v0.10.md`.
- **Legacy material:** `legacy/` preserves earlier screens and legal drafts for provenance. They are not current Degen Detox navigation or final publication policies.

Inherited content and audio rights still require the owner's distribution review before a store release. No new public-domain or royalty-free status is asserted by this inventory.
