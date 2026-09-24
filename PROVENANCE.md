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

Do not present inherited services or data as code created during the hackathon. Do not change old timestamps to imply eligibility. Obtain written confirmation about the three-month rule before submitting this derivative project, and preserve the baseline archive for review.
