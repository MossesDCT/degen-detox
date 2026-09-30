# Degen Detox code provenance

This application is a derivative of the user's Cortisol Zero v61 project. Reuse was explicitly requested by the project owner.

## Baseline

- Archive: `cortisol_zero_v61.zip`
- Perplexity artifact: `8bd2a1fb-c13e-4585-8ede-c086f87ae0bc`
- Archive SHA-256: `3575197b1fece7956694e7d18d3f43e8763d2bfdf6e64f0715c6b0e384d60a99`
- Original project kept separately and unchanged as the reference copy.

## Reused

- Flutter scaffolding and Android native app-blocking services.
- Recipe titles, ingredient lists and preparation instructions in six languages.
- Breathing technique timings and localized technique names.
- Legacy code and dependencies retained temporarily for compatibility, but not exposed through the new navigation.

## Newly implemented in this milestone

- `lib/degen/`: UI, access policy, schedule model, reminder adapter and translations.
- Degen Detox app entry, typography, color system, mark and grass artwork.
- Impulse Check, Trading Wind-down, SKR-specific preview gating and Touch Grass experience.
- Safer educational wording and hiding unsupported legacy recipe benefits.
- Android namespace and branding change to `com.degendetox.app`.
- Domain/widget tests and browser flow checks.

## Hackathon disclosure

Do not present inherited services or data as code created during the hackathon. Do not change old timestamps to imply eligibility. Written confirmation was received by the creator on 29 September 2026: the organizers accepted the disclosed pre-existing foundation because of significant new Solana mobile development. They require the repository README to distinguish earlier code, third-party libraries and new work. Preserve the baseline archive and private correspondence for review.

## Version 0.2 additions

Added Solana Mobile Wallet Adapter signing, exact-price mainnet SOL/SKR transactions, local on-chain receipt validation, wallet-proof restoration, secure receipt storage and a separate no-payment QA flavor. Reworked native scheduling for local calendar boundaries and reboot, added persistent Touch Grass reminders, and removed the active legacy UsageStats/overlay foreground-service path and old Play Billing dependencies. Unused Flutter screens and old policies are retained under `legacy/`, not active app navigation.

## Subsequent Degen Detox work through v0.10

- New forest/gold visual identity, six-language product navigation and crypto-specific education.
- Native wallet return and orderly MWA session-close fixes; see the preserved upstream licence and `vendor/solana_mobile_client/DEGEN_PATCH.md`.
- Accessibility permission guidance, searchable app selection, selected-app lists and stable timed block notices.
- Strict active-block schedule enforcement, responsive setup and single-tap numeric wake-time entry.
- Separate SOL-to-SKR purchase path, local urge summaries, Google consumer-app selection fixes.
- Recipe ingredient checklists, localized measurements and the optional custom evening ritual.
- Touch Grass birdsong notification and respectful Android channel migration.

The 3.2-second birdsong is a new edit of an inherited audio asset, not a newly recorded original sound. Automated tests and founder feedback are documented without claiming independent clinical validation.

Third-party packages are listed in `THIRD_PARTY_NOTICES.md`; `pubspec.lock` preserves exact resolved Dart dependencies. AI assistance does not change the disclosure of pre-existing code or ownership.
