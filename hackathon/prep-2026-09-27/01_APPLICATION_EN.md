# Degen Detox: application copy

Prepared 27 September 2026 for the CLOCK IN application. Copy blocks are ready for adaptation to the authenticated form; that form's field names, character limits and upload restrictions have not yet been verified. Eligibility confirmation, personal details, links and declarations remain owner decisions.

## Project name

Degen Detox

## One-line description

A calmer daily routine for crypto users, built for Solana Seeker.

## Short description

Degen Detox helps crypto users step away from compulsive chart-checking. Set a protected morning, practise breathing, record market-checking urges and finish the day with a personal wind-down ritual. Android-native app blocking and birdsong reminders make the routine practical on Seeker. Lifetime Pro costs 0.1 SOL or 500 SKR through Mobile Wallet Adapter; SKR purchases also unlock Touch Grass. No monthly subscription, no trade execution and no health diary stored on-chain.

## Problem

For the intended user, checking a wallet or market chart can become an automatic response to uncertainty. Generic productivity tools do not always speak to that crypto-specific context. Degen Detox is built around a practical question: how can a user decide when to engage with markets, rather than repeatedly acting on an urge?

This is the founder's problem framing, not a claim of measured prevalence or a diagnosis of the community. The app supports voluntary digital-wellbeing routines and does not diagnose or treat addiction.

## Solution

A daily loop with four moments:

- **Morning Shield:** choose apps and a 1–4-hour window after the configured wake time. Once the block is active, the app does not offer an early stop or allow the selected schedule to be shortened.
- **Impulse Check:** rate the urge to check markets, optionally add context, and review local summaries. Three entries unlock descriptive statistics; time-of-day comparisons require more comparable observations.
- **Trading Wind-down:** finish three steps and, optionally, a fourth step written by the user.
- **Touch Grass:** SKR buyers can schedule 1–8-hour reminders with a short birdsong notification and open a nature scene from the notification.

Free breathing exercises and educational articles provide a useful starting point. Pro also includes 20 localized recipes with ingredient checklists. System settings, essential phone functions and supported wallets remain available.

## Why mobile and why Seeker

The product acts where the behaviour happens: on the phone. Native Android Accessibility events support selected-app blocking; local notifications work without keeping the Flutter screen open; Android settings retain user control. Solana Mobile Wallet Adapter lets the user authorize a purchase in a compatible wallet rather than disclose a private key to the app.

Seeker is the founder's real-device testing environment and the initial audience. Degen Detox is a Flutter Android app with native Kotlin integrations, not a website wrapper.

## Solana integration

Mainnet purchases use Mobile Wallet Adapter and a standard SOL transfer or SKR SPL transferChecked instruction. App-specific transaction memos help identify purchases. The app checks the finalized transaction's signer, destination, exact amount, token mint/program/decimals where applicable and balance changes before persisting the corresponding entitlement.

SOL purchases unlock lifetime Pro. SKR purchases unlock lifetime Pro plus Touch Grass. Existing SOL Pro owners can later make a separate full 500 SKR purchase without losing their base Pro while confirmation is pending. Restoration requires wallet ownership proof and on-chain receipt verification.

Verification currently runs in the client against RPC. There is no proprietary smart contract, server-side entitlement authority or tamper-proof licence claim. Public blockchain transactions are public; personal check-in content is not written to the chain.

## SKR integration prize explanation

SKR buys a specific consumer utility: a lifetime offline-break reminder experience in addition to Pro. It is not merely a colour theme or a displayed token balance. The feature includes configurable reminder intervals, a bundled 3.2-second birdsong alert, Android notification settings and the Touch Grass scene.

There are no token rewards, staking requirements, price predictions or promises of financial returns. The proposal is to use SKR to purchase time away from constant market engagement, not another incentive to keep watching a token price.

## Monetization

- Free: breathing, educational content and local urge check-ins/insights.
- Lifetime Pro: 0.1 SOL.
- Lifetime Pro plus Touch Grass: 500 SKR.
- Existing SOL Pro → SKR feature addition: separate 500 SKR payment, with no credit/refund of the earlier SOL payment.
- Network fees and any required recipient token-account creation costs are disclosed separately.
- No recurring app subscription.

## Current evidence and limitations

The founder has tested the Mainnet app on a physical Solana Seeker and reported successful SOL/SKR checkout, Pro activation, selected-app blocking, persistent notices, and the updated birdsong reminder. Automated validation for v0.10 includes 144 Flutter tests and 22 Android logic tests.

These are engineering and founder-test signals, not independent product-market fit, clinical outcomes, retention data or a user-count claim. The later SOL-owner → SKR upgrade and additional device/OEM behaviours still need broader acceptance testing. No investment, customer-count or revenue claim is made here.

## Development and AI disclosure

Degen Detox's current repository starts on 24 September 2026. It is a disclosed derivative of the creator's earlier Cortisol Zero v61 project, whose development began approximately six months earlier. Reuse includes Flutter/Android foundations, app-blocking components, recipe/breathing data and inherited audio.

New Degen-specific work includes the product/navigation, Solana/SKR purchase and recovery flows, native wallet-return fixes, strict-block and permission UX refinements, urge insights, personal evening ritual, Touch Grass and localized user experience. AI tools assisted development; the human creator directed the product and tested it on Seeker. We do not claim all code was written from scratch during the event. Organizer confirmation under section 6.1 is requested and must not be represented as already granted.

## Builder profile bio

Independent mobile-app builder focused on practical digital-wellbeing tools. I combine AI-assisted development with hands-on testing on Solana Seeker, building routines that help crypto users choose when to engage with their screens.

## Fields to complete only after owner confirmation

- Legal/profile name, username, country of legal residence, email and Telegram.
- Solo or named human team roster; age/eligibility and funding declarations.
- GitHub URL with actual judge access.
- Mainnet APK URL and, if accepted, separately labelled QA APK URL.
- Final three-minute real-device demo URL.
- Presentation URL or upload in the form's accepted format.
- Written eligibility clarification and appropriate pre-existing-work disclosure.

Never submit a placeholder URL or assert eligibility, funding status, age or residence without the owner's confirmation.
