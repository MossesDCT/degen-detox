import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Scrollable Privacy Policy page.
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
          l10n.legalPrivacyPolicy,
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
              title: l10n.privacyPolicyTitle,
              body:
                  '${l10n.privacyPolicyLastUpdated}\n\n${l10n.privacyPolicyIntro}',
            ),
            _Section(
              title: l10n.privacyPolicyDataCollectedTitle,
              body: l10n.privacyPolicyDataCollectedBody,
            ),
            _Section(
              title: l10n.privacyPolicyPermissionsTitle,
              body: l10n.privacyPolicyPermissionsBody,
            ),
            _Section(
              title: l10n.privacyPolicyPurchasesTitle,
              body: l10n.privacyPolicyPurchasesBody,
            ),
            _Section(
              title: l10n.privacyPolicyThirdPartyTitle,
              body: l10n.privacyPolicyThirdPartyBody,
            ),
            _Section(
              title: l10n.privacyPolicyChildrenTitle,
              body: l10n.privacyPolicyChildrenBody,
            ),
            _Section(
              title: l10n.privacyPolicyContactTitle,
              body: l10n.privacyPolicyContactBody,
            ),
            _Section(
              title: l10n.privacyPolicyChangesTitle,
              body: l10n.privacyPolicyChangesBody,
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
