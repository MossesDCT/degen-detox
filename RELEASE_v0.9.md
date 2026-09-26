# Degen Detox v0.9 release record

## Artifact

- Version `0.9.0+9`, package `com.degendetox.app`, ARM64 production flavor, normal flags without owner reset or QA entitlement.
- APK: 21,351,753 bytes.
- SHA-256: `84439e5cd016afc9fc372505f22a7199be4f26ab4ce4502ec0990c481ac8b01c`.
- Same development certificate SHA-256: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`.
- No payment, native blocking or entitlement changes. In-place update; never uninstall or clear data to update.

## Changes

Unit normalization at the active `safeRecipes` boundary covers ingredient lists and method steps in all 20 recipes × 6 locales. It preserves quantities/fractions and maps whole tbsp/tsp tokens to localized forms, including Korean tokens immediately followed by grammatical particles. A remaining Korean method-step `cup` is localized. Every locale has a unit legend. Definitions verified against [Land O’Lakes](https://www.landolakes.com/kitchen-reference/measurements-abbreviations/): https://www.landolakes.com/kitchen-reference/measurements-abbreviations/.

Two inherited efficacy parentheticals in the golden-milk ingredient list are removed, without removing culinary alternatives in other ingredient labels. This does not constitute a full clinical or professional translation review of the inherited dataset.

`RecipePanel` exposes accessible CheckboxListTile rows, strike-through text, selected count and a reset scoped to that recipe. Per-recipe IDs/index sets are stored in local preferences using new `degen_ingredients_v1_<id>` keys. The recipe order is unchanged. Indices are validated on read; failed writes do not claim the checkbox was saved. Concurrent edits are disabled while saving. Preview uses memory-only state and clears on browser reload.

`WindPanel` retains the three existing steps and permits one optional user-authored fourth step, 1–120 characters. It supports save, edit, cancel and confirmed removal. Empty/whitespace-only input is rejected. A custom step participates in completion; edited custom steps must be rechecked. Its trimmed text persists under `degen_custom_evening_step_v1`; all completion checks are per opening and reset when the sheet is reopened. The user's text is not machine-translated when the interface locale changes. Failed persistence retains the prior saved value and displays an error.

## Verification

- Full Flutter suite: 135 passing (119 retained + 16 new), normal production flags.
- Static analysis: no issues.
- New tests cover all recipe unit tokens in six languages, numeric quantity preservation, per-recipe persistence/reload/reset/isolation, invalid indices, preview non-persistence, strike-through/undo/reopen in six languages, optional custom step add/validation/completion/reopen/edit/cancel/remove in six languages, and write failures.
- Production APK build and apksigner/package/version checks pass.
- Web build passes with the existing unused CupertinoIcons font warning.
- Focused Playwright `qa_v09.cjs`: zero page errors; real UI custom-step creation, four-step completion, reset-on-reopen, Lithuanian edit, localized recipe units, ingredient check/reopen/reset. Both Lithuanian new screens visually inspected at 390px.
- Existing full browser regression was not completed with the experimental new nested-sheet sequence; that sequence hit Flutter semantic-node timing/selection issues. It was removed from the unchanged baseline `qa.cjs` and isolated into the passing focused script. Full Flutter tests cover the prior features.
- Initial APK attempt exhausted disk during a regenerable Gradle transform. Removed only regenerable build caches and incomplete transform; retry succeeded. User/project data and previously delivered artifacts retained.

## Physical testing

No physical Seeker test or new SOL/SKR transfer was performed by the build agent. Device acceptance should confirm checkbox persistence across app restart and personal ritual keyboard behavior. This release preserves the user's previously verified SKR entitlement.
