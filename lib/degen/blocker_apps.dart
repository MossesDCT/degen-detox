import 'package:flutter/material.dart';
import '../features/pro/app_blocker/data/app_blocker_service.dart';
import 'strings.dart';

String blockerText(String key, String locale) {
  final index = languages.indexOf(locale);
  return blockerWords[key]![index < 0 ? 0 : index];
}

const blockerWords = <String, List<String>>{
  'search': [
    'Search apps',
    'Ieškoti programėlių',
    'Buscar apps',
    'Rechercher une app',
    'Apps suchen',
    '앱 검색'
  ],
  'selected': [
    'Selected apps',
    'Pasirinktos programėlės',
    'Apps seleccionadas',
    'Apps sélectionnées',
    'Ausgewählte Apps',
    '선택한 앱'
  ],
  'none': [
    'No apps selected yet.',
    'Dar nepasirinkta programėlių.',
    'Aún no hay apps seleccionadas.',
    'Aucune app sélectionnée.',
    'Noch keine Apps ausgewählt.',
    '아직 선택한 앱이 없습니다.'
  ],
  'noMatches': [
    'No matching apps. Try another name.',
    'Nerasta. Pabandyk kitą pavadinimą.',
    'Sin resultados. Prueba otro nombre.',
    'Aucun résultat. Essaie un autre nom.',
    'Keine Treffer. Versuche einen anderen Namen.',
    '검색 결과가 없습니다. 다른 이름을 입력하세요.'
  ],
  'onlySelected': [
    'Selected only',
    'Tik pasirinktos',
    'Solo seleccionadas',
    'Sélectionnées uniquement',
    'Nur ausgewählte',
    '선택한 앱만'
  ],
  'clear': [
    'Clear search',
    'Išvalyti paiešką',
    'Borrar búsqueda',
    'Effacer la recherche',
    'Suche löschen',
    '검색 지우기'
  ],
  'failed': [
    'Could not load apps. Your selection is unchanged.',
    'Nepavyko įkelti programėlių. Tavo pasirinkimai nepakeisti.',
    'No se pudieron cargar las apps. Tu selección no cambió.',
    'Impossible de charger les apps. Ta sélection est conservée.',
    'Apps konnten nicht geladen werden. Deine Auswahl bleibt erhalten.',
    '앱을 불러올 수 없습니다. 선택 항목은 유지됩니다.'
  ],
  'retry': [
    'Try again',
    'Bandyti dar kartą',
    'Reintentar',
    'Réessayer',
    'Erneut versuchen',
    '다시 시도'
  ],
  'apply': [
    'Save Morning Shield to apply changes to blocking.',
    'Ryto apsaugos lange paspausk „Išsaugoti“, kad pakeitimai būtų taikomi blokavimui.',
    'Guarda el Escudo matinal para aplicar los cambios.',
    'Enregistre le Bouclier du matin pour appliquer les changements.',
    'Morgenschutz speichern, um die Änderungen anzuwenden.',
    '차단에 변경 사항을 적용하려면 아침 보호를 저장하세요.'
  ],
  'safe': [
    'Phone, system tools and supported wallets are excluded.',
    'Telefonas, sistemos įrankiai ir palaikomos piniginės neblokuojami.',
    'Se excluyen teléfono, herramientas del sistema y wallets compatibles.',
    'Téléphone, outils système et portefeuilles pris en charge sont exclus.',
    'Telefon, Systemwerkzeuge und unterstützte Wallets sind ausgeschlossen.',
    '전화, 시스템 도구 및 지원 지갑은 제외됩니다.'
  ],
};

List<InstalledApp> filterBlockerApps(List<InstalledApp> apps, String query,
    Set<String> selected, bool onlySelected) {
  final q = query.trim().toLowerCase();
  final unique = {for (final a in apps) a.packageName: a};
  return unique.values
      .where((a) =>
          (!onlySelected || selected.contains(a.packageName)) &&
          (q.isEmpty ||
              a.appName.toLowerCase().contains(q) ||
              a.packageName.toLowerCase().contains(q)))
      .toList()
    ..sort(
        (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
}

class BlockerAppIcon extends StatelessWidget {
  const BlockerAppIcon(this.app, {super.key});
  final InstalledApp app;
  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: app.iconBytes == null
          ? const Icon(Icons.apps_rounded, size: 28)
          : Image.memory(app.iconBytes!,
              width: 28,
              height: 28,
              errorBuilder: (_, error, stack) =>
                  const Icon(Icons.apps_rounded, size: 28)));
}

class SelectedAppsSummary extends StatelessWidget {
  const SelectedAppsSummary({
    super.key,
    required this.locale,
    required this.selected,
    required this.apps,
    required this.savedNames,
  });
  final String locale;
  final Set<String> selected;
  final List<InstalledApp> apps;
  final Map<String, String> savedNames;
  @override
  Widget build(BuildContext context) {
    final byId = {for (final a in apps) a.packageName: a};
    final names = selected
        .map((id) =>
            byId[id] ??
            InstalledApp(packageName: id, appName: savedNames[id] ?? id))
        .toList()
      ..sort(
          (a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('${blockerText('selected', locale)} · ${selected.length}',
          style: const TextStyle(fontWeight: FontWeight.w600)),
      const SizedBox(height: 10),
      if (names.isEmpty)
        Text(blockerText('none', locale))
      else
        Wrap(spacing: 8, runSpacing: 4, children: [
          for (final a in names)
            Chip(
                avatar: BlockerAppIcon(a),
                label: Text(a.appName),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
        ]),
    ]);
  }
}

/// Search stays above the virtualized list; selection is a draft until Save.
class BlockerAppPicker extends StatefulWidget {
  const BlockerAppPicker({
    super.key,
    required this.locale,
    required this.initialSelected,
    required this.loadApps,
    required this.onSave,
  });
  final String locale;
  final Set<String> initialSelected;
  final Future<List<InstalledApp>> Function() loadApps;
  final void Function(Set<String>, List<InstalledApp>) onSave;
  @override
  State<BlockerAppPicker> createState() => _BlockerAppPickerState();
}

class _BlockerAppPickerState extends State<BlockerAppPicker> {
  final search = TextEditingController();
  late Set<String> selected;
  List<InstalledApp> apps = [];
  bool loading = true, failed = false, onlySelected = false;
  String b(String key) => blockerText(key, widget.locale);
  @override
  void initState() {
    super.initState();
    selected = {...widget.initialSelected};
    load();
  }

  Future<void> load() async {
    setState(() {
      loading = true;
      failed = false;
    });
    try {
      final loaded = await widget.loadApps();
      if (mounted) {
        setState(() {
          apps = loaded;
          loading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          loading = false;
          failed = true;
        });
      }
    }
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shown = filterBlockerApps(apps, search.text, selected, onlySelected);
    final media = MediaQuery.of(context);
    final listHeight = ((media.size.height - media.viewInsets.bottom) * .34)
        .clamp(100.0, 320.0);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
        controller: search,
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(
            labelText: b('search'),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: search.text.isEmpty
                ? null
                : IconButton(
                    tooltip: b('clear'),
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(search.clear))),
      ),
      const SizedBox(height: 12),
      FilterChip(
          label: Text('${b('onlySelected')} · ${selected.length}'),
          selected: onlySelected,
          onSelected: (value) => setState(() => onlySelected = value)),
      const SizedBox(height: 8),
      if (loading)
        const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()))
      else if (failed) ...[
        Text(b('failed')),
        TextButton(onPressed: load, child: Text(b('retry'))),
      ] else
        SizedBox(
            height: listHeight,
            child: shown.isEmpty
                ? Center(child: Text(b('noMatches')))
                : ListView.builder(
                    primary: false,
                    itemCount: shown.length,
                    itemBuilder: (context, index) {
                      final app = shown[index];
                      return CheckboxListTile(
                          key: ValueKey(app.packageName),
                          contentPadding: EdgeInsets.zero,
                          secondary: BlockerAppIcon(app),
                          title: Text(app.appName),
                          value: selected.contains(app.packageName),
                          onChanged: (value) => setState(() {
                                value == true
                                    ? selected.add(app.packageName)
                                    : selected.remove(app.packageName);
                              }));
                    })),
      const SizedBox(height: 12),
      Text(b('safe'), style: const TextStyle(fontSize: 12, height: 1.5)),
      const SizedBox(height: 12),
      FilledButton(
          onPressed: loading || failed
              ? null
              : () => widget.onSave({...selected}, apps),
          child: Text('${tr('save', widget.locale)} · ${selected.length}')),
    ]);
  }
}
