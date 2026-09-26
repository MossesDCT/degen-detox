import 'package:flutter/material.dart';
import 'ritual_store.dart';
import 'ritual_strings.dart';
import 'strings.dart';
import 'luxury.dart';

class WindPanel extends StatefulWidget {
  const WindPanel({super.key, required this.locale, required this.store});
  final String locale;
  final RitualStore store;
  @override
  State<WindPanel> createState() => _WindPanelState();
}

class _WindPanelState extends State<WindPanel> {
  final checked = <int>{};
  final input = TextEditingController();
  String custom = '';
  String? error, validation;
  bool loading = true,
      loaded = false,
      editing = false,
      saving = false,
      done = false;
  String t(String key) => tr(key, widget.locale);
  String r(String key) => ritualText(key, widget.locale);
  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }

  Future<void> load() async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final value = await widget.store.custom();
      if (mounted) {
        setState(() {
          custom = value;
          loading = false;
          loaded = true;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          loading = false;
          error = r('storageError');
        });
      }
    }
  }

  void edit() {
    input.text = custom;
    setState(() {
      editing = true;
      validation = null;
      error = null;
    });
  }

  Future<void> saveCustom(String value) async {
    setState(() {
      saving = true;
      error = null;
    });
    try {
      await widget.store.saveCustom(value);
      if (mounted) {
        setState(() {
          custom = value.trim();
          editing = false;
          done = false;
          checked.remove(4);
        });
      }
    } catch (_) {
      if (mounted) setState(() => error = r('storageError'));
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  Future<void> remove() async {
    final yes = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
                title: Text(r('remove')),
                content: Text(r('removeAsk')),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(c, false),
                      child: Text(t('cancel'))),
                  FilledButton(
                      onPressed: () => Navigator.pop(c, true),
                      child: Text(r('remove'))),
                ]));
    if (yes == true && mounted) await saveCustom('');
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
          padding: EdgeInsets.all(24), child: LinearProgressIndicator());
    }
    if (!loaded) {
      return Column(children: [
        Text(error ?? r('storageError')),
        TextButton(onPressed: load, child: Text(r('retry'))),
      ]);
    }
    final count = custom.isEmpty ? 3 : 4;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t('windDesc'), style: const TextStyle(height: 1.7)),
      const SizedBox(height: 20),
      for (var i = 1; i <= 3; i++)
        CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            value: checked.contains(i),
            title: Text(t('wind$i')),
            onChanged: done || saving || editing
                ? null
                : (v) => setState(() {
                      if (v == true) {
                        checked.add(i);
                      } else {
                        checked.remove(i);
                      }
                    })),
      const SizedBox(height: 16),
      LuxuryPanel(
          pro: true,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GoldText(r('customTitle'),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Text(r('customHint'),
                style: const TextStyle(fontSize: 13, height: 1.5)),
            const SizedBox(height: 12),
            if (editing) ...[
              TextField(
                  key: const ValueKey('custom-step-input'),
                  controller: input,
                  enabled: !saving,
                  minLines: 1,
                  maxLines: 3,
                  maxLength: 120,
                  decoration: InputDecoration(
                      labelText: r('customField'), errorText: validation)),
              Wrap(spacing: 12, children: [
                FilledButton(
                    onPressed: saving
                        ? null
                        : () {
                            final text = input.text.trim();
                            if (text.isEmpty || text.characters.length > 120) {
                              setState(() => validation = r('invalid'));
                              return;
                            }
                            saveCustom(text);
                          },
                    child: Text(t('save'))),
                TextButton(
                    onPressed: saving
                        ? null
                        : () => setState(() {
                              editing = false;
                              validation = null;
                            }),
                    child: Text(t('cancel'))),
              ]),
            ] else if (custom.isEmpty)
              OutlinedButton.icon(
                  onPressed: saving ? null : edit,
                  icon: const Icon(Icons.add),
                  label: Text(r('addCustom')))
            else ...[
              CheckboxListTile(
                  key: const ValueKey('custom-step-checkbox'),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checked.contains(4),
                  title: Text(custom),
                  onChanged: done || saving
                      ? null
                      : (v) => setState(() {
                            if (v == true) {
                              checked.add(4);
                            } else {
                              checked.remove(4);
                            }
                          })),
              Wrap(spacing: 12, children: [
                TextButton.icon(
                    onPressed: saving ? null : edit,
                    icon: const Icon(Icons.edit_outlined),
                    label: Text(r('edit'))),
                TextButton(
                    onPressed: saving ? null : remove,
                    child: Text(r('remove'))),
              ]),
            ],
            if (saving) const LinearProgressIndicator(),
            if (error != null)
              Text(error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ])),
      const SizedBox(height: 24),
      Text('${checked.length}/$count'),
      const SizedBox(height: 10),
      FilledButton(
          onPressed: checked.length == count && !done && !saving && !editing
              ? () => setState(() => done = true)
              : null,
          child: Text(t('complete'))),
      if (done)
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.check_circle_outline,
                size: 40, color: Theme.of(context).colorScheme.primary)),
    ]);
  }
}
