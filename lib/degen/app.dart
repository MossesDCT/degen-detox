import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'luxury.dart';
import 'education.dart';
import 'permission_guide.dart';
import 'morning_shield.dart';
import 'strict_strings.dart';
import '../features/pro/app_blocker/data/app_blocker_service.dart';
import '../features/breathing/data/datasources/breathing_local_datasource.dart';
import '../features/breathing/domain/entities/breathing_technique.dart';
import '../features/pro/recipes/domain/entities/recipe.dart';
import '../l10n/generated/app_localizations.dart';
import 'domain.dart';
import 'reminders.dart';
import 'strings.dart';
import 'payments.dart';
import 'purchase_panel.dart';
import 'home_intro.dart';
import 'impulse_insights.dart';
import 'ritual_store.dart';
import 'recipe_panel.dart';
import 'wind_panel.dart';

const pine = Color(0xff0b1712),
    leaf = Color(0xffc4eb87),
    muted = Color(0xffa6b6ab);

class DegenApp extends StatefulWidget {
  const DegenApp({super.key});
  @override
  State<DegenApp> createState() => _DegenAppState();
}

class _DegenAppState extends State<DegenApp> {
  String locale = 'en';
  bool light = false;
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    if (kIsWeb) return;
    final p = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        locale = p.getString('degen_language') ?? 'en';
        light = p.getBool('degen_light') ?? false;
      });
    }
  }

  Future<void> update(String l, bool b) async {
    setState(() {
      locale = l;
      light = b;
    });
    if (!kIsWeb) {
      final p = await SharedPreferences.getInstance();
      await p.setString('degen_language', l);
      await p.setBool('degen_light', b);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bg = light ? const Color(0xfff3f5ed) : pine;
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xff72994d),
      brightness: light ? Brightness.light : Brightness.dark,
      primary: light ? const Color(0xff42682b) : leaf,
      surface: bg,
    );
    return MaterialApp(
      title: 'Degen Detox',
      debugShowCheckedModeBanner: false,
      locale: Locale(locale),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: bg,
        fontFamily: 'Manrope',
        textTheme: Typography.material2021().black.apply(
            bodyColor: light ? pine : const Color(0xfff3f6ee),
            displayColor: light ? pine : const Color(0xfff3f6ee),
            fontFamily: 'Manrope'),
        appBarTheme: AppBarTheme(
            backgroundColor: bg,
            foregroundColor: scheme.onSurface,
            elevation: 0),
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: bg, indicatorColor: leaf.withValues(alpha: .15)),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                minimumSize: const Size(0, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(minimumSize: const Size(0, 48))),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: scheme.onSurface.withValues(alpha: .04),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none)),
      ),
      home: DetoxShell(locale: locale, light: light, onSettings: update),
    );
  }
}

class DetoxShell extends StatefulWidget {
  const DetoxShell(
      {super.key,
      required this.locale,
      required this.light,
      required this.onSettings});
  final String locale;
  final bool light;
  final void Function(String, bool) onSettings;
  @override
  State<DetoxShell> createState() => _DetoxShellState();
}

class _DetoxShellState extends State<DetoxShell> with WidgetsBindingObserver {
  final scroll = ScrollController();
  int tab = 0, hours = 2, interval = 2;
  TimeOfDay wake = const TimeOfDay(hour: 8, minute: 0);
  AccessTier previewTier = AccessTier.free;
  List<Map<String, dynamic>> entries = [];
  List<InstalledApp> apps = [];
  Set<String> selected = {};
  Map<String, String> selectedNames = {};
  bool morningOpen = false;
  bool grassEnabled = false;
  final native = AppBlockerNativeService();
  final reminders = GrassReminders();
  final payments = PaymentService();
  final ritualStore = RitualStore();
  AccessPolicy get access => AccessPolicy(
      verified:
          qaBuild ? AccessTier.skr : payments.receipt?.tier ?? AccessTier.free,
      preview: previewTier);
  String t(String key) => tr(key, widget.locale);
  void selectTab(int index) {
    if (tab == index) return;
    setState(() => tab = index);
    if (scroll.hasClients) scroll.jumpTo(0);
  }

  Color get accent => Theme.of(context).colorScheme.primary;
  Color get subtle => widget.light ? const Color(0xff5c6b61) : muted;
  Color get panel => widget.light ? Colors.white : const Color(0xff122219);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    load();
  }

  Future<void> load() async {
    if (kIsWeb) return;
    final p = await SharedPreferences.getInstance();
    try {
      final data = jsonDecode(p.getString('degen_checkins') ?? '[]') as List;
      if (mounted) {
        setState(() {
          entries = data.map((e) => Map<String, dynamic>.from(e)).toList();
          hours = (p.getInt('degen_hours') ?? 2).clamp(1, 4);
          wake = TimeOfDay(
              hour: (p.getInt('degen_wake_h') ?? 8).clamp(0, 23),
              minute: (p.getInt('degen_wake_m') ?? 0).clamp(0, 59));
          selected = (p.getStringList('degen_apps') ?? []).toSet();
          try {
            selectedNames = Map<String, String>.from(
                jsonDecode(p.getString('degen_app_names') ?? '{}') as Map);
          } catch (_) {
            selectedNames = {};
          }
        });
      }
    } catch (_) {/* Invalid saved data never blocks the app. */}
    await payments.load();
    if (!mounted) return;
    setState(() {});
    if (access.grass) {
      await reminders.init(openGrassScene);
      final storedInterval = p.getInt('degen_grass_hours');
      if (storedInterval != null) {
        interval = storedInterval.clamp(1, 8);
        grassEnabled = true;
      }
      if (mounted) setState(() {});
    }
  }

  void openGrassScene() {
    if (!mounted || !access.grass) return;
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => GrassScene(locale: widget.locale)));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && access.grass && !kIsWeb) {
      reminders.checkLaunch(openGrassScene);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scroll.dispose();
    super.dispose();
  }

  Future<void> persist() async {
    if (kIsWeb) return;
    final p = await SharedPreferences.getInstance();
    await p.setString('degen_checkins', jsonEncode(entries));
    await p.setInt('degen_hours', hours);
    await p.setInt('degen_wake_h', wake.hour);
    await p.setInt('degen_wake_m', wake.minute);
    await p.setStringList('degen_apps', selected.toList());
    await p.setString(
        'degen_app_names',
        jsonEncode({
          for (final id in selected)
            if (selectedNames[id] != null) id: selectedNames[id],
        }));
  }

  Future<void> sheet(String title, Widget child) async {
    await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        backgroundColor: panel,
        builder: (c) => Padding(
            padding: EdgeInsets.fromLTRB(
                24, 0, 24, 24 + MediaQuery.of(c).viewInsets.bottom),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(c).size.height * .84,
                    maxWidth: 620),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(children: [
                        Expanded(
                            child: GoldText(title,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700))),
                        IconButton(
                            tooltip: t('close'),
                            onPressed: () => Navigator.pop(c),
                            icon: const Icon(Icons.close))
                      ]),
                      const SizedBox(height: 20),
                      child,
                    ])))));
  }

  Widget tag(String text, {bool bright = false}) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
          color: (bright ? leaf : accent).withValues(alpha: .10),
          borderRadius: BorderRadius.circular(7)),
      child: (text.contains('PRO') || text.contains('SKR'))
          ? GoldText(text,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1))
          : Text(text,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: bright ? leaf : accent)));
  Widget label(String text) => Text(text.toUpperCase(),
      style: TextStyle(
          color: subtle,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.6));
  Widget box(Widget child, {EdgeInsets padding = const EdgeInsets.all(24)}) =>
      LuxuryPanel(padding: padding, child: child);
  Widget rowTile(IconData icon, String title, String desc, VoidCallback action,
          {String? badge}) =>
      InkWell(
          onTap: action,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
              child: Row(children: [
                Icon(icon, size: 25, color: accent),
                const SizedBox(width: 18),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      if (badge == 'PRO' || badge == 'SKR')
                        GoldText(title,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700))
                      else
                        Text(title,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 5),
                      Text(desc,
                          style: TextStyle(
                              fontSize: 13.5, color: subtle, height: 1.5)),
                    ])),
                const SizedBox(width: 8),
                if (badge != null) tag(badge),
                const Icon(Icons.chevron_right, size: 20),
              ])));
  Widget title(String headline, String sub) => Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(headline,
            style: const TextStyle(
                fontSize: 32,
                height: 1.12,
                fontWeight: FontWeight.w700,
                letterSpacing: -1)),
        if (sub.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(sub, style: TextStyle(fontSize: 15, color: subtle, height: 1.6)),
        ],
      ]));
  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 850;
    final pages = [home(), rituals(), learn(), settings()];
    final destinations = [
      (Icons.wb_sunny_outlined, 'home'),
      (Icons.spa_outlined, 'rituals'),
      (Icons.menu_book_outlined, 'learn'),
      (Icons.tune, 'settings')
    ];
    return ForestBackdrop(
        scroll: scroll,
        light: widget.light,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Row(children: [
            if (wide)
              Container(
                  width: 236,
                  padding: const EdgeInsets.fromLTRB(24, 36, 20, 24),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              color: subtle.withValues(alpha: .12)))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        brand(),
                        const SizedBox(height: 52),
                        for (var i = 0; i < 4; i++)
                          Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  selected: tab == i,
                                  selectedTileColor:
                                      accent.withValues(alpha: .08),
                                  leading: Icon(destinations[i].$1,
                                      color: tab == i ? accent : subtle),
                                  title: Text(t(destinations[i].$2)),
                                  onTap: () => selectTab(i))),
                        const Spacer(),
                        label('SOLANA MOBILE'),
                        const SizedBox(height: 10),
                        Text('Degen Detox · v0.9',
                            style: TextStyle(color: subtle, fontSize: 12)),
                      ])),
            Expanded(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: wide ? 40 : 24, vertical: 18),
                  child: Row(children: [
                    Expanded(
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: wide
                                ? label(
                                    'DEGEN DETOX / ${t(destinations[tab].$2)}')
                                : brand())),
                    if (previewTier != AccessTier.free && wide)
                      Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: tag(t('previewMode'))),
                    IconButton(
                        tooltip: t('appearance'),
                        onPressed: () =>
                            widget.onSettings(widget.locale, !widget.light),
                        icon: Icon(
                            widget.light
                                ? Icons.dark_mode_outlined
                                : Icons.light_mode_outlined,
                            size: 20)),
                    IconButton(
                        tooltip: t('proTitle'),
                        onPressed: upgrade,
                        icon: Icon(Icons.account_balance_wallet_outlined,
                            size: 21, color: goldFor(context))),
                  ])),
              if (qaBuild)
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: tag(t('qaBanner'))),
              if (previewTier != AccessTier.free && !wide)
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: tag(t('previewMode'))),
              Expanded(
                  child: SingleChildScrollView(
                      key: ValueKey(tab),
                      controller: scroll,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(
                          wide ? 40 : 24, 8, wide ? 40 : 24, 32),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 760),
                              child: SoftEntrance(
                                  key: ValueKey(tab), child: pages[tab]))))),
            ])),
          ])),
          bottomNavigationBar: wide
              ? null
              : NavigationBar(
                  selectedIndex: tab,
                  onDestinationSelected: selectTab,
                  destinations: [
                      for (final d in destinations)
                        NavigationDestination(icon: Icon(d.$1), label: t(d.$2))
                    ]),
        ));
  }

  Widget brand() => Row(mainAxisSize: MainAxisSize.min, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Image.asset('assets/images/brand.png', width: 40, height: 40)),
        const SizedBox(width: 10),
        const Text('degen detox',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: -.7)),
      ]);
  Widget home() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HomeIntro(slogan: t('headline')),
      label(t('free')),
      HomeAction(icon: Icons.air, title: t('breathe'), onTap: breathing),
      HomeAction(
          icon: Icons.psychology_outlined, title: t('impulse'), onTap: impulse),
      HomeAction(
          icon: Icons.menu_book_outlined,
          title: t('learn'),
          onTap: () => selectTab(2)),
      const SizedBox(height: 24),
      box(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        label(t('checkins')),
        const SizedBox(height: 12),
        Text(
            entries.isEmpty
                ? t('empty')
                : '${UrgeInsights(entries).records.length}',
            style: TextStyle(
                fontSize: entries.isEmpty ? 14 : 32,
                color: entries.isEmpty ? subtle : null)),
        Text(insightText('window', widget.locale),
            style: TextStyle(fontSize: 12, color: subtle)),
        const SizedBox(height: 12),
        OutlinedButton.icon(
            onPressed: insights,
            icon: const Icon(Icons.insights),
            label: Text(insightText('title', widget.locale))),
      ])),
      const SizedBox(height: 32),
      const GoldText('PRO',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.6)),
      const SizedBox(height: 16),
      morningCard(),
      const SizedBox(height: 24),
      rowTile(
          Icons.restaurant_outlined, t('recipes'), t('recipesDesc'), recipes,
          badge: 'PRO'),
      rowTile(Icons.nights_stay_outlined, t('wind'), t('windDesc'), wind,
          badge: 'PRO'),
      const SizedBox(height: 32),
      grassCard(),
    ]);
  }

  Widget morningCard() => LuxuryPanel(
      pro: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.shield_outlined, color: goldFor(context), size: 24),
          const SizedBox(width: 10),
          Expanded(
              child: GoldText(t('morning'),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700))),
          tag('PRO')
        ]),
        const SizedBox(height: 28),
        FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '${wake.hour.toString().padLeft(2, '0')}:${wake.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                          fontSize: 46,
                          height: 1,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -2)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Icon(Icons.east, color: subtle, size: 22)),
                  Text(
                      '${((wake.hour + hours) % 24).toString().padLeft(2, '0')}:${wake.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                          fontSize: 30,
                          height: 1.15,
                          fontWeight: FontWeight.w300,
                          color: subtle)),
                ])),
        const SizedBox(height: 16),
        Text(t('morningDesc'), style: TextStyle(color: subtle)),
        const SizedBox(height: 24),
        SizedBox(
            width: double.infinity,
            child: FilledButton(
                onPressed: morning,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(t('configure'))),
                      const Icon(Icons.arrow_forward, size: 20)
                    ]))),
      ]));
  Widget grassCard() => ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
          height: 400,
          child: Stack(fit: StackFit.expand, children: [
            Image.asset('assets/images/grass.webp', fit: BoxFit.cover),
            const DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                  Color(0x5506150a),
                  Color(0x0506150a),
                  Color(0xdd06150a)
                ]))),
            Padding(
                padding: const EdgeInsets.all(26),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tag(t('skr'), bright: true),
                      const Spacer(),
                      const Text('Touch Grass',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1)),
                      const SizedBox(height: 10),
                      Text(t('grassDesc'),
                          style: const TextStyle(
                              color: Color(0xffe5ecdf),
                              height: 1.5,
                              fontSize: 15)),
                      const SizedBox(height: 18),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Color(0x66ffffff))),
                          onPressed: grass,
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Flexible(child: Text(t('preview'))),
                            const SizedBox(width: 12),
                            const Icon(Icons.north_east, size: 16)
                          ])),
                    ])),
          ])));
  Widget rituals() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title(t('rituals'), ''),
        label(t('free')),
        rowTile(Icons.air, t('breathe'), t('breatheDesc'), breathing,
            badge: t('free')),
        rowTile(
            Icons.psychology_outlined, t('impulse'), t('impulseDesc'), impulse,
            badge: t('free')),
        rowTile(Icons.menu_book_outlined, t('learn'), t('learnIntro'),
            () => selectTab(2),
            badge: t('free')),
        const SizedBox(height: 24),
        const GoldText('PRO',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.6)),
        rowTile(Icons.shield_outlined, t('morning'), t('morningDesc'), morning,
            badge: 'PRO'),
        rowTile(
            Icons.restaurant_outlined, t('recipes'), t('recipesDesc'), recipes,
            badge: 'PRO'),
        rowTile(Icons.nights_stay_outlined, t('wind'), t('windDesc'), wind,
            badge: 'PRO'),
        const SizedBox(height: 24),
        GoldText(t('skr'),
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.6)),
        rowTile(Icons.grass, 'Touch Grass', t('grassDesc'), grass,
            badge: 'SKR'),
      ]);
  Widget learn() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title(t('learn'), t('learnIntro')),
        Text(eduText('disclaimer', widget.locale),
            style: TextStyle(color: subtle, height: 1.6)),
        const SizedBox(height: 24),
        for (final article in educationArticles)
          Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                  onTap: () => sheet(article.title(widget.locale),
                      ArticleBody(article: article, locale: widget.locale)),
                  borderRadius: BorderRadius.circular(24),
                  child: box(Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Icon(article.icon, color: accent),
                          const SizedBox(width: 12),
                          Expanded(
                              child: Text(article.title(widget.locale),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)))
                        ]),
                        const SizedBox(height: 16),
                        Text(article.intro(widget.locale),
                            style: TextStyle(
                                color: subtle, fontSize: 15, height: 1.8)),
                        const SizedBox(height: 12),
                        TextButton.icon(
                            onPressed: () => sheet(
                                article.title(widget.locale),
                                ArticleBody(
                                    article: article, locale: widget.locale)),
                            icon: const Icon(Icons.arrow_forward, size: 16),
                            label: Text(eduText('read', widget.locale))),
                      ])))),
      ]);
  Widget settings() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        title(t('settings'), 'Degen Detox'),
        if (ownerTestTools && !kIsWeb) ...[
          OutlinedButton(
              onPressed: resetOwnerPro,
              child: Text(strictText('testReset', widget.locale))),
          const SizedBox(height: 20),
        ],
        box(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t('language'),
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
              initialValue: widget.locale,
              isExpanded: true,
              items: [
                for (var i = 0; i < languages.length; i++)
                  DropdownMenuItem(
                      value: languages[i], child: Text(languageNames[i]))
              ],
              onChanged: (v) {
                if (v != null) widget.onSettings(v, widget.light);
              }),
          const SizedBox(height: 16),
          SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(t('appearance')),
              value: widget.light,
              onChanged: (v) => widget.onSettings(widget.locale, v)),
        ])),
        const SizedBox(height: 24),
        if (!kIsWeb) ...[
          rowTile(Icons.verified_user_outlined, t('permissions'),
              guideText('purposeShort', widget.locale), permissions),
          const SizedBox(height: 16),
        ],
        box(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t('privacy'),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Text(t(kIsWeb ? 'privacyBody' : 'privacyNative'),
              style: TextStyle(color: subtle, height: 1.7)),
          const SizedBox(height: 16),
          Text(guideText('privacy', widget.locale),
              style: TextStyle(color: subtle, height: 1.7)),
          const SizedBox(height: 16),
          Text(guideText('philosophy', widget.locale),
              style: const TextStyle(height: 1.7)),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: deleteEntries, child: Text(t('delete'))),
        ])),
        const SizedBox(height: 24),
        if (previewTier != AccessTier.free)
          OutlinedButton(
              onPressed: () => setState(() => previewTier = AccessTier.free),
              child: Text(t('endPreview'))),
        const SizedBox(height: 16),
        Text('v0.9 · ${qaBuild ? t('qaBanner') : 'Degen Detox'}',
            style: TextStyle(color: subtle)),
        const SizedBox(height: 16),
        OutlinedButton(onPressed: upgrade, child: Text(t('restore'))),
      ]);
  Future<void> deleteEntries() async {
    final ok = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
                title: Text(t('delete')),
                content: Text(t('deleteAsk')),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(c, false),
                      child: Text(t('cancel'))),
                  TextButton(
                      onPressed: () => Navigator.pop(c, true),
                      child: Text(t('delete')))
                ]));
    if (ok == true) {
      setState(() => entries = []);
      await persist();
    }
  }

  Future<void> upgrade() async {
    await sheet(
        t('proTitle'),
        PurchasePanel(
            service: payments,
            locale: widget.locale,
            onChanged: () {
              if (mounted) setState(() {});
            },
            onPreview: (tier) {
              Navigator.pop(context);
              setState(() => previewTier = tier);
            }));
  }

  Future<void> morning() async {
    if (morningOpen) return;
    morningOpen = true;
    try {
      if (!access.showPro) {
        await upgrade();
        return;
      }
      // Open immediately. Never enumerate installed packages before showing UI.
      await sheet(
          t('morning'),
          MorningShieldPanel(
            locale: widget.locale,
            native: native,
            preview: kIsWeb || !access.pro,
            initialWake: wake,
            initialHours: hours,
            initialSelected: selected,
            initialNames: selectedNames,
            initialApps: apps,
            loadApps: installedCandidates,
            showSheet: sheet,
            permissions: permissions,
            onSaved: (newWake, newHours, newSelected, newNames, newApps) async {
              if (!mounted) return;
              setState(() {
                wake = newWake;
                hours = newHours;
                selected = {...newSelected};
                selectedNames = {...newNames};
                apps = [...newApps];
              });
              await persist();
            },
          ));
    } finally {
      morningOpen = false;
    }
  }

  Future<void> permissions() => sheet(
      t('permissions'), PermissionGuide(locale: widget.locale, native: native));

  Future<List<InstalledApp>> installedCandidates() async {
    if (!kIsWeb) {
      return native.getInstalledApps();
    } else {
      // Explicit preview candidates, not a claim to have scanned a browser.
      return const [
        InstalledApp(packageName: 'com.binance.dev', appName: 'Binance'),
        InstalledApp(
            packageName: 'com.tradingview.tradingviewapp',
            appName: 'TradingView'),
        InstalledApp(packageName: 'com.twitter.android', appName: 'X'),
        InstalledApp(
            packageName: 'org.telegram.messenger', appName: 'Telegram'),
        InstalledApp(packageName: 'com.discord', appName: 'Discord')
      ];
    }
  }

  Future<void> resetOwnerPro() async {
    if (!ownerTestTools || payments.busy) return;
    final yes = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
              title: Text(strictText('testReset', widget.locale)),
              content: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(strictText('resetBody', widget.locale)),
                    if (payments.receipt != null) ...[
                      const SizedBox(height: 16),
                      SelectableText(payments.receipt!.wallet),
                      const SizedBox(height: 8),
                      SelectableText(payments.receipt!.signature,
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ])),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(c, false),
                    child: Text(t('cancel'))),
                FilledButton(
                    onPressed: () => Navigator.pop(c, true),
                    child: Text(strictText('testReset', widget.locale))),
              ],
            ));
    if (yes != true || !mounted) return;
    var message = strictText('resetDone', widget.locale);
    try {
      await payments.resetLocalProForOwnerTest();
      if (mounted) setState(() => previewTier = AccessTier.free);
      // Clear only optional grass reminders, never the active blocker schedule.
      await reminders.cancel();
      if (mounted) setState(() => grassEnabled = false);
    } on PaymentFailure {
      message = strictText('resetDenied', widget.locale);
    } catch (_) {
      message = t('networkError');
    }
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  Future<void> insights() => sheet(insightText('title', widget.locale),
      ImpulseInsightsPanel(entries: entries, locale: widget.locale));

  Future<void> impulse() async {
    var urge = 5.0;
    final note = TextEditingController();
    bool saved = false;
    await sheet(
        t('impulse'),
        StatefulBuilder(
            builder: (c, refresh) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(insightText('purpose', widget.locale)),
                  const SizedBox(height: 20),
                  Text(t('urge'),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 24),
                  Center(
                      child: Text('${urge.round()}/10',
                          style: TextStyle(
                              fontSize: 46,
                              fontWeight: FontWeight.w300,
                              color: accent))),
                  Slider(
                      value: urge,
                      min: 1,
                      max: 10,
                      divisions: 9,
                      label: '${urge.round()}',
                      onChanged: saved ? null : (v) => refresh(() => urge = v)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(t('low')), Text(t('high'))]),
                  const SizedBox(height: 24),
                  TextField(
                      controller: note,
                      maxLines: 3,
                      maxLength: 500,
                      enabled: !saved,
                      decoration: InputDecoration(labelText: t('note'))),
                  const SizedBox(height: 16),
                  FilledButton(
                      onPressed: saved
                          ? null
                          : () async {
                              final now = DateTime.now();
                              setState(() => entries.add({
                                    'date': now.toIso8601String(),
                                    'hourLocal': now.hour,
                                    'utcOffsetMinutes':
                                        now.timeZoneOffset.inMinutes,
                                    'urge': urge.round(),
                                    'note': note.text.trim()
                                  }));
                              await persist();
                              refresh(() => saved = true);
                            },
                      child: Text(t('save'))),
                  if (saved)
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(t('logged'),
                            style: TextStyle(color: accent, height: 1.6))),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(c);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) insights();
                        });
                      },
                      icon: const Icon(Icons.insights),
                      label: Text(insightText('title', widget.locale))),
                ])));
    // Sheet closing animation may still hold the controller for a frame.
  }

  Future<void> breathing() async {
    final techniques =
        BreathingLocalDatasource().getTechniques(AppLocalizations.of(context));
    await sheet(
        t('breathe'),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          for (final tech in techniques)
            rowTile(Icons.air, tech.name, tech.sessionDurationFormatted, () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          BreathSession(tech: tech, locale: widget.locale)));
            }),
          const SizedBox(height: 16),
          Text(t('safety'), style: TextStyle(color: subtle, height: 1.7)),
        ]));
  }

  Future<void> recipes() async {
    if (!access.showPro) {
      await upgrade();
      return;
    }
    final items = safeRecipes(widget.locale);
    await sheet(
        t('recipes'),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t('foodNote'),
              style: TextStyle(color: subtle, height: 1.7, fontSize: 13)),
          const SizedBox(height: 20),
          for (var i = 0; i < items.length; i++)
            ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text('${i + 1}'.padLeft(2, '0'),
                    style: TextStyle(color: accent, fontSize: 14)),
                title: Text(items[i].name),
                subtitle: Text(
                    '${items[i].totalTimeLabel} · ${items[i].servings} ${t('servings')}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => recipe(items[i])),
        ]));
  }

  Future<void> recipe(Recipe r) => sheet(r.name,
      RecipePanel(recipe: r, locale: widget.locale, store: ritualStore));
  Future<void> grass() async {
    if (!access.showGrass) {
      await upgrade();
      return;
    }
    await sheet(
        'Touch Grass',
        StatefulBuilder(
            builder: (c, refresh) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(t('grassBody'),
                      style: TextStyle(color: subtle, height: 1.7)),
                  const SizedBox(height: 24),
                  label(t('interval')),
                  const SizedBox(height: 12),
                  Wrap(spacing: 10, runSpacing: 8, children: [
                    for (var i = 1; i <= 8; i++)
                      ChoiceChip(
                          label: Text('$i ${t(i == 1 ? 'hour' : 'hours')}'),
                          selected: interval == i,
                          onSelected: (_) {
                            setState(() => interval = i);
                            refresh(() {});
                          })
                  ]),
                  const SizedBox(height: 24),
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        GrassScene(locale: widget.locale)));
                          },
                          label: Text(t('preview')))),
                  const SizedBox(height: 16),
                  OutlinedButton(
                      onPressed: access.grass && !kIsWeb
                          ? () async {
                              await reminders.init(() {
                                if (mounted) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => GrassScene(
                                              locale: widget.locale)));
                                }
                              });
                              if (grassEnabled) {
                                await reminders.cancel();
                                refresh(() => grassEnabled = false);
                              } else {
                                final enabled = await reminders.schedule(
                                    interval,
                                    'Touch Grass',
                                    t('grassDesc'),
                                    access);
                                refresh(() => grassEnabled = enabled);
                              }
                            }
                          : null,
                      child: Text(t(grassEnabled ? 'disable' : 'enable'))),
                  if (access.grass && !kIsWeb)
                    TextButton(
                        onPressed: reminders.test,
                        child: Text(t('testReminder'))),
                  if (grassEnabled)
                    Text(t('remindersOn'), style: TextStyle(color: accent)),
                  const SizedBox(height: 16),
                  Text(t('reminderNote'),
                      style:
                          TextStyle(color: subtle, fontSize: 12, height: 1.7)),
                  const SizedBox(height: 12),
                  if (!access.grass)
                    Text(t('demoNote'),
                        style: TextStyle(
                            color: subtle, fontSize: 12, height: 1.7)),
                ])));
  }

  Future<void> wind() async {
    if (!access.showPro) {
      await upgrade();
      return;
    }
    await sheet(
        t('wind'), WindPanel(locale: widget.locale, store: ritualStore));
  }
}

class BrandPainter extends CustomPainter {
  BrandPainter(this.color);
  final Color color;
  @override
  void paint(Canvas canvas, Size s) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(s.width * .14, s.height * .8)
      ..lineTo(s.width * .14, s.height * .2)
      ..cubicTo(s.width * 1.1, s.height * .14, s.width * 1.1, s.height * .86,
          s.width * .14, s.height * .8);
    canvas.drawPath(path, p);
    canvas.drawLine(Offset(s.width * .42, s.height * .68),
        Offset(s.width * .67, s.height * .4), p);
  }

  @override
  bool shouldRepaint(BrandPainter old) => old.color != color;
}

class BreathSession extends StatefulWidget {
  const BreathSession({super.key, required this.tech, required this.locale});
  final BreathingTechnique tech;
  final String locale;
  @override
  State<BreathSession> createState() => _BreathSessionState();
}

class _BreathSessionState extends State<BreathSession>
    with WidgetsBindingObserver {
  Timer? timer;
  int elapsed = 0;
  bool running = false, finished = false;
  String t(String k) => tr(k, widget.locale);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void toggle() {
    if (running) {
      timer?.cancel();
      setState(() => running = false);
      return;
    }
    setState(() => running = true);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (elapsed + 1 >= widget.tech.sessionDurationSeconds) {
        timer?.cancel();
        setState(() {
          elapsed++;
          running = false;
          finished = true;
        });
      } else {
        setState(() => elapsed++);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed && running) {
      timer?.cancel();
      setState(() => running = false);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tick = elapsed % widget.tech.cycleDurationSeconds;
    var phase = widget.tech.phases.first;
    for (final p in widget.tech.phases) {
      if (tick < p.durationSeconds) {
        phase = p;
        break;
      }
      tick -= p.durationSeconds;
    }
    final fraction = tick / phase.durationSeconds;
    final expand = phase.type == BreathingPhaseType.inhale
        ? fraction
        : phase.type == BreathingPhaseType.exhale
            ? 1 - fraction
            : 1.0;
    final diameter = 170 + expand * 55;
    final reduced = MediaQuery.of(context).disableAnimations;
    return Scaffold(
        appBar: AppBar(title: Text(widget.tech.name)),
        body: SafeArea(
            child: Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 540),
                    child: Padding(
                        padding: const EdgeInsets.all(28),
                        child: Column(children: [
                          const Spacer(),
                          Text(
                              finished
                                  ? t('complete')
                                  : !running && elapsed == 0
                                      ? t('ready')
                                      : phase.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 32),
                          SizedBox(
                              height: 250,
                              child: Center(
                                  child: AnimatedContainer(
                                      duration: Duration(
                                          milliseconds: reduced ? 0 : 950),
                                      width: diameter,
                                      height: diameter,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: .06),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withValues(alpha: .5),
                                              width: 1)),
                                      child: Center(
                                          child: Text(finished ? '✓' : '${phase.durationSeconds - tick}',
                                              style: TextStyle(
                                                  fontSize: 52,
                                                  fontWeight: FontWeight.w300,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)))))),
                          const SizedBox(height: 16),
                          Text(
                              '${elapsed ~/ 60}:${(elapsed % 60).toString().padLeft(2, '0')} / ${widget.tech.sessionDurationFormatted}'),
                          const SizedBox(height: 24),
                          Text(t('safety'),
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontSize: 13, height: 1.6)),
                          const Spacer(),
                          SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                  onPressed: finished
                                      ? () => Navigator.pop(context)
                                      : toggle,
                                  child: Text(t(finished
                                      ? 'close'
                                      : running
                                          ? 'pause'
                                          : elapsed == 0
                                              ? 'start'
                                              : 'resume')))),
                          const SizedBox(height: 12),
                        ]))))));
  }
}

class GrassScene extends StatefulWidget {
  const GrassScene({super.key, required this.locale});
  final String locale;
  @override
  State<GrassScene> createState() => _GrassSceneState();
}

class _GrassSceneState extends State<GrassScene>
    with SingleTickerProviderStateMixin {
  late AnimationController motion;
  @override
  void initState() {
    super.initState();
    motion =
        AnimationController(vsync: this, duration: const Duration(seconds: 12))
          ..repeat(reverse: true);
    SystemSound.play(SystemSoundType.alert);
  }

  @override
  void dispose() {
    motion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduced = MediaQuery.of(context).disableAnimations;
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      AnimatedBuilder(
          animation: motion,
          builder: (_, child) => Transform.scale(
              scale: reduced ? 1 : 1.02 + motion.value * .06, child: child),
          child: Image.asset('assets/images/grass.webp', fit: BoxFit.cover)),
      const DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
            Color(0x55031408),
            Color(0x11031408),
            Color(0xdd031408)
          ]))),
      SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const Text('DEGEN DETOX',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2,
                              fontSize: 12)),
                      const Spacer(),
                      IconButton(
                          tooltip: tr('close', widget.locale),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.white))
                    ]),
                    const Spacer(),
                    Text('Touch grass.\n${tr('ready', widget.locale)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            height: 1.15,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 520),
                        child: Text(tr('grassBody', widget.locale),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                height: 1.7))),
                    const SizedBox(height: 32),
                    FilledButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(tr('close', widget.locale))),
                    const SizedBox(height: 24),
                  ]))),
    ]));
  }
}
