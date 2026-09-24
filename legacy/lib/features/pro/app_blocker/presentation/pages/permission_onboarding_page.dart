import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/localization/app_localizations_helper.dart';
import '../../../../../core/theme/theme_helper.dart';
import '../../data/app_blocker_service.dart';

/// Three-step permission onboarding wizard for App Blocker.
///
/// Step 1: Accessibility Service — most important, detects app switching.
/// Step 2: Overlay — shows the blocking screen over blocked apps.
/// Step 3: Usage Stats — tracks app usage data.
///
/// Automatically detects when user returns from settings (via
/// [WidgetsBindingObserver]) and shows a green checkmark if granted.
class PermissionOnboardingPage extends StatefulWidget {
  const PermissionOnboardingPage({super.key});

  @override
  State<PermissionOnboardingPage> createState() =>
      _PermissionOnboardingPageState();
}

class _PermissionOnboardingPageState extends State<PermissionOnboardingPage>
    with WidgetsBindingObserver {
  final AppBlockerNativeService _native = AppBlockerNativeService();
  final PageController _pageController = PageController();

  int _currentStep = 0; // 0 = accessibility, 1 = overlay, 2 = usage stats
  bool _accessibilityGranted = false;
  bool _overlayGranted = false;
  bool _usageGranted = false;
  bool _checking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermissions();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  /// Called when the app resumes (user returns from system settings).
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissions();
    }
  }

  Future<void> _checkPermissions() async {
    if (_checking) return;
    _checking = true;

    try {
      final perms = await _native.checkPermissions();
      final accessibility = perms['hasAccessibilityPermission'] ?? false;
      final overlay = perms['hasOverlayPermission'] ?? false;
      final usage = perms['hasUsageStatsPermission'] ?? false;

      if (!mounted) return;
      setState(() {
        _accessibilityGranted = accessibility;
        _overlayGranted = overlay;
        _usageGranted = usage;
      });

      // Auto-advance logic:
      // Step 0 (accessibility) → step 1 (overlay)
      if (_currentStep == 0 && _accessibilityGranted && !_overlayGranted) {
        await Future.delayed(const Duration(milliseconds: 600));
        if (mounted) _goToStep(1);
      }
      // Step 1 (overlay) → step 2 (usage stats)
      else if (_currentStep == 1 && _overlayGranted && !_usageGranted) {
        await Future.delayed(const Duration(milliseconds: 600));
        if (mounted) _goToStep(2);
      }

      // If all granted, pop back with success
      if (_accessibilityGranted && _overlayGranted && _usageGranted) {
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) Navigator.of(context).pop(true);
      }
    } catch (_) {
    } finally {
      _checking = false;
    }
  }

  void _goToStep(int step) {
    setState(() => _currentStep = step);
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, color: context.textPrimary),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        title: Text(
          context.l10n.permOnboardingTitle,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Step indicator
          _StepIndicator(
            currentStep: _currentStep,
            accessibilityGranted: _accessibilityGranted,
            overlayGranted: _overlayGranted,
            usageGranted: _usageGranted,
          ),
          const SizedBox(height: 12),

          // Pages
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (i) => setState(() => _currentStep = i),
              children: [
                // Step 1: Accessibility Service — disclosure card UI
                _AccessibilityDisclosureStep(
                  isGranted: _accessibilityGranted,
                  onGrant: () {
                    _native.requestAccessibilityPermission();
                  },
                  onNotNow: () => Navigator.of(context).pop(false),
                ),
                // Step 2: Overlay
                _PermissionStep(
                  stepNumber: 2,
                  iconEmoji: '🛡️',
                  title: context.l10n.permStepOverlayTitle,
                  description: context.l10n.permStepOverlayDesc,
                  isGranted: _overlayGranted,
                  onGrant: () {
                    _native.requestOverlayPermission();
                  },
                  grantButtonText: context.l10n.permStepOverlayButton,
                  grantedText: context.l10n.permStepGranted,
                  lottieHint: context.l10n.permStepOverlayLottieHint,
                  doesBullets: const [
                    'Shows a calming screen when a blocked app is opened',
                    'Covers the blocked app during your focus window',
                  ],
                  doesNotBullets: const [
                    'Cannot read other apps\' content',
                    'Does not record your screen or take screenshots',
                  ],
                ),
                // Step 3: Usage Stats
                _PermissionStep(
                  stepNumber: 3,
                  iconEmoji: '📊',
                  title: context.l10n.permStepUsageTitle,
                  description: context.l10n.permStepUsageDesc,
                  isGranted: _usageGranted,
                  onGrant: () {
                    _native.requestUsageStatsPermission();
                  },
                  grantButtonText: context.l10n.permStepUsageButton,
                  grantedText: context.l10n.permStepGranted,
                  lottieHint: context.l10n.permStepUsageLottieHint,
                  doesBullets: const [
                    'Detects when a blocked app is opened so the blocker activates',
                    'Reads app usage events (open/close) locally on your device',
                  ],
                  doesNotBullets: const [
                    'Does not read app content or personal data',
                    'Does not send any data to us or third parties',
                  ],
                ),
              ],
            ),
          ),

          // Bottom actions
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Step 0 done → go to step 1
                  if (_currentStep == 0 && _accessibilityGranted)
                    _nextButton(context, onPressed: () => _goToStep(1)),

                  // Step 1 done → go to step 2
                  if (_currentStep == 1 && _overlayGranted)
                    _nextButton(context, onPressed: () => _goToStep(2)),

                  // Step 2 done → finish
                  if (_currentStep == 2 &&
                      _accessibilityGranted &&
                      _overlayGranted &&
                      _usageGranted)
                    _doneButton(context),

                  // Back buttons
                  if (_currentStep == 1 && !_accessibilityGranted)
                    TextButton(
                      onPressed: () => _goToStep(0),
                      child: Text(context.l10n.permBackToStep1),
                    ),
                  if (_currentStep == 2 && !_overlayGranted)
                    TextButton(
                      onPressed: () => _goToStep(1),
                      child: Text(context.l10n.permBackToStep2),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nextButton(BuildContext context, {required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sageGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          context.l10n.permNextStep,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _doneButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pop(true),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sageGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          context.l10n.permAllDone,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// ── Step indicator dots ─────────────────────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.currentStep,
    required this.accessibilityGranted,
    required this.overlayGranted,
    required this.usageGranted,
  });

  final int currentStep;
  final bool accessibilityGranted;
  final bool overlayGranted;
  final bool usageGranted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          _dot(context, 0, accessibilityGranted),
          Expanded(
            child: Container(
              height: 2,
              color: accessibilityGranted
                  ? AppColors.sageGreen
                  : AppColors.sageGreen.withOpacity(0.2),
            ),
          ),
          _dot(context, 1, overlayGranted),
          Expanded(
            child: Container(
              height: 2,
              color: overlayGranted
                  ? AppColors.sageGreen
                  : AppColors.sageGreen.withOpacity(0.2),
            ),
          ),
          _dot(context, 2, usageGranted),
        ],
      ),
    );
  }

  Widget _dot(BuildContext context, int step, bool granted) {
    final isActive = currentStep == step;
    final isDone = granted;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isDone
            ? AppColors.sageGreen
            : isActive
                ? AppColors.sageGreen.withOpacity(0.15)
                : Colors.grey.shade200,
        shape: BoxShape.circle,
        border: Border.all(
          color:
              isDone || isActive ? AppColors.sageGreen : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Center(
        child: isDone
            ? const Icon(Icons.check_rounded, color: Colors.white, size: 20)
            : Text(
                '${step + 1}',
                style: TextStyle(
                  color: isActive ? AppColors.deepSage : Colors.grey.shade500,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
      ),
    );
  }
}

// ── Step 1: Accessibility disclosure card ───────────────────────────────────

class _AccessibilityDisclosureStep extends StatelessWidget {
  const _AccessibilityDisclosureStep({
    required this.isGranted,
    required this.onGrant,
    required this.onNotNow,
  });

  final bool isGranted;
  final VoidCallback onGrant;
  final VoidCallback onNotNow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          // Green shield icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.sageGreen.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.shield_rounded,
                size: 44,
                color: AppColors.sageGreen,
              ),
            ),
          ).animate().scale(
                duration: 500.ms,
                curve: Curves.elasticOut,
              ),
          const SizedBox(height: 20),

          // Title
          Text(
            context.l10n.permStepAccessibilityTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: context.textPrimary,
            ),
          ).animate(delay: 100.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 20),

          // Disclosure card
          Container(
            decoration: BoxDecoration(
              color: context.cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.sageGreen.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Section 1: What it accesses ✅
                _disclosureSection(
                  context: context,
                  theme: theme,
                  icon: Icons.check_circle_rounded,
                  iconColor: AppColors.sageGreen,
                  title: context.l10n.permDisclosureAccesses,
                  description: context.l10n.permDisclosureAccessesDesc,
                  isFirst: true,
                  isLast: false,
                ),
                Divider(
                  height: 1,
                  color: context.dividerColor,
                  indent: 16,
                  endIndent: 16,
                ),
                // Section 2: What it does NOT access ❌
                _disclosureSection(
                  context: context,
                  theme: theme,
                  icon: Icons.cancel_rounded,
                  iconColor: Colors.redAccent,
                  title: context.l10n.permDisclosureNotAccesses,
                  description: context.l10n.permDisclosureNotAccessesDesc,
                  isFirst: false,
                  isLast: false,
                ),
                Divider(
                  height: 1,
                  color: context.dividerColor,
                  indent: 16,
                  endIndent: 16,
                ),
                // Section 3: How data is used 🔒
                _disclosureSection(
                  context: context,
                  theme: theme,
                  icon: Icons.lock_rounded,
                  iconColor: Colors.blueAccent,
                  title: context.l10n.permDisclosureDataUsage,
                  description: context.l10n.permDisclosureDataUsageDesc,
                  isFirst: false,
                  isLast: true,
                ),
              ],
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 16),

          // Step-by-step instructions card
          _StepByStepCard(
            findText: context.l10n.permFindAppText,
            toggleText: context.l10n.permTapAndToggle,
          ).animate(delay: 300.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 16),

          // Video tutorial button (Part 1: Accessibility)
          _TutorialButton(
            label: context.l10n.permTutorialButton,
            videoUrl: 'https://youtube.com/shorts/DZn4624Sadw',
          ).animate(delay: 350.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 24),

          // Grant button or checkmark
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: isGranted
                ? _grantedBadge(context, theme)
                : _tapToGrantButton(context),
          ),
          const SizedBox(height: 12),

          // Not Now text button
          if (!isGranted)
            TextButton(
              onPressed: onNotNow,
              child: Text(
                'Not Now',
                style: TextStyle(
                  color: context.textSecondary,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _tapToGrantButton(BuildContext context) {
    return SizedBox(
      key: const ValueKey('tap_grant_btn'),
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onGrant,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sageGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
        ),
        child: Text(
          context.l10n.permTapToGrant,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1);
  }

  Widget _disclosureSection({
    required BuildContext context,
    required ThemeData theme,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required bool isFirst,
    required bool isLast,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: context.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _grantButton(BuildContext context) {
    return SizedBox(
      key: const ValueKey('grant_btn'),
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onGrant,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sageGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
        ),
        child: Text(
          context.l10n.permUnderstandContinue,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1);
  }

  Widget _grantedBadge(BuildContext context, ThemeData theme) {
    return Container(
      key: const ValueKey('granted_badge'),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.sageGreen.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sageGreen.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: AppColors.sageGreen,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            context.l10n.permStepGranted,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.deepSage,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ).animate().scale(
          duration: 400.ms,
          curve: Curves.elasticOut,
        );
  }
}

// ── Single permission step (Steps 2 & 3) ───────────────────────────────────

class _PermissionStep extends StatelessWidget {
  const _PermissionStep({
    required this.stepNumber,
    required this.iconEmoji,
    required this.title,
    required this.description,
    required this.isGranted,
    required this.onGrant,
    required this.grantButtonText,
    required this.grantedText,
    required this.lottieHint,
    this.doesBullets = const [],
    this.doesNotBullets = const [],
  });

  final int stepNumber;
  final String iconEmoji;
  final String title;
  final String description;
  final bool isGranted;
  final VoidCallback onGrant;
  final String grantButtonText;
  final String grantedText;
  final String lottieHint;
  final List<String> doesBullets;
  final List<String> doesNotBullets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          // Lottie placeholder area
          _lottieArea(context),
          const SizedBox(height: 24),

          // Title with emoji
          Text(
            iconEmoji,
            style: const TextStyle(fontSize: 48),
          ).animate().scale(
                duration: 500.ms,
                curve: Curves.elasticOut,
              ),
          const SizedBox(height: 16),

          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: context.textPrimary,
            ),
          ).animate(delay: 100.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 12),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: context.textSecondary,
              height: 1.6,
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 16),

          // What it does
          if (doesBullets.isNotEmpty)
            _BulletCard(
              title: context.l10n.permWhatItDoes,
              bullets: doesBullets,
              bulletEmoji: '✅',
            ).animate(delay: 250.ms).fadeIn(duration: 400.ms),
          if (doesBullets.isNotEmpty) const SizedBox(height: 10),

          // What it does NOT do
          if (doesNotBullets.isNotEmpty)
            _BulletCard(
              title: context.l10n.permWhatItDoesNot,
              bullets: doesNotBullets,
              bulletEmoji: '❌',
            ).animate(delay: 300.ms).fadeIn(duration: 400.ms),
          if (doesNotBullets.isNotEmpty) const SizedBox(height: 10),

          // Step-by-step card
          _StepByStepCard(
            findText: context.l10n.permFindAppText,
            toggleText: context.l10n.permTapAndToggle,
          ).animate(delay: 350.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 12),

          // Tutorial button (Part 2 or 3 depending on stepNumber)
          _TutorialButton(
            label: context.l10n.permTutorialButton,
            videoUrl: stepNumber == 2
                ? 'https://youtube.com/shorts/_FTcmdh0CvU'
                : 'https://youtube.com/shorts/XjPpjVFc4NM',
          ).animate(delay: 400.ms).fadeIn(duration: 400.ms),
          const SizedBox(height: 20),

          // Grant button or checkmark
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: isGranted
                ? _grantedBadge(context, theme)
                : _tapToGrantButton(context),
          ),
        ],
      ),
    );
  }

  Widget _tapToGrantButton(BuildContext context) {
    return SizedBox(
      key: const ValueKey('tap_grant_btn'),
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onGrant,
        icon: const Icon(Icons.settings_rounded, color: Colors.white, size: 20),
        label: Text(
          context.l10n.permTapToGrant,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepSage,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.1);
  }

  Widget _lottieArea(BuildContext context) {
    IconData icon;
    if (stepNumber == 2) {
      icon = Icons.layers_rounded;
    } else {
      icon = Icons.bar_chart_rounded;
    }

    return Container(
      height: 140,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.lightSage.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.sageGreen.withOpacity(0.15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: AppColors.sageGreen.withOpacity(0.5),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              lottieHint,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.sageGreen.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ).animate(delay: 50.ms).fadeIn(duration: 400.ms);
  }

  Widget _grantedBadge(BuildContext context, ThemeData theme) {
    return Container(
      key: const ValueKey('granted_badge'),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.sageGreen.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sageGreen.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: AppColors.sageGreen,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            grantedText,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.deepSage,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ).animate().scale(
          duration: 400.ms,
          curve: Curves.elasticOut,
        );
  }
}

// ── Step-by-step instructions card ─────────────────────────────────────────

class _StepByStepCard extends StatelessWidget {
  const _StepByStepCard({
    required this.findText,
    required this.toggleText,
  });

  final String findText;
  final String toggleText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.sageGreen.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.sageGreen.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          _StepRow(number: '1', text: findText),
          const SizedBox(height: 10),
          _StepRow(number: '2', text: toggleText),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: AppColors.sageGreen,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: context.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Tutorial link button ────────────────────────────────────────────────────

class _TutorialButton extends StatelessWidget {
  const _TutorialButton({required this.label, this.videoUrl});

  final String label;
  final String? videoUrl;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        final url = videoUrl ?? 'https://youtube.com/@cortisolzero';
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      icon: const Icon(Icons.play_circle_outline_rounded, size: 18),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.sageGreen,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Bullet list card ────────────────────────────────────────────────────────

class _BulletCard extends StatelessWidget {
  const _BulletCard({
    required this.title,
    required this.bullets,
    required this.bulletEmoji,
  });

  final String title;
  final List<String> bullets;
  final String bulletEmoji;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.dividerColor),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          ...bullets.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bulletEmoji, style: const TextStyle(fontSize: 13)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      b,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
