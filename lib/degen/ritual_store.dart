import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Browser previews keep changes only in memory, matching their privacy notice.
class RitualStore {
  RitualStore({this.persistent = !kIsWeb});
  final bool persistent;
  final _checks = <String, Set<int>>{};
  String _custom = '';
  static const customKey = 'degen_custom_evening_step_v1';
  String ingredientKey(String id) => 'degen_ingredients_v1_$id';

  Future<Set<int>> ingredients(String id, int count) async {
    final raw = persistent
        ? (await SharedPreferences.getInstance())
                .getStringList(ingredientKey(id)) ??
            []
        : (_checks[id] ?? {}).map((i) => '$i').toList();
    return raw
        .map(int.tryParse)
        .whereType<int>()
        .where((i) => i >= 0 && i < count)
        .toSet();
  }

  Future<void> saveIngredients(String id, Set<int> checked) async {
    if (persistent &&
        !await (await SharedPreferences.getInstance()).setStringList(
            ingredientKey(id), checked.map((i) => '$i').toList())) {
      throw StateError('local write failed');
    }
    _checks[id] = Set.of(checked);
  }

  Future<String> custom() async => persistent
      ? (await SharedPreferences.getInstance()).getString(customKey) ?? ''
      : _custom;

  Future<void> saveCustom(String text) async {
    final value = text.trim();
    if (persistent &&
        !await (await SharedPreferences.getInstance())
            .setString(customKey, value)) {
      throw StateError('local write failed');
    }
    _custom = value;
  }
}
