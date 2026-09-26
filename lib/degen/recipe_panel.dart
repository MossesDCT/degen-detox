import 'package:flutter/material.dart';
import '../features/pro/recipes/domain/entities/recipe.dart';
import 'ritual_store.dart';
import 'ritual_strings.dart';
import 'strings.dart';

class RecipePanel extends StatefulWidget {
  const RecipePanel(
      {super.key,
      required this.recipe,
      required this.locale,
      required this.store});
  final Recipe recipe;
  final String locale;
  final RitualStore store;
  @override
  State<RecipePanel> createState() => _RecipePanelState();
}

class _RecipePanelState extends State<RecipePanel> {
  Set<int> checked = {};
  bool loading = true, saving = false, loaded = false;
  String? error;
  String t(String key) => tr(key, widget.locale);
  String r(String key) => ritualText(key, widget.locale);
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    setState(() {
      loading = true;
      loaded = false;
      error = null;
    });
    try {
      final value = await widget.store
          .ingredients(widget.recipe.id, widget.recipe.ingredients.length);
      if (mounted) {
        setState(() {
          checked = value;
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

  Future<void> save(Set<int> value) async {
    setState(() {
      saving = true;
      error = null;
    });
    try {
      await widget.store.saveIngredients(widget.recipe.id, value);
      if (mounted) setState(() => checked = value);
    } catch (_) {
      if (mounted) setState(() => error = r('storageError'));
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    final accent = Theme.of(context).colorScheme.primary;
    Widget label(String value) => Text(value.toUpperCase(),
        style: const TextStyle(fontSize: 12, letterSpacing: 1.4));
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('${recipe.totalTimeLabel} · ${recipe.servings} ${t('servings')}',
          style: TextStyle(color: accent)),
      const SizedBox(height: 24),
      label(t('ingredients')),
      const SizedBox(height: 12),
      Text(r('ingredientHint'),
          style: const TextStyle(fontSize: 13, height: 1.5)),
      const SizedBox(height: 12),
      Text(r('measures'), style: const TextStyle(fontSize: 13, height: 1.5)),
      const SizedBox(height: 16),
      if (loading)
        const LinearProgressIndicator()
      else ...[
        Text('${r('added')}: ${checked.length}/${recipe.ingredients.length}',
            style: TextStyle(color: accent)),
        for (var i = 0; i < recipe.ingredients.length; i++)
          CheckboxListTile(
              key: ValueKey('ingredient-$i'),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: checked.contains(i),
              title: Text(recipe.ingredients[i],
                  style: TextStyle(
                      height: 1.5,
                      decoration: checked.contains(i)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: checked.contains(i)
                          ? Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: .65)
                          : null)),
              onChanged: saving || !loaded
                  ? null
                  : (v) {
                      final next = Set<int>.of(checked);
                      if (v == true) {
                        next.add(i);
                      } else {
                        next.remove(i);
                      }
                      save(next);
                    }),
        TextButton.icon(
            onPressed: saving || checked.isEmpty ? null : () => save({}),
            icon: const Icon(Icons.restart_alt),
            label: Text(r('restart'))),
      ],
      if (error != null) ...[
        Text(error!,
            style: TextStyle(color: Theme.of(context).colorScheme.error)),
        TextButton(onPressed: saving ? null : load, child: Text(r('retry'))),
      ],
      const SizedBox(height: 24),
      label(t('method')),
      const SizedBox(height: 12),
      for (var i = 0; i < recipe.instructions.length; i++)
        Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text('${i + 1}. ${recipe.instructions[i]}',
                style: const TextStyle(height: 1.7))),
      const SizedBox(height: 12),
      Text(t('foodNote'), style: const TextStyle(fontSize: 12, height: 1.7)),
    ]);
  }
}
