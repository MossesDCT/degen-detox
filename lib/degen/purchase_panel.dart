import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'domain.dart';
import 'payments.dart';
import 'strings.dart';
import 'luxury.dart';
import 'upgrade_strings.dart';

class PurchasePanel extends StatefulWidget {
  const PurchasePanel(
      {super.key,
      required this.service,
      required this.locale,
      required this.onChanged,
      required this.onPreview});
  final PaymentService service;
  final String locale;
  final VoidCallback onChanged;
  final ValueChanged<AccessTier> onPreview;
  @override
  State<PurchasePanel> createState() => _PurchasePanelState();
}

class _PurchasePanelState extends State<PurchasePanel> {
  bool busy = false;
  String? message;
  final signature = TextEditingController();
  String t(String k) => tr(k, widget.locale);
  @override
  void dispose() {
    signature.dispose();
    super.dispose();
  }

  Future<void> perform(Future<PurchaseReceipt> Function() action) async {
    if (busy) return;
    setState(() {
      busy = true;
      message = null;
    });
    try {
      await action();
      widget.onChanged();
      if (mounted) setState(() => message = t('owned'));
    } on PaymentFailure catch (e) {
      if (mounted) setState(() => message = t(e.code));
    } catch (_) {
      if (mounted) setState(() => message = t('networkError'));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> buy(AccessTier tier) async {
    final price = tier == AccessTier.sol ? '0.1 SOL' : '500 SKR';
    final yes = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
                title: Text(t('confirmPayment')),
                content: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      Text(price,
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 12),
                      Text(t('noSubscription')),
                      if (widget.service.receipt?.tier == AccessTier.sol &&
                          tier == AccessTier.skr) ...[
                        const SizedBox(height: 12),
                        Text(upgradeText('body', widget.locale)),
                      ],
                      const SizedBox(height: 16),
                      Text(t('fees')),
                      const SizedBox(height: 16),
                      Text('${t('recipient')} · Solana mainnet'),
                      SelectableText(merchant,
                          style: const TextStyle(fontSize: 12)),
                      if (tier == AccessTier.skr) ...[
                        const SizedBox(height: 12),
                        const Text('SKR mint'),
                        const SelectableText(skrMint,
                            style: TextStyle(fontSize: 12)),
                        const Text('+ Touch Grass'),
                      ],
                    ])),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(c, false),
                      child: Text(t('cancel'))),
                  FilledButton(
                      onPressed: () => Navigator.pop(c, true),
                      child: Text(t('openWallet'))),
                ]));
    if (yes == true && mounted) await perform(() => widget.service.buy(tier));
  }

  @override
  Widget build(BuildContext context) {
    final receipt = widget.service.receipt;
    final nativePayments = !kIsWeb && !qaBuild;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GoldText(t('lifetime'),
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.w700, height: 1.2)),
      const SizedBox(height: 12),
      Text(t('noSubscription'), style: const TextStyle(height: 1.7)),
      if (qaBuild || kIsWeb)
        Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Text(t(qaBuild ? 'qaBanner' : 'androidPayment'))),
      const SizedBox(height: 22),
      if (receipt != null) ...[
        const Icon(Icons.check_circle_outline, size: 42, color: champagne),
        const SizedBox(height: 12),
        Text(
            '${t('owned')} · ${receipt.tier == AccessTier.skr ? 'SKR + Touch Grass' : 'SOL'}',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        FilledButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_forward),
            label: Text(t('continueInApp'))),
        const SizedBox(height: 12),
        SelectableText(receipt.wallet, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 12),
        SelectableText(receipt.signature, style: const TextStyle(fontSize: 12)),
        TextButton.icon(
            onPressed: () =>
                Clipboard.setData(ClipboardData(text: receipt.signature)),
            icon: const Icon(Icons.copy),
            label: Text(t('receiptInput'))),
        if (receipt.tier == AccessTier.sol) ...[
          const SizedBox(height: 20),
          LuxuryPanel(
              pro: true,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoldText(upgradeText('title', widget.locale),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    Text(upgradeText('body', widget.locale),
                        style: const TextStyle(height: 1.6)),
                    const SizedBox(height: 12),
                    Text(upgradeText('kept', widget.locale),
                        style: const TextStyle(fontSize: 13, height: 1.6)),
                    const SizedBox(height: 18),
                    FilledButton(
                        onPressed: !busy &&
                                nativePayments &&
                                widget.service.pending == null
                            ? () => buy(AccessTier.skr)
                            : null,
                        child: Text(upgradeText('buy', widget.locale))),
                  ])),
          const SizedBox(height: 20),
        ],
      ] else
        for (final tier in [AccessTier.sol, AccessTier.skr])
          Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: goldFor(context).withValues(alpha: .45)),
                  gradient: LinearGradient(colors: [
                    goldFor(context).withValues(alpha: .10),
                    goldFor(context).withValues(alpha: .02)
                  ]),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoldText(tier == AccessTier.sol ? '0.1 SOL' : '500 SKR',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 12),
                    GoldText(
                        '${t('morning')}\n${t('recipes')} · 20\n${t('wind')}'
                        '${tier == AccessTier.skr ? '\n+ Touch Grass' : ''}',
                        style: const TextStyle(height: 1.9)),
                    const SizedBox(height: 18),
                    FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor: champagne,
                            foregroundColor: const Color(0xff192519)),
                        onPressed: !busy &&
                                nativePayments &&
                                widget.service.pending == null
                            ? () => buy(tier)
                            : null,
                        child: Text(
                            t(tier == AccessTier.sol ? 'buySol' : 'buySkr'))),
                    if (kIsWeb || kDebugMode)
                      TextButton(
                          onPressed: busy ? null : () => widget.onPreview(tier),
                          child: Text(t('demo'))),
                  ])),
      Text(t('fees'), style: const TextStyle(fontSize: 12, height: 1.6)),
      const SizedBox(height: 12),
      Text('${t('recipient')} · Solana mainnet',
          style: const TextStyle(fontSize: 12)),
      const SelectableText(merchant, style: TextStyle(fontSize: 12)),
      const SizedBox(height: 24),
      if (busy) ...[
        const LinearProgressIndicator(),
        const SizedBox(height: 12),
        Text(t('processing'), style: const TextStyle(height: 1.6)),
      ],
      if (message != null || widget.service.pending != null)
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(message ?? t('pendingPayment'),
                style: const TextStyle(height: 1.7))),
      Text(t('restoreHint'), style: const TextStyle(fontSize: 13, height: 1.6)),
      const SizedBox(height: 14),
      TextField(
          controller: signature,
          enabled: !busy,
          maxLength: 100,
          decoration: InputDecoration(labelText: t('receiptInput'))),
      OutlinedButton.icon(
          onPressed: !busy && nativePayments
              ? () => perform(
                  () => widget.service.restore(signature: signature.text))
              : null,
          icon: const Icon(Icons.restore),
          label: Text(t('restore'))),
      if (kIsWeb || kDebugMode)
        Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(t('demoNote'), style: const TextStyle(fontSize: 12))),
    ]);
  }
}
