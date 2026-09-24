import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Scrollable Terms of Service page.
class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.legalTermsOfService,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: context.textPrimary),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Section(
              title: l10n.termsTitle,
              body: '${l10n.termsLastUpdated}\n\n${l10n.termsIntro}',
            ),
            _Section(
              title: l10n.termsUseTitle,
              body: l10n.termsUseBody,
            ),
            _Section(
              title: l10n.termsProTitle,
              body: l10n.termsProBody,
            ),
            _Section(
              title: l10n.termsPermissionsTitle,
              body: l10n.termsPermissionsBody,
            ),
            _Section(
              title: l10n.termsDisclaimerTitle,
              body: l10n.termsDisclaimerBody,
            ),
            _Section(
              title: l10n.termsLiabilityTitle,
              body: l10n.termsLiabilityBody,
            ),
            _Section(
              title: l10n.termsChangesTitle,
              body: l10n.termsChangesBody,
            ),
            _Section(
              title: l10n.termsContactTitle,
              body: l10n.termsContactBody,
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: context.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
