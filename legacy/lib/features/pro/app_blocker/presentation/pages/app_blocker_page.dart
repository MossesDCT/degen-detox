import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/localization/app_localizations_helper.dart';
import '../bloc/app_blocker_bloc.dart';
import '../../../../../core/theme/theme_helper.dart';
import '../../data/app_blocker_service.dart';
import 'permission_onboarding_page.dart';

/// App Blocker setup page (PRO).
///
/// Uses UsageStatsManager + SYSTEM_ALERT_WINDOW overlay to block
/// user-selected apps during morning hours.
class AppBlockerPage extends StatelessWidget {
  const AppBlockerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AppBlockerBloc>()..add(const LoadAppBlockerSettings()),
      child: const _AppBlockerView(),
    );
  }
}

class _AppBlockerView extends StatefulWidget {
  const _AppBlockerView();

  @override
  State<_AppBlockerView> createState() => _AppBlockerViewState();
}

class _AppBlockerViewState extends State<_AppBlockerView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Re-check permissions every time the user returns from settings.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<AppBlockerBloc>().add(const CheckPermissions());
    }
  }

  Future<void> _openPermissionWizard(BuildContext ctx) async {
    final result = await Navigator.of(ctx).push<bool>(
      MaterialPageRoute(
        builder: (_) => const PermissionOnboardingPage(),
      ),
    );
    if (result == true && ctx.mounted) {
      ctx.read<AppBlockerBloc>().add(const CheckPermissions());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(context.l10n.appBlocker),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<AppBlockerBloc, AppBlockerState>(
        builder: (context, state) {
          if (state is AppBlockerLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.sageGreen),
            );
          }

          if (state is AppBlockerLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Hero explanation
                _heroSection(context, theme),
                const SizedBox(height: 20),

                // v61 Hard mode: locked banner shown only during active blocking
                if (state.isBlocking) ...[
                  _lockedBanner(context, theme, state),
                  const SizedBox(height: 16),
                ],

                // Enable toggle
                _enableToggle(context, theme, state),
                const SizedBox(height: 16),

                // Block duration
                _durationSlider(context, theme, state),
                const SizedBox(height: 16),

                // Wake time
                _wakeTimePicker(context, theme, state),
                const SizedBox(height: 20),

                // Blocked apps list
                _blockedAppsSection(context, theme, state),
                const SizedBox(height: 16),

                // Permission status
                if (state.isEnabled) ...[
                  _permissionStatus(context, theme, state),
                  const SizedBox(height: 16),
                ],

                // Start / Stop blocking button
                if (state.isEnabled && state.blockedPackages.isNotEmpty)
                  _blockingButton(context, theme, state),

                const SizedBox(height: 32),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _heroSection(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightSage.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sageGreen.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🛡️', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Text(
                context.l10n.morningFocusMode,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.deepSage,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.blockerHeroText,
            style: theme.textTheme.bodySmall?.copyWith(
              color: context.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _enableToggle(
      BuildContext context, ThemeData theme, AppBlockerLoaded state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(context.shadowOpacity),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.block_rounded, color: AppColors.sageGreen),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.enableAppBlocker,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  state.isEnabled
                      ? context.l10n
                          .blockerActiveStatus('${state.blockDurationHours}')
                      : context.l10n.blockerInactive,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: state.isEnabled
                        ? AppColors.sageGreen
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: state.isEnabled,
            onChanged: state.isBlocking
                ? null // Disabled during active blocking
                : (v) {
                    context.read<AppBlockerBloc>().add(ToggleAppBlocker(v));
                  },
          ),
        ],
      ),
    ).animate(delay: 100.ms).fadeIn(duration: 400.ms);
  }

  Widget _durationSlider(
      BuildContext context, ThemeData theme, AppBlockerLoaded state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.blockerDurationLabel('${state.blockDurationHours}'),
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Slider(
            value: state.blockDurationHours.toDouble(),
            min: 1,
            max: 4,
            divisions: 3,
            label: '${state.blockDurationHours}h',
            // v61 Hard mode: lock during active blocking
            onChanged: state.isBlocking
                ? null
                : (v) {
                    context
                        .read<AppBlockerBloc>()
                        .add(UpdateBlockDuration(v.toInt()));
                  },
          ),
        ],
      ),
    ).animate(delay: 150.ms).fadeIn(duration: 400.ms);
  }

  Widget _wakeTimePicker(
      BuildContext context, ThemeData theme, AppBlockerLoaded state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.alarm_rounded, color: AppColors.sageGreen),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.wakeTime,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${state.wakeHour.toString().padLeft(2, '0')}:${state.wakeMinute.toString().padLeft(2, '0')}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: context.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            // v61 Hard mode: lock during active blocking
            onPressed: state.isBlocking
                ? null
                : () async {
                    final t = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                          hour: state.wakeHour, minute: state.wakeMinute),
                    );
                    if (t != null && context.mounted) {
                      context
                          .read<AppBlockerBloc>()
                          .add(UpdateWakeTime(t.hour, t.minute));
                    }
                  },
            child: Text(context.l10n.change),
          ),
        ],
      ),
    ).animate(delay: 200.ms).fadeIn(duration: 400.ms);
  }

  Widget _blockedAppsSection(
      BuildContext context, ThemeData theme, AppBlockerLoaded state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.apps_rounded, color: AppColors.sageGreen),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.l10n.blockedAppsTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextButton.icon(
                // v61 Hard mode: lock during active blocking
                onPressed: state.isBlocking
                    ? null
                    : () => _showAppPicker(context, state),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: Text(context.l10n.blockerAddApps),
              ),
            ],
          ),
          if (state.blockedPackages.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                context.l10n.blockerNoAppsSelected,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: context.textSecondary,
                ),
              ),
            ),
          if (state.blockedPackages.isNotEmpty) ...[
            const SizedBox(height: 8),
            ...state.blockedPackages.map((pkg) {
              // Find the app in installed list
              final app = state.installedApps.isEmpty
                  ? null
                  : state.installedApps.cast<InstalledApp?>().firstWhere(
                        (a) => a?.packageName == pkg,
                        orElse: () => null,
                      );
              final displayName = app?.appName ?? _shortPackageName(pkg);

              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    if (app?.iconBytes != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          app!.iconBytes!,
                          width: 32,
                          height: 32,
                        ),
                      )
                    else
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.sageGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.android,
                            size: 20, color: AppColors.sageGreen),
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        displayName,
                        style: theme.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      // v61 Hard mode: X disabled during active blocking
                      onTap: state.isBlocking
                          ? null
                          : () => context
                              .read<AppBlockerBloc>()
                              .add(ToggleBlockedApp(pkg)),
                      child: Icon(
                        Icons.close_rounded,
                        size: 20,
                        color: state.isBlocking
                            ? context.textSecondary.withOpacity(0.3)
                            : context.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    ).animate(delay: 250.ms).fadeIn(duration: 400.ms);
  }

  Widget _permissionStatus(
      BuildContext context, ThemeData theme, AppBlockerLoaded state) {
    if (state.hasAllPermissions) {
      // All three permissions granted — show compact success
      return Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.sageGreen.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.sageGreen.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: AppColors.sageGreen, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _permSmallRow(context, theme,
                      context.l10n.blockerPermAccessibility, true),
                  const SizedBox(height: 4),
                  _permSmallRow(
                      context, theme, context.l10n.blockerPermOverlay, true),
                  const SizedBox(height: 4),
                  _permSmallRow(
                      context, theme, context.l10n.blockerPermUsageStats, true),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Not all permissions granted — show prominent setup card
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.warning.withOpacity(0.35),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.shield_rounded,
                    color: AppColors.warning, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.permSetupRequired,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      context.l10n.permSetupRequiredDesc,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Status rows — which permissions are missing
          _permSmallRow(context, theme, context.l10n.blockerPermAccessibility,
              state.hasAccessibilityPermission),
          const SizedBox(height: 6),
          _permSmallRow(context, theme, context.l10n.blockerPermOverlay,
              state.hasOverlayPermission),
          const SizedBox(height: 6),
          _permSmallRow(context, theme, context.l10n.blockerPermUsageStats,
              state.hasUsageStatsPermission),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _openPermissionWizard(context),
              icon:
                  const Icon(Icons.tune_rounded, color: Colors.white, size: 20),
              label: Text(
                context.l10n.permOnboardingTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepSage,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _permSmallRow(
      BuildContext context, ThemeData theme, String label, bool granted) {
    return Row(
      children: [
        Icon(
          granted ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
          color: granted ? AppColors.sageGreen : AppColors.warning,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: granted ? AppColors.deepSage : context.textSecondary,
            fontWeight: granted ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  /// v61 Hard mode: prominent banner shown when the blocker is actively
  /// running. Tells the user that all settings are intentionally locked
  /// until the focus window ends. No escape — once started, the user
  /// committed to the duration they chose.
  Widget _lockedBanner(
      BuildContext context, ThemeData theme, AppBlockerLoaded state) {
    // Compute the end-of-blocking time: wakeTime + durationHours, wrapping
    // past midnight if necessary.
    final endHour = (state.wakeHour + state.blockDurationHours) % 24;
    final endMinute = state.wakeMinute;
    final endTimeStr =
        '${endHour.toString().padLeft(2, '0')}:${endMinute.toString().padLeft(2, '0')}';

    // Brand gold accent (matches app_blocker icon adaptive color).
    const gold = Color(0xFFD4A017);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: gold.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: gold.withOpacity(0.45), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lock_rounded,
            color: gold,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.blockerLockedTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: gold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.blockerLockedBody(endTimeStr),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: context.textSecondary,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate(delay: 50.ms).fadeIn(duration: 400.ms);
  }

  Widget _blockingButton(
      BuildContext context, ThemeData theme, AppBlockerLoaded state) {
    final isBlocking = state.isBlocking;

    // When schedule is active — show info, no stop button
    if (isBlocking) {
      final wakeTimeStr =
          '${state.wakeHour.toString().padLeft(2, '0')}:${state.wakeMinute.toString().padLeft(2, '0')}';
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.sageGreen.withOpacity(0.12),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.sageGreen.withOpacity(0.4)),
        ),
        child: Row(
          children: [
            const Icon(Icons.alarm_on_rounded, color: AppColors.sageGreen),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                context.l10n.blockerScheduleInfo(
                    wakeTimeStr, '${state.blockDurationHours}'),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.deepSage,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ).animate(delay: 300.ms).fadeIn(duration: 400.ms);
    }

    // Not blocking — show Start button
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          context.read<AppBlockerBloc>().add(const StartBlockingNow());
        },
        icon: const Icon(Icons.shield_rounded, color: Colors.white),
        label: Text(
          context.l10n.blockerStartButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sageGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ).animate(delay: 300.ms).fadeIn(duration: 400.ms);
  }

  String _shortPackageName(String pkg) {
    final parts = pkg.split('.');
    return parts.length > 1 ? parts.last : pkg;
  }

  void _showAppPicker(BuildContext context, AppBlockerLoaded state) {
    // Load installed apps if not loaded yet
    if (state.installedApps.isEmpty) {
      context.read<AppBlockerBloc>().add(const LoadInstalledApps());
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return BlocProvider.value(
          value: context.read<AppBlockerBloc>(),
          child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            maxChildSize: 0.9,
            minChildSize: 0.4,
            expand: false,
            builder: (sheetContext, scrollController) {
              return _AppPickerSheet(scrollController: scrollController);
            },
          ),
        );
      },
    );
  }
}

class _AppPickerSheet extends StatefulWidget {
  const _AppPickerSheet({required this.scrollController});
  final ScrollController scrollController;

  @override
  State<_AppPickerSheet> createState() => _AppPickerSheetState();
}

class _AppPickerSheetState extends State<_AppPickerSheet> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Handle bar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.l10n.blockerSelectApps,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Search
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (v) => setState(() => _search = v.toLowerCase()),
            style: TextStyle(color: context.textPrimary),
            decoration: InputDecoration(
              hintText: context.l10n.blockerSearchApps,
              prefixIcon: const Icon(Icons.search_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              isDense: true,
              filled: true,
              fillColor: context.cardBg,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // App list
        Expanded(
          child: BlocBuilder<AppBlockerBloc, AppBlockerState>(
            builder: (context, state) {
              if (state is! AppBlockerLoaded) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.installedApps.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(
                          color: AppColors.sageGreen),
                      const SizedBox(height: 12),
                      Text(context.l10n.blockerLoadingApps),
                    ],
                  ),
                );
              }

              final filtered = state.installedApps.where((app) {
                if (_search.isEmpty) return true;
                return app.appName.toLowerCase().contains(_search) ||
                    app.packageName.toLowerCase().contains(_search);
              }).toList();

              return ListView.builder(
                controller: widget.scrollController,
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final app = filtered[index];
                  final isBlocked =
                      state.blockedPackages.contains(app.packageName);

                  return ListTile(
                    leading: app.iconBytes != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              app.iconBytes!,
                              width: 40,
                              height: 40,
                            ),
                          )
                        : Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.sageGreen.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.android,
                                color: AppColors.sageGreen),
                          ),
                    title: Text(
                      app.appName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      app.packageName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                    trailing: Icon(
                      isBlocked
                          ? Icons.check_circle_rounded
                          : Icons.circle_outlined,
                      color: isBlocked
                          ? AppColors.sageGreen
                          : context.textSecondary,
                    ),
                    onTap: () {
                      context
                          .read<AppBlockerBloc>()
                          .add(ToggleBlockedApp(app.packageName));
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
