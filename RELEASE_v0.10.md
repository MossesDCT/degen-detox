# Degen Detox v0.10 release record

## Artifact

- Version `0.10.0+10`, package `com.degendetox.app`, ARM64 production flavor, no QA entitlement or owner-reset flags.
- APK bytes: 21,515,669.
- APK SHA-256: `1895e16d203781e727e65bccd489fed108f26fc623a28cc8030fd5256d96255a`.
- Certificate SHA-256 unchanged: `0f0b5832c2e6741c7d0639b342ce21b36076c3d8553e1869b9dc78fc43e5edb6`.
- No changes to payments, receipt storage, blocking, recipe checks or custom evening text.

## Sound

Derived from the existing inherited `assets/audio/morning_birds.mp3`, offset 10.3 seconds, duration 3.2 seconds. No new external recording or unlicensed download introduced. Original inherited-asset distribution-license review remains required before store release, as noted in the project README.

FFmpeg filter: `highpass=f=600,lowpass=f=8500,loudnorm=I=-16:TP=-1.5:LRA=7,afade=t=in:d=0.04,afade=t=out:st=2.95:d=0.25`; mono 44.1kHz Vorbis quality 6. Output is 32,149 bytes, exact decoded stream duration 3.200 seconds, measured sample peak -2.7dB, mean sample volume -20.1dB. Not a claim about physical speaker loudness.

Android raw resource SHA-256: `60df2ecb816a2d83b1b0e01308fa344103e23bde3cb3b38a36baeda4e0e0d572`. `raw/keep.xml` protects the dynamically referenced sound from resource shrinking. AAPT confirms `raw/touch_grass_birds`; optimized APK stores bytes at `res/RK.ogg`, whose extracted SHA matches the original. Sound uses a resource-name URI, not an unstable compiled integer resource ID.

## Notification behavior

New stable channel `touch_grass_birds_v1` replaces generic-default usage from `touch_grass_v2`. Android notification-channel sound/importance cannot be rewritten after creation; users retain control ([Android Developers](https://developer.android.com/develop/ui/views/notifications/channels)): https://developer.android.com/develop/ui/views/notifications/channels.

Creation preserves prior channel importance (including blocked/low), explicit silence, vibration state and private/secret lock-screen preference. API 30+ user-selected sounds are preserved when `hasUserSetSound()` reports them. An existing birds channel is never reconfigured. No channels are deleted or recreated to defeat user choices.

Defaults for a fresh channel: high importance, 3.2-second birdsong, two brief vibration pulses and public visibility for generic reminder content. AudioAttributes use notification-event/sonification, not media/alarm volume. DND bypass is disabled. API 24–25 use the same sound through notification-builder APIs; DEFAULT_ALL no longer overrides custom sound.

Repeated reminders may alert again, with no sound loop, full-screen intent, volume override, media-player service, screen-unlock or forced activity launch. Tapping still routes into the existing Touch Grass scene. Existing inexact alarm cadence and 10-second test scheduling are unchanged.

New localized UI guidance in six languages and a direct Android channel-settings button, with platform-error fallback guidance. Browser remains non-scheduling and hides the native settings control.

## Verification and limits

- Flutter analysis: no issues; full suite 144 passing.
- Android release JUnit: 22 passing, including three channel-policy tests. These test pure migration policy, not Android's actual sound playback.
- Production APK and web release compile; package/version/signature and embedded audio checks pass.
- Flutter widget tests cover localized sound guidance at 360px in six languages; native settings channel dispatch/failure tests pass.
- Focused Playwright `qa_v10.cjs` passed with zero page errors; Lithuanian sound card screenshot visually inspected at 390px, native-only settings hidden in web preview.
- Physical Seeker locked-screen playback, notification permission/state, OEM power management and user-selected channel migration remain device acceptance tasks. No live payment performed.
- Build environment ran out of disk during the first test compile and stalled; killed that test process and removed only regenerable build intermediates and its temporary compiler files. Successful retry results are stated above.
