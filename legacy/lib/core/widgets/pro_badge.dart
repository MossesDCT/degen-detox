import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../../core/theme/theme_helper.dart';

/// PRO badge widget for premium features.
/// Displays a small gold "PRO" label.
class ProBadge extends StatelessWidget {
  const ProBadge({
    super.key,
    this.size = ProBadgeSize.small,
    this.showIcon = false,
  });

  final ProBadgeSize size;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final isSmall = size == ProBadgeSize.small;
    final isMini = size == ProBadgeSize.mini;

    final double fontSize = isMini ? 9 : (isSmall ? 11 : 13);
    final EdgeInsets padding = isMini
        ? const EdgeInsets.symmetric(horizontal: 5, vertical: 2)
        : isSmall
            ? const EdgeInsets.symmetric(horizontal: 7, vertical: 3)
            : const EdgeInsets.symmetric(horizontal: 10, vertical: 5);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD4AF37), Color(0xFFFFD700)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(isMini ? 4 : 6),
        boxShadow: [
          BoxShadow(
            color: AppColors.proBadge.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon && !isMini) ...[
            Icon(
              Icons.star_rounded,
              color: Colors.white,
              size: isSmall ? 10 : 14,
            ),
            SizedBox(width: isMini ? 2 : 3),
          ],
          Text(
            'PRO',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 0.5,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

enum ProBadgeSize { mini, small, medium }

/// Lock overlay for PRO features - shows a lock icon with blur effect.
class ProLockOverlay extends StatelessWidget {
  const ProLockOverlay({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.lock_rounded,
                        color: AppColors.proBadge,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const ProBadge(size: ProBadgeSize.medium),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
