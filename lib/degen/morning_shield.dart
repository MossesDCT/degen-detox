import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../features/pro/app_blocker/data/app_blocker_service.dart';
import 'blocker_apps.dart';
import 'luxury.dart';
import 'strict_strings.dart';
import 'strings.dart';

/// Both two-digit fields select their full value on the first touch.
class WakeTimeDialog extends StatefulWidget {
  const WakeTimeDialog(
      {super.key, required this.initial, required this.locale});
  final TimeOfDay initial;
  final String locale;
  @override
  State<WakeTimeDialog> createState() => _WakeTimeDialogState();
}

class _WakeTimeDialogState extends State<WakeTimeDialog> {
  late final h = TextEditingController(
      text: widget.initial.hour.toString().padLeft(2, '0'));
  late final m = TextEditingController(
      text: widget.initial.minute.toString().padLeft(2, '0'));
  final hourFocus = FocusNode(), minuteFocus = FocusNode();
  bool invalid = false;
  void select(TextEditingController c) =>
      c.selection = TextSelection(baseOffset: 0, extentOffset: c.text.length);
  @override
  void initState() {
    super.initState();
    hourFocus.addListener(() {
      if (hourFocus.hasFocus) select(h);
    });
    minuteFocus.addListener(() {
      if (minuteFocus.hasFocus) select(m);
    });
  }

  @override
  void dispose() {
    h.dispose();
    m.dispose();
    hourFocus.dispose();
    minuteFocus.dispose();
    super.dispose();
  }

  void save() {
    final hour = int.tryParse(h.text), minute = int.tryParse(m.text);
    if (hour == null ||
        minute == null ||
        hour < 0 ||
        hour > 23 ||
        minute < 0 ||
        minute > 59) {
      setState(() => invalid = true);
      return;
    }
    Navigator.pop(context, TimeOfDay(hour: hour, minute: minute));
  }

  Widget field(
          TextEditingController c, FocusNode focus, String label, bool first) =>
      Expanded(
          child: TextField(
        key: ValueKey(first ? 'wake-hour' : 'wake-minute'),
        controller: c,
        focusNode: focus,
        autofocus: first,
        keyboardType: TextInputType.number,
        textInputAction: first ? TextInputAction.next : TextInputAction.done,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2)
        ],
        onTap: () => select(c),
        onSubmitted: (_) => first ? minuteFocus.requestFocus() : save(),
        style: const TextStyle(fontSize: 32),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            labelText: strictText(label, widget.locale),
            helperText: first ? '0–23' : '0–59'),
      ));
  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(strictText('time', widget.locale)),
        content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(children: [
            field(h, hourFocus, 'hour', true),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(':', style: TextStyle(fontSize: 28))),
            field(m, minuteFocus, 'minute', false),
          ]),
          if (invalid)
            Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(strictText('invalid', widget.locale))),
        ])),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(tr('cancel', widget.locale))),
          FilledButton(onPressed: save, child: Text(tr('save', widget.locale))),
        ],
      );
}

class MorningShieldPanel extends StatefulWidget {
  const MorningShieldPanel({
    super.key,
    required this.locale,
    required this.native,
    required this.preview,
    required this.initialWake,
    required this.initialHours,
    required this.initialSelected,
    required this.initialNames,
    required this.initialApps,
    required this.loadApps,
    required this.showSheet,
    required this.permissions,
    required this.onSaved,
  });
  final String locale;
  final AppBlockerNativeService native;
  final bool preview;
  final TimeOfDay initialWake;
  final int initialHours;
  final Set<String> initialSelected;
  final Map<String, String> initialNames;
  final List<InstalledApp> initialApps;
  final Future<List<InstalledApp>> Function() loadApps;
  final Future<void> Function(String, Widget) showSheet;
  final Future<void> Function() permissions;
  final Future<void> Function(
          TimeOfDay, int, Set<String>, Map<String, String>, List<InstalledApp>)
      onSaved;
  @override
  State<MorningShieldPanel> createState() => _MorningShieldPanelState();
}

class _MorningShieldPanelState extends State<MorningShieldPanel>
    with WidgetsBindingObserver {
  late TimeOfDay wake = widget.initialWake;
  late int hours = widget.initialHours;
  late Set<String> selected = {...widget.initialSelected};
  late Map<String, String> names = {...widget.initialNames};
  late List<InstalledApp> apps = [...widget.initialApps];
  Map<String, dynamic>? block;
  bool querying = false, stateError = false, saving = false;
  String? message;
  Timer? timer;
  int ticks = 0;
  bool get active => block?['active'] == true;
  String t(String k) => tr(k, widget.locale);
  String s(String k) => strictText(k, widget.locale);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    check();
    if (!widget.preview) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(() {});
        if (++ticks % 5 == 0 || (active && remaining == Duration.zero)) check();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) check();
  }

  DateTime get end => DateTime.fromMillisecondsSinceEpoch(
      (block?['endTimeMs'] as num?)?.toInt() ?? 0);
  Duration get remaining {
    final diff = end.difference(DateTime.now());
    return diff.isNegative ? Duration.zero : diff;
  }

  Future<void> check() async {
    if (widget.preview) {
      block = {'active': false};
      return;
    }
    if (querying) return;
    querying = true;
    try {
      final value = await widget.native
          .getBlockState()
          .timeout(const Duration(seconds: 5));
      if (mounted) {
        setState(() {
          block = value;
          stateError = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => stateError = true);
    } finally {
      querying = false;
    }
  }

  Future<void> pick() async {
    await check();
    if (!mounted || active || stateError) return;
    await widget.showSheet(
        t('apps'),
        BlockerAppPicker(
          locale: widget.locale,
          initialSelected: selected,
          loadApps: widget.loadApps,
          onSave: (selection, loaded) {
            if (mounted && !active) {
              setState(() {
                selected = selection;
                apps = loaded;
                for (final a in loaded) {
                  names[a.packageName] = a.appName;
                }
              });
            }
            Navigator.pop(context);
          },
        ));
  }

  Future<void> save() async {
    if (saving || active || stateError) return;
    setState(() {
      saving = true;
      message = null;
    });
    try {
      if (!widget.preview) {
        final p = await widget.native.checkPermissions();
        if (p['hasAccessibilityPermission'] != true ||
            p['serviceConnected'] != true ||
            selected.isEmpty) {
          if (mounted) setState(() => message = t('needPermission'));
          return;
        }
        if (!mounted) return;
        final accepted = await showDialog<bool>(
            context: context,
            builder: (c) => AlertDialog(
                  title: Text(s('confirm')),
                  content: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                            '${wake.format(c)} · $hours ${t(hours == 1 ? 'hour' : 'hours')} · ${selected.length} ${t('apps')}'),
                        const SizedBox(height: 16),
                        Text(s('notice')),
                      ])),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(c, false),
                        child: Text(t('cancel'))),
                    FilledButton(
                        onPressed: () => Navigator.pop(c, true),
                        child: Text(s('accept'))),
                  ],
                ));
        if (accepted != true || !mounted) return;
        await widget.native.scheduleBlocking(
            blockedPackages: selected.toList(),
            wakeHour: wake.hour,
            wakeMinute: wake.minute,
            durationHours: hours);
      }
      // Persist Flutter settings only after Android accepts the change.
      await widget.onSaved(wake, hours, selected, names, apps);
      if (mounted) {
        setState(() => message = t(widget.preview ? 'saved' : 'blockSaved'));
      }
      await check();
    } on PlatformException catch (e) {
      if (mounted) {
        setState(() => message =
            e.code == 'BLOCK_ACTIVE' ? s('locked') : t('needPermission'));
      }
      await check();
    } catch (_) {
      if (mounted) setState(() => message = s('stateError'));
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (stateError) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(s('stateError')),
        TextButton(
            onPressed: check, child: Text(blockerText('retry', widget.locale))),
      ]);
    }
    if (block == null) {
      return Column(children: [
        const LinearProgressIndicator(),
        const SizedBox(height: 16),
        Text(s('checking'))
      ]);
    }
    if (active) {
      final lockedSelection =
          (block?['packages'] as List?)?.whereType<String>().toSet() ??
              selected;
      final d = remaining;
      final time =
          '${d.inHours.toString().padLeft(2, '0')}:${(d.inMinutes % 60).toString().padLeft(2, '0')}:${(d.inSeconds % 60).toString().padLeft(2, '0')}';
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Icon(Icons.lock_outline, color: champagne, size: 42),
        const SizedBox(height: 16),
        GoldText(s('active'),
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        Text(
            s('ends').replaceAll(
                '{time}', TimeOfDay.fromDateTime(end).format(context)),
            style: const TextStyle(fontSize: 20, height: 1.5)),
        const SizedBox(height: 24),
        FittedBox(
            child: Text(time,
                style: const TextStyle(
                    fontSize: 44,
                    fontFeatures: [FontFeature.tabularFigures()]))),
        Text(s('remaining'), style: const TextStyle(fontSize: 12, height: 1.6)),
        const SizedBox(height: 24),
        Text(s('locked'), style: const TextStyle(height: 1.7)),
        if (block?['serviceConnected'] != true) ...[
          const SizedBox(height: 16),
          Text(s('serviceOff')),
        ],
        const SizedBox(height: 20),
        SelectedAppsSummary(
            locale: widget.locale,
            selected: lockedSelection,
            apps: apps,
            savedNames: names),
      ]);
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(widget.preview ? t('androidOnly') : s('notice'),
          style: const TextStyle(fontSize: 13, height: 1.7)),
      const SizedBox(height: 20),
      ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(t('wake')),
          trailing: Text(wake.format(context),
              style: TextStyle(
                  fontSize: 24, color: Theme.of(context).colorScheme.primary)),
          onTap: saving
              ? null
              : () async {
                  final value = await showDialog<TimeOfDay>(
                      context: context,
                      builder: (_) =>
                          WakeTimeDialog(initial: wake, locale: widget.locale));
                  if (value != null && mounted && !active) {
                    setState(() => wake = value);
                  }
                }),
      const SizedBox(height: 20),
      Text(t('duration').toUpperCase()),
      const SizedBox(height: 12),
      Wrap(spacing: 12, children: [
        for (var i = 1; i <= 4; i++)
          ChoiceChip(
              label: Text('$i ${t(i == 1 ? 'hour' : 'hours')}'),
              selected: hours == i,
              onSelected: saving ? null : (_) => setState(() => hours = i)),
      ]),
      const SizedBox(height: 20),
      if (!widget.preview) ...[
        OutlinedButton.icon(
            onPressed: saving ? null : widget.permissions,
            icon: const Icon(Icons.accessibility_new),
            label: Text(t('permissions'))),
        const SizedBox(height: 12),
      ],
      OutlinedButton.icon(
          onPressed: saving ? null : pick,
          icon: const Icon(Icons.apps),
          label: Text('${t('selectApps')} · ${selected.length}')),
      const SizedBox(height: 16),
      SelectedAppsSummary(
          locale: widget.locale,
          selected: selected,
          apps: apps,
          savedNames: names),
      const SizedBox(height: 12),
      Text(blockerText('apply', widget.locale),
          style: const TextStyle(fontSize: 12, height: 1.6)),
      const SizedBox(height: 20),
      FilledButton(
          onPressed: saving ? null : save,
          child: saving
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2))
              : Text(t('save'))),
      if (message != null)
        Padding(padding: const EdgeInsets.only(top: 16), child: Text(message!)),
    ]);
  }
}
