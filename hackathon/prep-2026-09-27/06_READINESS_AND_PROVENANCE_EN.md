# Degen Detox: technical readiness and provenance

Review date: 27 September 2026. This is a release-readiness record, not an independent security audit, legal clearance or organizer eligibility approval.

## Implemented and evidenced

- **Code and version:** v0.10 implementation commit `01ef285`; first repository commit `d3d5bee` dated 24 September 2026.
- **Native Android:** functional ARM64 builds, app blocking, persisted scheduling, notifications and wallet return.
- **Solana:** MWA purchase flow, native SOL/SKR transfers, strict client-side verification, distinct entitlement, pending-state handling and restoration.
- **Product:** six localized interfaces, morning blocking, free breathing/education/urge insights, recipe checklists, personal evening step and SKR-specific Touch Grass.
- **Tests:** v0.10 normal-flag suite 144 Flutter tests; 22 Android logic tests; signed APK/resource checks.
- **Founder device feedback:** the user reported working Mainnet checkout, blocking and v0.10 birdsong on a physical Seeker. This is not a claim of independent users or a clinical result.
- **QA review artifact:** current v0.10 QA flavor built successfully, verified distinct package and signature; paid features exposed without real-purchase controls.

## Provenance

The source is a derivative of the creator's Cortisol Zero v61 archive, SHA-256 `3575197b1fece7956694e7d18d3f43e8763d2bfdf6e64f0715c6b0e384d60a99`. The earlier project predates the hackathon's three-month window. The original reference remains separate; the repository retains the reuse statement.

Reused foundations include Flutter scaffolding, earlier Android blocking components, localized recipe/breathing content and audio assets. Degen-specific code lives primarily in `lib/degen/`, native integration refinements and tests. Unused legacy screens remain in `legacy/` as provenance, not in current navigation. Current source includes the local MWA vendor patch and its upstream licence.

Do not remove the origin disclosure, rewrite commit dates, describe old work as new, or claim the repository's creation date alone proves eligibility. Section 6.1 requires organizer clarification for this derivative case. ([Official terms](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))

## Gaps before final hackathon submission

- **Eligibility:** written organizer answer to the age/reuse question.
- **Judge access:** hosted GitHub repository with commit history and working permissions; stable APK/presentation/video links.
- **Demo:** real-device three-minute video. Screen captures of browser previews are not native-functionality proof.
- **Owner declarations:** human roster, age/residence, funding and content rights.
- **QA acceptance:** install and check the newly built separate QA flavor, including its own Accessibility permission and sound channel.
- **Payment evidence:** decide what public transaction information to share. Never provide a private key or seed phrase.
- **Private repository screening:** no suspicious tracked credential-file names or obvious private-key/token patterns were found in the current working tree during a limited scan. This was not a comprehensive secret/history audit; perform that before making history publicly accessible.

## Gaps before a store release

- **Signing:** supplied builds use an existing debug/development signing certificate. Establish an owner-controlled release key, secure backup and an update/migration plan before public distribution.
- **Privacy/contact:** old Cortisol Zero legal files under `legacy/` are not ready-to-publish Degen Detox policies. Final Degen Detox operator/contact information, privacy policy and support route are needed.
- **Content/IP:** confirm rights to inherited recipes, translations, breathing data and audio; retain vendor and font notices. Remove unsupported health claims rather than promising cortisol outcomes.
- **Security:** current entitlement authority is the app's client/RPC verification. It is not resistant to a modified client in the way a server-issued entitlement can be; no server-verification claim should appear in marketing.
- **Infrastructure:** public Mainnet RPC availability/rate limits, error handling and restoration on very active wallets require realistic acceptance tests.
- **Device behavior:** reboot, timezone changes, background restrictions, permission revocation and notification settings across OEMs need broader review.
- **Distribution:** organizer submission acceptance is not dApp Store approval. Publication conditions for eligible winning prizes require actual listing within the applicable 30-day period, not only submission for review. ([Terms, 9.3](https://solanamobile.radiant.nexus/legal/clock-in-terms.pdf))

## Claims that must not be made

- “All code was created during CLOCK IN.”
- “Approved as eligible by the organizers,” before written confirmation.
- “Clinically proven to lower cortisol” or “treats addiction.”
- “13 Degen Detox testers,” using the earlier Cortisol Zero test group.
- “No personal/network data ever leaves the device”: wallet/RPC calls and public blockchain payments are exceptions; local check-in preferences are not encrypted medical records.
- “On-chain licence NFT,” “proprietary smart contract,” or “server-verified licence”: those are not this implementation.
- “QA unlocking proves payment”: the review build intentionally skips payment entitlement.

## Reproducible evidence locations

`RELEASE_v0.10.md`, `PROVENANCE.md`, `test/`, native JUnit sources under `android/app/src/test/`, `vendor/solana_mobile_client/DEGEN_PATCH.md`, and current Android resource/manifest code. Existing stage documentation is historical; use the current reviewer guide rather than v0.2 or v0.7 installation notes.
