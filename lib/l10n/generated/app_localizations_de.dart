// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Cortisol Zero';

  @override
  String get appTagline => 'Ihr täglicher Begleiter zur Stressreduktion';

  @override
  String get navHome => 'Start';

  @override
  String get navLearn => 'Wissen';

  @override
  String get navBreathe => 'Atmen';

  @override
  String get navSounds => 'Klänge';

  @override
  String get navMore => 'Mehr';

  @override
  String get greetingMorning => 'Guten Morgen';

  @override
  String get greetingAfternoon => 'Guten Tag';

  @override
  String get greetingEvening => 'Guten Abend';

  @override
  String get greetingNight => 'Gute Nacht';

  @override
  String get dayStreak => 'Tage in Folge';

  @override
  String get dailyTip => 'Tipp des Tages';

  @override
  String get quickAccess => 'Schnellzugriff';

  @override
  String get moodCheckin => 'Stimmungs-Check';

  @override
  String get howAreYouFeeling => 'Wie fühlen Sie sich?';

  @override
  String get explore => 'Entdecken';

  @override
  String get learnTitle => 'Wissen';

  @override
  String get learnSubtitle => 'Cortisol verstehen und regulieren';

  @override
  String get searchTopics => 'Themen suchen...';

  @override
  String get seeAll => 'Alle anzeigen';

  @override
  String minuteRead(int count) {
    return '$count Min. Lesezeit';
  }

  @override
  String get noResultsFound => 'Keine Ergebnisse gefunden';

  @override
  String get nutritionGuide => 'Ernährungsratgeber';

  @override
  String get antiStressFoods => 'Anti-Stress-Lebensmittel';

  @override
  String get tapToLearnScience =>
      'Tippen Sie auf ein Lebensmittel, um die Wissenschaft hinter seiner cortisolsenkenden Wirkung zu erfahren';

  @override
  String get servingIdea => 'Serviervorschlag';

  @override
  String get breatheTitle => 'Atmen';

  @override
  String get breatheSubtitle =>
      'Atemübungen senken Cortisol in wenigen Minuten';

  @override
  String get scienceBackedTechniques => 'Wissenschaftlich fundierte Techniken';

  @override
  String get vagusNerveInfo =>
      'Jede Technik aktiviert Ihren Vagusnerv und senkt Cortisol innerhalb von Minuten';

  @override
  String get beginner => 'Anfänger';

  @override
  String get intermediate => 'Fortgeschritten';

  @override
  String get advanced => 'Experte';

  @override
  String get phaseInhale => 'Einatmen';

  @override
  String get phaseHold => 'Halten';

  @override
  String get phaseExhale => 'Ausatmen';

  @override
  String get sessionComplete => 'Sitzung abgeschlossen!';

  @override
  String get sessionCompleteMessage =>
      'Ihr Cortisolspiegel sinkt. Nehmen Sie sich einen Moment, um in sich hineinzuspüren.';

  @override
  String get cyclesCompleted => 'Zyklen';

  @override
  String get duration => 'Dauer';

  @override
  String get done => 'Fertig';

  @override
  String get endSession => 'Sitzung beenden';

  @override
  String cycleOf(int current, int total) {
    return 'Zyklus $current von $total';
  }

  @override
  String get soundsTitle => 'Klänge';

  @override
  String get soundsSubtitle => 'Naturklänge zur Beruhigung Ihres Nervensystems';

  @override
  String nowPlaying(String name) {
    return 'Jetzt läuft: $name';
  }

  @override
  String get tapToPlay => 'Zum Abspielen tippen';

  @override
  String get paused => 'Pausiert';

  @override
  String get sleepTimer => 'Schlaf-Timer';

  @override
  String get audioWillStop => 'Audio stoppt automatisch';

  @override
  String get cancelTimer => 'Timer abbrechen';

  @override
  String sleepTimerSet(int minutes) {
    return 'Schlaf-Timer: $minutes Min.';
  }

  @override
  String get journalTitle => 'Stimmungstagebuch';

  @override
  String get addEntry => 'Eintrag hinzufügen';

  @override
  String get saveEntry => 'Eintrag speichern';

  @override
  String get noEntriesThisMonth => 'Keine Einträge diesen Monat';

  @override
  String get tapPlusToAdd =>
      'Tippen Sie auf +, um Ihren ersten Stimmungseintrag hinzuzufügen';

  @override
  String weeklyAverage(String mood) {
    return 'Wochendurchschnitt: $mood';
  }

  @override
  String get addNoteOptional =>
      'Notiz hinzufügen, wie Sie sich fühlen... (optional)';

  @override
  String get moodTerrible => 'Schrecklich';

  @override
  String get moodBad => 'Schlecht';

  @override
  String get moodOkay => 'Okay';

  @override
  String get moodGood => 'Gut';

  @override
  String get moodGreat => 'Großartig';

  @override
  String get sleepTrackerTitle => 'Schlaf-Tracker';

  @override
  String get logSleep => 'Schlaf erfassen';

  @override
  String get sleepQuality => 'Schlafqualität';

  @override
  String get bedtimeReminder => 'Schlafenszeit-Erinnerung';

  @override
  String get avgQuality => 'Ø Qualität';

  @override
  String get avgDuration => 'Ø Dauer';

  @override
  String get tracked => 'Erfasst';

  @override
  String get bedtime => 'Schlafenszeit';

  @override
  String get wakeTime => 'Aufwachzeit';

  @override
  String get last7Days => 'Letzte 7 Tage';

  @override
  String get recentEntries => 'Aktuelle Einträge';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get themeLabel => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get language => 'Sprache';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get enableNotifications => 'Benachrichtigungen aktivieren';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get rateApp => 'App bewerten';

  @override
  String get version => 'Version';

  @override
  String get about => 'Über';

  @override
  String get proTitle => 'PRO';

  @override
  String get proActive => 'PRO — Aktiv ✓';

  @override
  String get upgradeToProCTA => 'Auf PRO upgraden';

  @override
  String get upgradeSubtitle =>
      'Das vollständige Stressreduktions-Toolkit freischalten';

  @override
  String get proPrice => '6,50 USD einmalig';

  @override
  String get oneTimePayment => 'Einmalzahlung • Lebenslanger Zugang';

  @override
  String get noSubscription => 'Kein Abo, keine wiederkehrenden Kosten';

  @override
  String unlockPro(String price) {
    return 'PRO freischalten — $price';
  }

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get proThankYou => 'Vielen Dank für Ihre Unterstützung!';

  @override
  String get youHavePro => 'Sie haben PRO!';

  @override
  String get proFeaturesUnlocked => 'Alle PRO-Funktionen sind freigeschaltet.';

  @override
  String get awesome => 'Fantastisch!';

  @override
  String get checkingPurchases => 'Käufe werden überprüft...';

  @override
  String get recipeBook => 'Rezeptbuch';

  @override
  String get recipes22 => '22 cortisolsenkende Rezepte';

  @override
  String get searchRecipes => 'Rezepte suchen...';

  @override
  String get ingredients => 'Zutaten';

  @override
  String get instructions => 'Zubereitung';

  @override
  String get whyItWorks => 'Warum es wirkt';

  @override
  String servings(int count) {
    return '$count Portionen';
  }

  @override
  String prepTime(String time) {
    return 'Vorbereitung: $time';
  }

  @override
  String totalTime(String time) {
    return 'Gesamt: $time';
  }

  @override
  String get meditationLibrary => 'Meditationsbibliothek';

  @override
  String get guidedMeditations => 'Geführte Meditationen gegen Stress';

  @override
  String get appBlocker => 'App-Blocker';

  @override
  String get morningFocusMode => 'Morgendlicher Fokusmodus';

  @override
  String get enableAppBlocker => 'App-Blocker aktivieren';

  @override
  String get blockDuration => 'Sperrdauer';

  @override
  String get grantPermission => 'Berechtigung erteilen';

  @override
  String get unlockWithBreathing =>
      'Schließen Sie eine 5-minütige Atemübung ab, um zu entsperren';

  @override
  String get moodInsights => 'KI-Stimmungsanalyse';

  @override
  String get weeklyPatternAnalysis => 'Wöchentliche Stimmungsmusteranalyse';

  @override
  String get stressLevel => 'Stresslevel';

  @override
  String get avgMood => 'Ø Stimmung';

  @override
  String get trend => 'Trend';

  @override
  String get weeklyMoodTrend => 'Wöchentlicher Stimmungsverlauf';

  @override
  String get aiDetectedPatterns => 'KI-erkannte Muster';

  @override
  String get weeklyPersonalizedTip => 'Personalisierter Wochentipp';

  @override
  String get onboarding1Title => 'Willkommen bei\nCortisol Zero';

  @override
  String get onboarding1Subtitle =>
      'Ihr täglicher Begleiter für Stressmanagement und ein ruhigeres, gesünderes Leben.';

  @override
  String get onboarding2Title => 'Verstehen Sie\nIhren Stress';

  @override
  String get onboarding2Subtitle =>
      'Cortisol ist Ihr Stresshormon. Chronisch erhöhte Werte beeinträchtigen Ihre Gesundheit, Stimmung und Ihren Schlaf.';

  @override
  String get onboarding3Title => 'Ihre Reise\nbeginnt jetzt';

  @override
  String get onboarding3Subtitle =>
      'Schon 5 Minuten täglich mit Cortisol Zero können Ihren Stresslevel innerhalb von Wochen messbar senken.';

  @override
  String get continueButton => 'Weiter';

  @override
  String get getStarted => 'Jetzt starten';

  @override
  String get skip => 'Überspringen';

  @override
  String get moreTitle => 'Mehr';

  @override
  String get toolsSection => 'Tools';

  @override
  String get proFeaturesSection => 'PRO-Funktionen';

  @override
  String get unlockCortisolZeroPro => 'Cortisol Zero PRO freischalten';

  @override
  String get unlock => 'Freischalten';

  @override
  String get save => 'Speichern';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get close => 'Schließen';

  @override
  String get change => 'Ändern';

  @override
  String get scienceBacked => 'Wissenschaftlich fundierter Cortisol-Reduzierer';

  @override
  String get free => 'KOSTENLOS';

  @override
  String get whatYouGet => 'Das erhalten Sie';

  @override
  String scheduledAt(String time) {
    return 'Geplant: $time';
  }

  @override
  String get dailyTipBadge => 'Tipp des Tages';

  @override
  String get journalLabel => 'Tagebuch';

  @override
  String get featureNutrition => 'Ernährung';

  @override
  String get featureNutritionSub => '20 Anti-Stress-Lebensmittel';

  @override
  String get featureSleep => 'Schlaf';

  @override
  String get featureSleepSub => 'Tracken & verbessern';

  @override
  String get nutritionBannerTitle => 'Anti-Stress-Ernährungsratgeber';

  @override
  String get nutritionBannerSub => '20+ cortisolsenkende Lebensmittel';

  @override
  String minRead(int count) {
    return '$count Min. Lesezeit';
  }

  @override
  String get filterAll => 'Alle';

  @override
  String get filterBasics => 'Grundlagen';

  @override
  String get filterScience => 'Wissenschaft';

  @override
  String get filterImpact => 'Auswirkungen';

  @override
  String get filterReduce => 'Reduzieren';

  @override
  String get filterLifestyle => 'Lebensstil';

  @override
  String get filterNutrition => 'Ernährung';

  @override
  String get filterSleep => 'Schlaf';

  @override
  String get filterMind => 'Geist';

  @override
  String get catBasics => 'Die Grundlagen';

  @override
  String get catScience => 'Die Wissenschaft';

  @override
  String get catImpact => 'Gesundheitliche Auswirkungen';

  @override
  String get catReduction => 'Reduktionstipps';

  @override
  String get catLifestyle => 'Lebensstil';

  @override
  String get catNutrition => 'Ernährung';

  @override
  String get catSleep => 'Schlaf';

  @override
  String get catExercise => 'Bewegung';

  @override
  String get catMindfulness => 'Achtsamkeit';

  @override
  String get dailyTip0 =>
      'Atmen Sie jetzt 5 Mal tief durch. Jedes lange Ausatmen aktiviert Ihren Vagusnerv und senkt Cortisol innerhalb von 60 Sekunden.';

  @override
  String get dailyTip1 =>
      'Trinken Sie ein Glas kaltes Wasser. Leichte Dehydration erhöht Cortisol um bis zu 33 %. Hydration ist aktives Stressmanagement.';

  @override
  String get dailyTip2 =>
      'Gehen Sie 10 Minuten nach draußen. Tageslicht und Grünflächen senken Cortisol messbar — selbst ein kurzer Spaziergang hilft.';

  @override
  String get dailyTip3 =>
      'Legen Sie Ihr Handy für 30 Minuten weg. Jede Benachrichtigung löst einen Cortisol-Mikropeak aus. Gönnen Sie Ihrem Nervensystem eine Pause.';

  @override
  String get dailyTip4 =>
      'Essen Sie eine Handvoll Mandeln oder dunkle Schokolade. Magnesium und Flavanole hemmen direkt die HPA-Achse.';

  @override
  String get dailyTip5 =>
      'Schreiben Sie 3 Dinge auf, für die Sie dankbar sind. Schon 5 Minuten Dankbarkeitstagebuch senken Cortisol um 23 %.';

  @override
  String get dailyTip6 =>
      'Hören Sie ruhige Musik. Musik mit 432-Hz-Resonanz senkt nachweislich Cortisol und verlangsamt die Herzfrequenz.';

  @override
  String get dailyTip7 =>
      'Verbringen Sie Zeit mit jemandem, der Ihnen wichtig ist. Oxytocin aus positivem sozialen Kontakt hemmt Cortisol direkt.';

  @override
  String get dailyTip8 =>
      'Probieren Sie die 4-7-8-Atmung vor der nächsten stressigen Aufgabe: 4 Zählzeiten einatmen, 7 halten, 8 ausatmen. Ein natürliches Beruhigungsmittel.';

  @override
  String get dailyTip9 =>
      'Frühstücken Sie innerhalb von 90 Minuten nach dem Aufwachen. Das Auslassen des Frühstücks provoziert Cortisol-Spitzen zur Blutzuckerregulation.';

  @override
  String get dailyTip10 =>
      'Schalten Sie Bildschirme 1 Stunde vor dem Schlafengehen ab. Blaues Licht unterdrückt Melatonin und hält den Cortisolspiegel nachts erhöht.';

  @override
  String get dailyTip11 =>
      'Bewegen Sie sich 20 Minuten lang. Moderate Bewegung erzeugt eine \"Cortisol-Dividende\" — der Spiegel fällt stundenlang unter den Ausgangswert.';

  @override
  String get dailyTip12 =>
      'Bereiten Sie eine Tasse Kamille- oder Grüntee zu. L-Theanin im Grüntee fördert ruhige Wachheit; das Apigenin in Kamille bindet GABA-Rezeptoren.';

  @override
  String get dailyTip13 =>
      'Praktizieren Sie progressive Muskelentspannung. Spannen Sie jede Muskelgruppe an und entspannen Sie sie wieder. Das aktiviert direkt das parasympathische Nervensystem.';

  @override
  String get eduTitle000 => 'Was ist Cortisol?';

  @override
  String get eduTitle001 => 'Der Cortisol-Rhythmus';

  @override
  String get eduTitle002 => 'Die HPA-Achse erklärt';

  @override
  String get eduTitle003 => 'Cortisol vs. Adrenalin';

  @override
  String get eduTitle004 =>
      'Wie hoher Cortisolspiegel Ihren Körper beeinflusst';

  @override
  String get eduTitle005 => 'Cortisol und Ihre Stimmung';

  @override
  String get eduTitle006 => 'Tiefes Atmen: Die schnellste Lösung';

  @override
  String get eduTitle007 => 'Die Kraft der Natur';

  @override
  String get eduTitle008 => 'Bewegung: Der Zeitpunkt ist entscheidend';

  @override
  String get eduTitle009 => 'Soziale Verbindung senkt Cortisol';

  @override
  String get eduTitle010 => 'Schlaf und Cortisol: Der Teufelskreis';

  @override
  String get eduTitle011 => 'Yoga und die Stressreaktion';

  @override
  String get eduTitle012 => 'Achtsamkeitsmeditation: Bewiesene Ergebnisse';

  @override
  String get eduTitle013 => 'Lebensmittel, die Cortisol erhöhen';

  @override
  String get eduTitle014 => 'Die Verbindung zwischen Darm, Gehirn und Cortisol';

  @override
  String get eduTitle015 => 'Magnesium: Das Anti-Stress-Mineral';

  @override
  String get eduTitle016 => 'Tagebuch schreiben als Cortisol-Medizin';

  @override
  String get eduContent000 =>
      'Cortisol ist das wichtigste Stresshormon Ihres Körpers. Es wird von den Nebennieren produziert, die sich oberhalb Ihrer Nieren befinden. Oft als \"Stresshormon\" bezeichnet, spielt es eine entscheidende Rolle bei der Kampf-oder-Flucht-Reaktion Ihres Körpers.\n\nWenn Sie einer stressigen Situation begegnen, löst der Hypothalamus im Gehirn eine Signalkaskade aus, die zur Cortisolausschüttung führt. Dies bereitet Ihren Körper darauf vor, zu kämpfen oder zu fliehen — es erhöht Herzfrequenz, Blutdruck und Blutzucker.\n\nIn gesunden Mengen ist Cortisol lebensnotwendig. Es hilft bei der Regulierung des Stoffwechsels, reduziert Entzündungen und unterstützt die Gedächtnisbildung. Das Problem entsteht, wenn der Cortisolspiegel durch anhaltenden Stress chronisch erhöht bleibt.';

  @override
  String get eduContent001 =>
      'Cortisol folgt einem natürlichen Tagesrhythmus, dem sogenannten diurnalen Cortisolmuster. Die Werte sind typischerweise morgens am höchsten (gegen 8 Uhr), was Ihnen hilft aufzuwachen und sich wach zu fühlen. Im Laufe des Tages sinken sie allmählich und erreichen gegen Mitternacht ihren Tiefpunkt.\n\nDies wird als Cortisol-Aufwachreaktion (CAR) bezeichnet. Bei einer gesunden CAR steigt Cortisol innerhalb von 30 Minuten nach dem Aufwachen um 50–160 % an — der natürliche Wecker des Körpers.\n\nModerne Lebensgewohnheiten stören diesen Rhythmus durch schlechten Schlaf, chronischen Stress, künstliches Licht am Abend und unregelmäßige Mahlzeiten. Wenn der Rhythmus gestört ist, fühlen Sie sich morgens erschöpft und abends hellwach.';

  @override
  String get eduContent002 =>
      'Die Hypothalamus-Hypophysen-Nebennierenrinden-Achse (HPA-Achse) ist das zentrale Stressreaktionssystem Ihres Körpers. So funktioniert sie:\n\n1. **Hypothalamus** erkennt Stress und schüttet CRH (Corticotropin-Releasing-Hormon) aus\n2. **Hypophyse** empfängt CRH und gibt ACTH (adrenocorticotropes Hormon) ab\n3. **Nebennieren** empfangen ACTH und produzieren Cortisol\n4. **Negativer Rückkopplungskreislauf**: Wenn der Cortisolspiegel hoch genug ist, signalisiert er dem Hypothalamus, die Produktion zu drosseln\n\nChroni­scher Stress kann diesen Rückkopplungskreislauf stören, was zu dauerhaft erhöhtem Cortisol führt, das der Körper nicht mehr richtig unterdrücken kann.';

  @override
  String get eduContent003 =>
      'Viele Menschen verwechseln Cortisol mit Adrenalin (Epinephrin). Obwohl beide Stresshormone sind, wirken sie unterschiedlich:\n\n**Adrenalin** ist schnell — es setzt innerhalb von Sekunden bei akutem Stress ein, lässt das Herz rasen und die Handflächen schwitzen. Seine Wirkung klingt rasch ab.\n\n**Cortisol** ist langsam — es braucht Minuten, um sich zu mobilisieren, aber seine Wirkung hält stunden- oder tagelang an. Es ist für anhaltende Bedrohungen konzipiert, nicht für plötzliche.\n\nDas moderne Problem besteht darin, dass unsere psychologischen Stressoren (Deadlines, Verkehr, Social Media) den Cortisol-Pfad kontinuierlich aktivieren — und ihn dauerhaft erhöht halten, als ob wir ständig einem Raubtier gegenüberstünden.';

  @override
  String get eduContent004 =>
      'Chronisch erhöhtes Cortisol hat weitreichende Folgen:\n\n🩺 **Immunsystem**: Unterdrückt die Immunabwehr, macht Sie anfälliger für Krankheiten\n⚖️ **Gewicht**: Fördert Fetteinlagerungen, besonders viszerales Bauchfett\n💤 **Schlaf**: Stört Schlafzyklen und verursacht Schlaflosigkeit\n🧠 **Gehirn**: Beeinträchtigt Gedächtnis und Konzentration; kann den Hippocampus mit der Zeit verkleinern\n❤️ **Herz**: Erhöht den Blutdruck und steigert das kardiovaskuläre Risiko\n🦴 **Knochen**: Vermindert die Knochendichte\n🩸 **Blutzucker**: Verursacht Insulinresistenz\n\nDie gute Nachricht? Diese Auswirkungen sind durch gezieltes Stressmanagement größtenteils reversibel.';

  @override
  String get eduContent005 =>
      'Der Zusammenhang zwischen Cortisol und psychischer Gesundheit ist tiefgreifend. Hoher Cortisolspiegel ist verbunden mit:\n\n**Angst**: Cortisol verstärkt die Bedrohungserkennung der Amygdala, sodass sich alles gefährlicher anfühlt.\n\n**Depression**: Chronisch hoher Cortisolspiegel reduziert Serotonin und Dopamin — die \"Wohlfühl\"-Neurotransmitter.\n\n**Gehirnnebel**: Cortisol konkurriert mit Glukose im präfrontalen Kortex und beeinträchtigt klares Denken, Entscheidungsfindung und Fokus.\n\n**Emotionale Reaktivität**: Man wird durch kleine Ärgernisse leichter aus der Fassung gebracht.\n\nInteressanterweise kann ein sehr niedriger Cortisolspiegel (Nebennierenschwäche) ebenfalls Depressionen und extreme Erschöpfung verursachen — Gleichgewicht ist entscheidend.';

  @override
  String get eduContent006 =>
      'Tiefes, diaphragmatisches Atmen ist eine der wirkungsvollsten und unmittelbarsten Methoden, um Cortisol zu senken. Die Wissenschaft dahinter:\n\nWenn Sie langsam und tief atmen, aktivieren Sie das parasympathische Nervensystem — die \"Ruhe und Verdauungs\"-Reaktion, die der Stressreaktion direkt entgegenwirkt.\n\nDer Vagusnerv, der vom Gehirn bis zum Darm verläuft, wird durch tiefes Atmen stimuliert. Dies sendet ein \"Sicherheits\"-Signal durch Ihren gesamten Körper und senkt den Cortisolspiegel innerhalb weniger Minuten.\n\n**Die 4-7-8-Technik**: 4 Sekunden einatmen, 7 Sekunden halten, 8 Sekunden ausatmen. Das verlängerte Ausatmen ist entscheidend — es aktiviert die vagale Bremse der Stressreaktion.';

  @override
  String get eduContent007 =>
      'Zeit in der Natur zu verbringen ist wissenschaftlich belegt cortisolsenkend. Eine japanische Praxis namens \"Shinrin-yoku\" (Waldbaden) wurde ausführlich erforscht:\n\n🌿 Bereits 20 Minuten im Wald senken Cortisol um 15,8 %\n🌳 Grüne Räume senken sowohl den Speichel-Cortisolspiegel als auch die Herzfrequenz\n🌊 Blaue Räume (Wasserumgebungen) haben ähnliche Wirkungen\n🌸 Selbst das Betrachten von Naturbildern reduziert Stressmarker\n\nSie brauchen keinen Wald. Bereits ein 10-minütiger Spaziergang im örtlichen Park, die Pflege von Zimmerpflanzen oder das Sitzen am Fenster mit Gartenblick aktiviert die beruhigende Wirkung der Natur auf Ihre HPA-Achse.';

  @override
  String get eduContent008 =>
      'Bewegung ist beim Thema Cortisol ein zweischneidiges Schwert. Das richtige Verständnis hilft Ihnen, Ihr Training zu optimieren:\n\n**Während des Trainings**: Cortisol steigt an, um Energie zu mobilisieren — das ist gesund und normal.\n\n**Nach moderatem Training**: Cortisol fällt stundenlang unter den Ausgangswert und liefert eine \"Cortisol-Dividende.\"\n\n**Übertraining**: Exzessives hochintensives Training hält Cortisol chronisch erhöht. Mehr ist nicht immer besser.\n\n**Beste Praktiken für die Cortisolbalance**:\n• Moderates Ausdauertraining am Morgen (30–45 Min.) ist optimal\n• Intensives Training spät abends vermeiden\n• Ruhetage einplanen — dann findet die Anpassung statt\n• Yoga und Tai-Chi sind besonders effektiv beim Cortisolabbau';

  @override
  String get eduContent009 =>
      'Menschliche Verbindung ist ein starker Cortisol-Puffer. Forschungsergebnisse zeigen:\n\n• **Oxytocin** (das \"Bindungshormon\") hemmt die Cortisolausschüttung direkt\n• Menschen mit starkem sozialen Rückhalt haben 25 % niedrigere Cortisol-Reaktionen auf Stress\n• Selbst kurze, positive soziale Interaktionen senken Cortisol\n• Haustierbesitz senkt Cortisol messbar — schon 10 Minuten Streicheln eines Hundes reduziert den Cortisolspiegel nachweislich\n• Einsamkeit hingegen erhöht Cortisol — sie wird als Überlebensbedrohung wahrgenommen\n\nDeshalb ist soziale Isolation so körperlich schädlich. Ihr Körper braucht sozialen Kontakt wirklich, um seine Stressreaktion zu regulieren.';

  @override
  String get eduContent010 =>
      'Hoher Cortisolspiegel und schlechter Schlaf bilden einen gefährlichen Teufelskreis:\n\n**Hoher Cortisolspiegel → schlechter Schlaf**: Cortisol ist stimulierend. Wenn es nachts erhöht ist, verhindert es, dass das Gehirn die tiefen, erholsamen Schlafphasen erreicht.\n\n**Schlechter Schlaf → hoher Cortisolspiegel**: Bereits eine einzige Nacht mit schlechtem Schlaf erhöht Cortisol am nächsten Tag um 37 %.\n\n**Den Kreislauf durchbrechen**:\n✓ Regelmäßigen Schlaf-/Wachrhythmus beibehalten (auch am Wochenende)\n✓ Bildschirme 1 Stunde vor dem Schlafen meiden — blaues Licht unterdrückt Melatonin\n✓ Schlafzimmer kühl halten (18–20 °C ist optimal)\n✓ Ab 14 Uhr keinen Koffein mehr\n✓ Einschlafroutine pflegen (Lesen, sanftes Dehnen, Atemübungen)';

  @override
  String get eduContent011 =>
      'Yoga ist eine der am besten untersuchten Interventionen zur Cortisolreduktion:\n\n**Studien zeigen**, dass 8 Wochen regelmäßiges Yoga den morgendlichen Cortisolspiegel um bis zu 30 % senken.\n\n**Warum Yoga wirkt**:\n• Verbindet Atmung, Bewegung und Achtsamkeit — dreifacher cortisolsenkender Effekt\n• Aktiviert das parasympathische Nervensystem durch bewusstes Atmen\n• Reduziert die Reaktivität der Amygdala (macht Sie weniger leicht reizbar)\n• Verbessert den GABA-Spiegel — den beruhigenden Neurotransmitter des Gehirns\n\n**Beste Stile für Cortisol**: Hatha, Yin, Restorative und Yoga Nidra (Yogischer Schlaf) sind besonders wirksam. Selbst 10 Minuten sanftes Yoga vor dem Schlafengehen können die Schlafqualität deutlich verbessern.';

  @override
  String get eduContent012 =>
      'Mindfulness-Based Stress Reduction (MBSR) wird seit den 1970er Jahren intensiv erforscht. Die Ergebnisse sind überzeugend:\n\n🧪 **8 Wochen** MBSR senken Cortisol um 20–25 %\n🧠 **Verändert die Gehirnstruktur**: Vergrößert den präfrontalen Kortex (rationales Denken), während die Amygdala (Angstzentrum) schrumpft\n💊 **Gleichwertig mit Medikamenten** bei leichter bis mittelschwerer Angst in mehreren Studien\n❤️ **Reduziert Entzündungsmarker** (CRP, IL-6), die mit Cortisol in Verbindung stehen\n\nSie brauchen keine Stunden. Forschungen zeigen, dass **10 Minuten täglich** fokussierte Achtsamkeitsübung innerhalb von 4 Wochen messbare Cortisolreduktionen bewirkt.';

  @override
  String get eduContent013 =>
      'Ihre Ernährung beeinflusst Cortisol direkt. Diese Lebensmittel können Stresshormone in die Höhe treiben:\n\n☕ **Koffein**: Erhöht Cortisol um 30 %, selbst bei koffeingewöhnten Personen. Entkoffeinierter Kaffee löst das Problem nicht vollständig — warten Sie 90 Minuten nach dem Aufwachen vor Ihrer ersten Tasse.\n\n🍬 **Zuckerspitzen**: Schnelle Blutzuckerschwankungen lösen Cortisolausschüttung aus. Wählen Sie Lebensmittel mit niedrigem glykämischen Index.\n\n🥃 **Alkohol**: Zunächst beruhigend, stört Alkohol die Schlafarchitektur und erhöht Cortisol am nächsten Tag.\n\n🔥 **Entzündungsfördernde Lebensmittel**: Transfette, verarbeitete Pflanzenöle und hochverarbeitete Produkte erhöhen systemische Entzündungen, was den Cortisolspiegel steigert.\n\n🧂 **Übermäßiges Natrium**: Eine natriumreiche Ernährung ist in mehreren Studien mit erhöhtem Cortisolspiegel verbunden.';

  @override
  String get eduContent014 =>
      'Ihr Darmmikrobiom hat eine direkte Verbindung zu Ihrer Stressreaktion — die Darm-Hirn-Achse:\n\n🦠 **Darmbakterien produzieren Neurotransmitter**: 90 % des Serotonins werden im Darm gebildet. Eine gestörte Darmflora bedeutet weniger Serotonin und höhere Stressanfälligkeit.\n\n🔗 **Der Vagusnerv** verbindet Darm und Gehirn — Darmentzündungen aktivieren die HPA-Achse direkt.\n\n🥛 **Probiotika senken Cortisol**: Studien zeigen, dass die Einnahme von Lactobacillus rhamnosus Angst und die Cortisolreaktion auf Stress reduziert.\n\n**Lebensmittel für ein gesundes Darmmikrobiom**:\n• Fermentierte Lebensmittel (Kefir, Joghurt, Kimchi, Sauerkraut)\n• Präbiotische Ballaststoffe (Knoblauch, Zwiebeln, Haferflocken, Bananen)\n• Polyphenolreiche Lebensmittel (Beeren, dunkle Schokolade, Grüntee)';

  @override
  String get eduContent015 =>
      'Magnesium wird oft als \"natürliches Beruhigungsmittel\" bezeichnet — und das aus gutem Grund:\n\n**Die Cortisol-Verbindung**: Magnesium reguliert die HPA-Achse. Ein Mangel lässt Cortisol unkontrolliert ansteigen, während ausreichend Magnesium die übermäßige Cortisolausschüttung bremst.\n\n**Die Mangelepidemic**: Bis zu 68 % der Bevölkerung weisen einen Magnesiummangel auf. Chronischer Stress verbraucht Magnesium — ein Teufelskreis entsteht.\n\n**Anzeichen eines Mangels**: Angst, Muskelverspannungen, schlechter Schlaf, Reizbarkeit, Kopfschmerzen, Heißhunger auf Süßes.\n\n**Beste Nahrungsquellen**: Dunkelgrünes Blattgemüse (Spinat, Grünkohl), Kürbiskerne, Mandeln, Avocado, dunkle Schokolade, Hülsenfrüchte, Vollkornprodukte.\n\n**Nahrungsergänzung**: Magnesiumglycinat und Magnesiumthreonat haben die beste Aufnahme und Gehirndurchdringung.';

  @override
  String get eduContent016 =>
      'Das Schreiben über Ihre Gefühle senkt Cortisol — das ist klinisch belegt:\n\n📝 **Expressives Schreiben** (über stressige Erlebnisse schreiben) reduziert die Cortisolreaktion bei nachfolgenden Stressoren\n\n🧠 **Warum es wirkt**: Schreiben aktiviert den präfrontalen Kortex (rationales Gehirn), der dann die Amygdala (emotionales Gehirn) regulieren kann — und so den Cortisol-Hahn zudreht\n\n💙 **Dankbarkeitstagebuch** ist besonders wirkungsvoll: Bereits kurzes tägliches Aufschreiben von Dankbarkeit senkt Cortisol um 23 % (UCDavis-Forschung)\n\n**Einstieg**: Nur 15 Minuten, 3 Mal pro Woche. Nicht redigieren, einfach schreiben. Konzentrieren Sie sich sowohl auf das Erlebte als auch auf Ihre Gefühle dabei.\n\nDie Tagebuchfunktion dieser App ist genau für diesen Zweck konzipiert — Ihre täglichen Einträge summieren sich zu einer kraftvollen Selbstwahrnehmungspraxis.';

  @override
  String get nutFilterAll => 'Alle';

  @override
  String get nutFilterFruits => 'Obst';

  @override
  String get nutFilterVegetables => 'Gemüse';

  @override
  String get nutFilterProteins => 'Proteine';

  @override
  String get nutFilterBeverages => 'Getränke';

  @override
  String get nutFilterNutsSeeds => 'Nüsse & Samen';

  @override
  String get nutFilterGrains => 'Getreide';

  @override
  String get nutFilterDairy => 'Milchprodukte';

  @override
  String get nutFilterSpices => 'Gewürze';

  @override
  String get nutCatFruits => 'Obst';

  @override
  String get nutCatVegetables => 'Gemüse';

  @override
  String get nutCatProteins => 'Proteine';

  @override
  String get nutCatBeverages => 'Getränke';

  @override
  String get nutCatNutsSeeds => 'Nüsse & Samen';

  @override
  String get nutCatGrains => 'Getreide';

  @override
  String get nutCatDairy => 'Milchprodukte';

  @override
  String get nutCatSpices => 'Gewürze';

  @override
  String get foodName000 => 'Heidelbeeren';

  @override
  String get foodBenefit000 =>
      'Starke Antioxidantien reduzieren oxidativen Stress';

  @override
  String get foodMechanism000 =>
      'Reich an Anthocyanen, die die Blut-Hirn-Schranke überwinden, Neuroentzündungen und cortisolbedingten oxidativen Schaden reduzieren. Studien zeigen, dass Heidelbeerextrakt die Cortisolreaktion nach akutem Stress senkt.';

  @override
  String get foodServing000 =>
      'Eine Handvoll zu Overnight-Oats geben oder in einen Smoothie mixen';

  @override
  String get foodNutrients000 =>
      'Vitamin C, Anthocyane, Ballaststoffe, Vitamin K';

  @override
  String get foodName001 => 'Bananen';

  @override
  String get foodBenefit001 =>
      'Kalium senkt Blutdruck; Tryptophan fördert Serotonin';

  @override
  String get foodMechanism001 =>
      'Bananen enthalten Tryptophan, eine Vorstufe von Serotonin — dem beruhigenden Neurotransmitter, der Cortisol moduliert. Kalium wirkt dem blutdrucksteigernden Effekt von Cortisol entgegen. Der natürliche Zucker liefert schnelle Energie ohne Cortisol-Spitze.';

  @override
  String get foodServing001 =>
      'In Scheiben auf Mandelmus-Toast — ein perfekter Anti-Stress-Snack';

  @override
  String get foodNutrients001 => 'Kalium, Tryptophan, Vitamin B6, Magnesium';

  @override
  String get foodName002 => 'Orangen';

  @override
  String get foodBenefit002 => 'Hoher Vitamin-C-Gehalt senkt Cortisol direkt';

  @override
  String get foodMechanism002 =>
      'Vitamin C wird während der Cortisolproduktion rasch von den Nebennieren verbraucht. Die Ergänzung mit Vitamin C reduziert die Cortisolreaktion auf psychologische Stressoren. Eine deutsche Studie aus dem Jahr 2001 zeigte, dass 1000 mg Vitamin C Cortisol und Blutdruck bei Tests mit öffentlichem Sprechen senkte.';

  @override
  String get foodServing002 =>
      'Die ganze Frucht essen (nicht Saft) für den Ballaststoffnutzen; vor stressigen Ereignissen verzehren';

  @override
  String get foodNutrients002 => 'Vitamin C, Folsäure, Kalium, Flavonoide';

  @override
  String get foodName003 => 'Avocados';

  @override
  String get foodBenefit003 => 'Gesunde Fette reduzieren Stressentzündungen';

  @override
  String get foodMechanism003 =>
      'Avocados sind reich an einfach ungesättigten Fettsäuren, die die Nebennierengesundheit unterstützen und entzündliche Zytokine reduzieren, die mit der HPA-Achsen-Aktivierung verbunden sind. B-Vitamine (B5, B6) unterstützen die Produktion von Nebennierenhormonen. Magnesium moduliert die HPA-Achse direkt.';

  @override
  String get foodServing003 =>
      'Lachs oder Eier mit Avocadoscheiben belegen; für Cremigkeit in Smoothies geben';

  @override
  String get foodNutrients003 =>
      'Magnesium, B5 (Pantothensäure), B6, Einfach ungesättigte Fettsäuren, Kalium';

  @override
  String get foodName004 => 'Spinat';

  @override
  String get foodBenefit004 =>
      'Magnesiumreich — das natürliche Beruhigungsmittel';

  @override
  String get foodMechanism004 =>
      'Spinat ist eine der reichhaltigsten Nahrungsquellen für Magnesium, das die HPA-Achse reguliert und übermäßige Cortisolausschüttung hemmt. Magnesiummangel ist direkt mit erhöhtem Cortisol verbunden. Folsäure in Spinat unterstützt zudem die GABA-Produktion — den beruhigenden Neurotransmitter des Gehirns.';

  @override
  String get foodServing004 =>
      'Mit Knoblauch anbraten als Beilage oder roh in Morgen-Smoothies mixen (Geschmack wird überdeckt)';

  @override
  String get foodNutrients004 =>
      'Magnesium, Folsäure, Eisen, Vitamin K, Vitamin C';

  @override
  String get foodName005 => 'Süßkartoffeln';

  @override
  String get foodBenefit005 =>
      'Anhaltende Energie verhindert Cortisol-Spitzen durch Blutzuckerabfälle';

  @override
  String get foodMechanism005 =>
      'Süßkartoffeln liefern langsam freisetzende komplexe Kohlenhydrate, die Blutzuckerabfälle verhindern, die Cortisol freisetzen. Lila Sorten sind besonders reich an Anthocyanen. Der hohe Kaliumgehalt hilft, dem blutdrucksteigernden Effekt von Cortisol entgegenzuwirken.';

  @override
  String get foodServing005 =>
      'Mit Olivenöl und Zimt rösten; als Beilage stampfen oder als Basis für Buddha-Bowls verwenden';

  @override
  String get foodNutrients005 =>
      'Kalium, Vitamin A, Ballaststoffe, Vitamin C, Mangan';

  @override
  String get foodName006 => 'Brokkoli';

  @override
  String get foodBenefit006 =>
      'Sulforaphan schützt vor stressbedingten Hirnschäden';

  @override
  String get foodMechanism006 =>
      'Sulforaphan in Brokkoli aktiviert Nrf2 — den körpereigenen Master-Antioxidans-Schalter — und schützt Neuronen vor cortisolbedingtem oxidativem Stress. Brokkoli ist zudem reich an Vitamin C, Magnesium und Folsäure, alles direkte Cortisol-Modulatoren.';

  @override
  String get foodServing006 =>
      'Leicht dämpfen, um Sulforaphan zu erhalten; mit Zitrone und Olivenöl beträufeln';

  @override
  String get foodNutrients006 =>
      'Sulforaphan, Vitamin C, Folsäure, Kalzium, Ballaststoffe';

  @override
  String get foodName007 => 'Lachs';

  @override
  String get foodBenefit007 =>
      'Omega-3-Fettsäuren unterdrücken die Cortisolproduktion direkt';

  @override
  String get foodMechanism007 =>
      'EPA und DHA (Omega-3-Fettsäuren) in Lachs senken Cortisol auf zweierlei Weise: Sie verringern die CRH-Freisetzung im Hypothalamus und reduzieren Neuroentzündungen, die Stressreaktionen verstärken. Studien zeigen, dass regelmäßige Omega-3-Zufuhr die Cortisol-Reaktivität um bis zu 22 % senkt.';

  @override
  String get foodServing007 =>
      '2–3 Mal pro Woche mit Zitrone und Kräutern backen; mit Blattgemüse und Avocado kombinieren';

  @override
  String get foodNutrients007 =>
      'EPA/DHA Omega-3, Vitamin D, B12, Selen, Protein';

  @override
  String get foodName008 => 'Putenfleisch';

  @override
  String get foodBenefit008 =>
      'Tryptophan erhöht Serotonin zur Stresspufferung';

  @override
  String get foodMechanism008 =>
      'Putenfleisch ist außergewöhnlich reich an Tryptophan, das der Körper in Serotonin und Melatonin umwandelt. Serotonin moduliert die Cortisolausschüttung und fördert emotionale Stabilität. Die B-Vitamine in Pute unterstützen zudem die Nebennierenfunktion.';

  @override
  String get foodServing008 =>
      'In Scheiben für Wraps mit Avocado und Spinat; als mageres Protein in Salaten verwenden';

  @override
  String get foodNutrients008 => 'Tryptophan, B3 (Niacin), B6, Selen, Zink';

  @override
  String get foodName009 => 'Eier';

  @override
  String get foodBenefit009 =>
      'Vollständiges Protein mit Cholin unterstützt die Stressreaktion des Gehirns';

  @override
  String get foodMechanism009 =>
      'Eier enthalten Cholin, das für die Acetylcholinproduktion unerlässlich ist — den Neurotransmitter, der das parasympathische (Ruhe-)Nervensystem reguliert. Phosphatidylserin in Eigelb hat gezeigt, dass es die Cortisol-Reaktion auf körperliche Belastung um bis zu 30 % reduziert.';

  @override
  String get foodServing009 =>
      'Mit Spinat und Kurkuma rühren; als tragbaren Snack kochen';

  @override
  String get foodNutrients009 =>
      'Cholin, Phosphatidylserin, B12, Vitamin D, Tryptophan';

  @override
  String get foodName010 => 'Grüner Tee';

  @override
  String get foodBenefit010 =>
      'L-Theanin fördert ruhige Wachheit ohne Cortisol-Spitze';

  @override
  String get foodMechanism010 =>
      'L-Theanin, einzigartig in Teeblättern, erhöht die Alpha-Hirnwellen (verbunden mit entspanntem Fokus) und fördert die GABA-Produktion. Es neutralisiert den cortisolsteigernden Effekt von Koffein und reduziert die Stressreaktion bei gleichzeitiger Aufrechterhaltung der geistigen Klarheit.';

  @override
  String get foodServing010 =>
      '2–3 Tassen täglich trinken; bei 80 °C (nicht kochend) aufbrühen, um L-Theanin zu erhalten';

  @override
  String get foodNutrients010 =>
      'L-Theanin, EGCG (Catechine), Koffein (niedrig), Antioxidantien';

  @override
  String get foodName011 => 'Kamillentee';

  @override
  String get foodBenefit011 =>
      'Apigenin bindet GABA-Rezeptoren zur Angstreduktion';

  @override
  String get foodMechanism011 =>
      'Kamille enthält Apigenin, ein Flavonoid, das an GABA-Rezeptoren im Gehirn bindet — dieselben Rezeptoren, die von Angstmedikamenten angesprochen werden, jedoch mit einer sanften, natürlichen Wirkung. Regelmäßiger Konsum senkt den Cortisolspiegel und verbessert die Schlafqualität.';

  @override
  String get foodServing011 =>
      '1–2 Tassen vor dem Schlafengehen als Teil eines Einschlafritu­als trinken';

  @override
  String get foodNutrients011 =>
      'Apigenin, Bisabolol, Chamazulen, Antioxidantien';

  @override
  String get foodName012 => 'Mandeln';

  @override
  String get foodBenefit012 =>
      'Magnesium + Vitamin E schützen vor Stressschäden';

  @override
  String get foodMechanism012 =>
      'Mandeln liefern 20 % des Tagesbedarfs an Magnesium pro 30 g — und dämpfen so die Überaktivität der HPA-Achse direkt. Vitamin E ist ein Antioxidans, das Nebennierenzel­len vor freien Radikalen schützt, die durch chronische Cortisolproduktion entstehen.';

  @override
  String get foodServing012 =>
      'Eine kleine Handvoll (23 Mandeln) als Vormittagssnack; zum Porridge geben';

  @override
  String get foodNutrients012 =>
      'Magnesium, Vitamin E, Einfach ungesättigte Fettsäuren, Protein, Ballaststoffe';

  @override
  String get foodName013 => 'Kürbiskerne';

  @override
  String get foodBenefit013 =>
      'Zinkmangel ist mit hohem Cortisol verbunden — Kürbiskerne sind die reichste Quelle';

  @override
  String get foodMechanism013 =>
      'Zink ist ein entscheidender Cofaktor im negativen Rückkopplungskreislauf, der die Cortisolproduktion stoppt. Zinkmangel führt zu chronisch erhöhtem Cortisol. Kürbiskerne sind die reichste pflanzliche Zinkquelle und enthalten zudem Tryptophan und Magnesium.';

  @override
  String get foodServing013 =>
      'Rösten und zu Salaten, Suppen oder Trailmix geben; in Porridge einrühren';

  @override
  String get foodNutrients013 =>
      'Zink, Tryptophan, Magnesium, Phosphor, Mangan';

  @override
  String get foodName014 => 'Haferflocken';

  @override
  String get foodBenefit014 =>
      'Komplexe Kohlenhydrate stabilisieren Blutzucker und erhöhen Serotonin';

  @override
  String get foodMechanism014 =>
      'Haferflocken liefern komplexe Kohlenhydrate, die die Serotoninproduktion anregen (Kohlenhydrate erhöhen die Tryptophanaufnahme im Gehirn). Beta-Glucan-Ballaststoffe fördern ein gesundes Darmmikrobiom, das die Darm-Hirn-Achse zur Cortisolregulierung unterstützt. Sie verhindern Blutzuckerabfälle, die Cortisol auslösen.';

  @override
  String get foodServing014 =>
      'Overnight-Oats mit Heidelbeeren, Walnüssen und Honig am Abend vorbereiten';

  @override
  String get foodNutrients014 =>
      'Beta-Glucan, B1 (Thiamin), Magnesium, Zink, Ballaststoffe';

  @override
  String get foodName015 => 'Quinoa';

  @override
  String get foodBenefit015 =>
      'Vollständiges Protein mit allen essenziellen Aminosäuren für die Neurotransmitterproduktion';

  @override
  String get foodMechanism015 =>
      'Quinoa ist ein vollständiges Protein mit allen 9 essenziellen Aminosäuren, darunter Tryptophan und Tyrosin — Vorläufer von Serotonin bzw. Dopamin. Der niedrige glykämische Index verhindert die Blutzuckerschwankungen, die Cortisol freisetzen.';

  @override
  String get foodServing015 =>
      'Als Basis für Buddha-Bowls oder mediterrane Salate verwenden';

  @override
  String get foodNutrients015 =>
      'Vollständiges Protein, Magnesium, Eisen, Ballaststoffe, Riboflavin';

  @override
  String get foodName016 => 'Griechischer Joghurt';

  @override
  String get foodBenefit016 =>
      'Probiotika unterstützen die Darm-Hirn-Achse zur Cortisolregulierung';

  @override
  String get foodMechanism016 =>
      'Griechischer Joghurt ist reich an Lactobacillus- und Bifidobacterium-Stämmen, die GABA direkt im Darm produzieren. Forschungen zeigen, dass Probiotika-Ergänzung in klinischen Studien Cortisol und Angst reduziert. Der hohe Proteingehalt unterstützt Sättigung und stabilen Blutzucker.';

  @override
  String get foodServing016 =>
      'Mit Heidelbeeren und Kürbiskernen toppen — ein komplettes Anti-Stress-Frühstück';

  @override
  String get foodNutrients016 =>
      'Probiotika, Protein, Kalzium, B12, Tryptophan';

  @override
  String get foodName017 => 'Kefir';

  @override
  String get foodBenefit017 =>
      'Das probiotikareichste Lebensmittel — senkt Cortisol direkt über die Darmachse';

  @override
  String get foodMechanism017 =>
      'Kefir enthält bis zu 61 Stämme nützlicher Bakterien — weit mehr als Joghurt. Studien zeigen, dass Kefirkonsum Cortisol senkt, indem es die Verbindung zwischen Darmmikrobiom und Gehirn moduliert. Der Tryptophangehalt steigert zudem Serotonin.';

  @override
  String get foodServing017 =>
      'Pur trinken oder in Smoothies mixen; als Basis für Smoothie-Bowls verwenden';

  @override
  String get foodNutrients017 =>
      'Probiotika (61 Stämme), Tryptophan, Kalzium, B12, K2';

  @override
  String get foodName018 => 'Kurkuma';

  @override
  String get foodBenefit018 =>
      'Curcumin ist in mehreren Studien so wirksam wie Antidepressiva';

  @override
  String get foodMechanism018 =>
      'Curcumin in Kurkuma hemmt entzündliche Zytokine (IL-6, TNF-alpha), die die HPA-Achse aktivieren. Es erhöht auch BDNF (Brain-Derived Neurotrophic Factor) und schützt Neuronen vor Cortisolschäden. Mehrere Studien zeigen, dass Curcumin Cortisol und Depression ähnlich effektiv senkt wie einige Pharmaka.';

  @override
  String get foodServing018 =>
      'Goldene Milch vor dem Schlafengehen: warme Milch + Kurkuma + schwarzer Pfeffer + Honig';

  @override
  String get foodNutrients018 =>
      'Curcumin, Eisen, Mangan, Entzündungshemmende Verbindungen';

  @override
  String get foodName019 => 'Dunkle Schokolade (70 %+)';

  @override
  String get foodBenefit019 =>
      'Senkt Cortisol und Adrenalin direkt — in klinischen Studien belegt';

  @override
  String get foodMechanism019 =>
      'Eine wegweisende Studie aus 2009 zeigte, dass der tägliche Verzehr von 40 g dunkler Schokolade über 2 Wochen Cortisol und Katecholamine signifikant senkte. Magnesium moduliert die HPA-Achse; Flavanole erhöhen BDNF und schützen vor stressbedingten neuronalen Schäden. Theobromin liefert ruhige Energie.';

  @override
  String get foodServing019 =>
      '1–2 Stücke (40 g) nach dem Mittagessen; auf einen Kakaogehalt von 70 %+ achten';

  @override
  String get foodNutrients019 =>
      'Magnesium, Flavanole, Theobromin, Eisen, Zink';

  @override
  String get breathTechBelly => 'Bauchatmung';

  @override
  String get breathTechBox => 'Box-Atmung';

  @override
  String get breathTech478 => '4-7-8-Atmung';

  @override
  String get breathDescBelly =>
      'Die Grundlage aller Atemübungen. Auch Zwerchfellatmung genannt, aktiviert sie sofort das parasympathische Nervensystem. Ideal für Einsteiger oder jeden, der einen schnellen Stressabbau benötigt.';

  @override
  String get breathDescBox =>
      'Von Navy SEALs und Spitzensportlern genutzt, um unter extremem Druck ruhig zu bleiben. Gleichmäßige Phasen erzeugen ein \"Kasten\"-Muster, das das Nervensystem rasch zurücksetzt. Hervorragend für Fokus und Lampenfieber.';

  @override
  String get breathDesc478 =>
      'Entwickelt von Dr. Andrew Weil auf Basis yogischer Pranayama-Traditionen. Das verlängerte Ausatmen (8 Zählungen) aktiviert die vagale Bremse der Stressreaktion. Dr. Weil nennt es \"ein natürliches Beruhigungsmittel für das Nervensystem.\"';

  @override
  String get breathInstrBellyInhale =>
      'Atmen Sie langsam durch die Nase ein und füllen Sie dabei Ihren Bauch';

  @override
  String get breathInstrBellyExhale =>
      'Atmen Sie langsam durch den Mund aus und leeren Sie dabei Ihren Bauch';

  @override
  String get breathInstrBoxInhale =>
      'Atmen Sie langsam durch die Nase ein und zählen Sie bis 4';

  @override
  String get breathInstrBoxHoldFull =>
      'Sanft halten — Lungen gefüllt, Körper entspannt';

  @override
  String get breathInstrBoxExhale =>
      'Atmen Sie vollständig durch den Mund aus und zählen Sie bis 4';

  @override
  String get breathInstrBoxHoldEmpty =>
      'Sanft halten — Lungen leer, Körper entspannt';

  @override
  String get breathInstr478Inhale =>
      'Atmen Sie still durch die Nase ein, 4 Zählungen';

  @override
  String get breathInstr478Hold =>
      'Halten Sie den Atem vollständig für 7 Zählungen an';

  @override
  String get breathInstr478Exhale =>
      'Atmen Sie vollständig durch den Mund mit einem Zischgeräusch aus, 8 Zählungen';

  @override
  String get breathBenefitBelly1 =>
      'Aktiviert das parasympathische Nervensystem';

  @override
  String get breathBenefitBelly2 => 'Senkt Cortisol innerhalb von Minuten';

  @override
  String get breathBenefitBelly3 => 'Reduziert Herzfrequenz und Blutdruck';

  @override
  String get breathBenefitBelly4 => 'Verbessert den Sauerstoffaustausch';

  @override
  String get breathBenefitBox1 => 'Schnelle Stress- und Angstreduktion';

  @override
  String get breathBenefitBox2 => 'Verbessert Fokus und Konzentration';

  @override
  String get breathBenefitBox3 => 'Von Navy SEALs und Spitzensportlern genutzt';

  @override
  String get breathBenefitBox4 => 'Balanciert CO2- und O2-Werte';

  @override
  String get breathBenefitBox5 => 'Reduziert die Cortisol-Reaktion';

  @override
  String get breathBenefit4781 => 'Natürliche Beruhigungswirkung';

  @override
  String get breathBenefit4782 => 'Reduziert akute Angst in Minuten';

  @override
  String get breathBenefit4783 => 'Aktiviert den Vagusnerv';

  @override
  String get breathBenefit4784 =>
      'Hilft bei Schlaflosigkeit — vor dem Schlafen anwenden';

  @override
  String get breathBenefit4785 => 'Bändigt stressbedingte Essgelüste';

  @override
  String get breathBenefit4786 => 'Basiert auf altem yogischen Pranayama';

  @override
  String get durationMin => 'Min';

  @override
  String get durationSec => 'Sek';

  @override
  String get appBlockerSubtitle =>
      'Blockieren Sie stressauslösende Apps während Ihrer Morgenroutine';

  @override
  String get compEducation => 'Bildungsmodul';

  @override
  String get compBreathing => 'Atemübungen (3)';

  @override
  String get compSoundscapes => 'Klanglandschaften (5)';

  @override
  String get compNutrition => 'Ernährungsratgeber';

  @override
  String get compJournal => 'Stimmungstagebuch';

  @override
  String get compSleep => 'Schlaf-Tracker';

  @override
  String get compMeditation => 'Geführte Meditationsbibliothek';

  @override
  String get compRecipes => 'Rezeptbuch (22 Rezepte)';

  @override
  String get compAppBlocker => 'App-Blocker / Fokusmodus';

  @override
  String get compAiInsights => 'KI-Stimmungsanalyse';

  @override
  String get compWeeklyAnalysis => 'Wöchentliche Musteranalyse';

  @override
  String get blockerHeroText =>
      'Die ersten 2 Stunden nach dem Aufwachen haben die höchsten Cortisolwerte. Das Vermeiden stressiger Apps (soziale Medien, Nachrichten) verbessert Ihren Tag erheblich.';

  @override
  String blockerActiveStatus(Object hours) {
    return 'Aktiv — ${hours}h nach dem Aufwachen';
  }

  @override
  String get blockerInactive => 'Inaktiv';

  @override
  String blockerDurationLabel(Object hours) {
    return 'Blockierungsdauer: $hours Stunden';
  }

  @override
  String get thisWeek => 'Diese Woche';

  @override
  String get sevenDayAverage => '7-Tage-Durchschnitt';

  @override
  String get vsLastWeek => 'vs. letzte Woche';

  @override
  String get stressLow => 'Niedrig';

  @override
  String get stressModerate => 'Mittel';

  @override
  String get stressHigh => 'Hoch';

  @override
  String get dayMon => 'Mo';

  @override
  String get dayTue => 'Di';

  @override
  String get dayWed => 'Mi';

  @override
  String get dayThu => 'Do';

  @override
  String get dayFri => 'Fr';

  @override
  String get daySat => 'Sa';

  @override
  String get daySun => 'So';

  @override
  String get moodPattern1obs => 'Ihre Stimmung neigt dazu, mittwochs zu sinken';

  @override
  String get moodPattern1tip =>
      'Planen Sie mittwochmorgens eine 5-minütige Atemübung ein, um dem Stress-Höhepunkt zur Wochenmitte vorzubeugen.';

  @override
  String get moodPattern2obs =>
      'Sie fühlen sich freitags und am Wochenende durchgehend besser';

  @override
  String get moodPattern2tip =>
      'Dies deutet darauf hin, dass Arbeitsstress der Hauptfaktor ist. Der App-Blocker und die morgendliche Atemroutine können an Wochentagen helfen.';

  @override
  String get moodPattern3obs =>
      'Schlechtere Stimmung korreliert mit Nächten unter 7 Stunden Schlaf';

  @override
  String get moodPattern3tip =>
      'Eine regelmäßige Schlafenszeit um 22:30 Uhr und das Kamille-Latte-Rezept könnten Ihre Grundstimmung verbessern.';

  @override
  String get weeklyTipText =>
      'Basierend auf Ihren Stimmungsmustern ist Ihr Cortisol wahrscheinlich dienstags und mittwochmorgens am höchsten. Probieren Sie die 4-7-8-Atemübung vor Ihrer ersten Aufgabe an diesen Tagen. Ihre Tagebucheinträge zeigen bessere Stimmung bei Bewegung — erwägen Sie 20 Minuten moderate Aktivität vor 10 Uhr.';

  @override
  String playingMeditation(Object title) {
    return 'Wiedergabe: $title';
  }

  @override
  String get medTitle1 => 'Morgendlicher Cortisol-Reset';

  @override
  String get medDesc1 =>
      'Beginnen Sie den Tag mit der Regulierung Ihrer Cortisol-Aufwachreaktion.';

  @override
  String get medCat1 => 'Morgen';

  @override
  String get medTitle2 => 'Schlafvorbereitung';

  @override
  String get medDesc2 =>
      'Beruhigen Sie Ihr Nervensystem für tiefen, erholsamen Schlaf.';

  @override
  String get medCat2 => 'Schlaf';

  @override
  String get medTitle3 => 'Angstlinderung';

  @override
  String get medDesc3 =>
      'Unterbrechen Sie den Stressreaktionszyklus mit MBSR-Techniken.';

  @override
  String get medCat3 => 'Angst';

  @override
  String get medTitle4 => 'Tiefe Konzentration';

  @override
  String get medDesc4 =>
      'Senken Sie Cortisol und erreichen Sie einen Zustand ruhiger Produktivität.';

  @override
  String get medCat4 => 'Fokus';

  @override
  String get medTitle5 => 'Körper-Scan';

  @override
  String get medDesc5 =>
      'Lösen Sie körperliche Anspannung durch chronischen Stress.';

  @override
  String get medCat5 => 'Körper';

  @override
  String get filterBreakfast => 'Frühstück';

  @override
  String get filterSmoothies => 'Smoothies';

  @override
  String get filterSalads => 'Salate';

  @override
  String get filterMains => 'Hauptgerichte';

  @override
  String get filterSnacks => 'Snacks';

  @override
  String get filterDrinks => 'Getränke';

  @override
  String get filterDesserts => 'Desserts';

  @override
  String get moreJournalSub => 'Verfolgen Sie Ihre tägliche Stimmung';

  @override
  String get moreSleepSub => 'Überwachen Sie Ihre Schlafqualität';

  @override
  String get moreSettingsSub => 'Design, Sprache, Benachrichtigungen';

  @override
  String unlockProButton(Object price) {
    return 'PRO freischalten — $price';
  }

  @override
  String get paymentDisclaimer =>
      'Zahlung über Google Play. Einmaliger Kauf. Kein Abonnement.';

  @override
  String get proThankYouSnackbar =>
      'Danke! Alle PRO-Funktionen sind freigeschaltet.';

  @override
  String get cortisolZeroPro => 'Cortisol Zero PRO';

  @override
  String get proBannerDescription =>
      'Rezepte, Meditation, App-Blocker, KI-Analysen — 6,50 \$ einmalig';

  @override
  String get aiDemoDataNotice =>
      'Dies ist eine Demo-Vorschau. Beginnen Sie mit der Erfassung Ihrer täglichen Stimmung für personalisierte KI-Einblicke.';

  @override
  String get aiDemoLabel => 'Demo-Daten';

  @override
  String get recipeWhyItWorks => 'Warum es wirkt';

  @override
  String get recipeIngredients => 'Zutaten';

  @override
  String get recipeInstructions => 'Anleitung';

  @override
  String recipeServings(int count) {
    return '$count Portionen';
  }

  @override
  String get blockedAppsTitle => 'Blockierte Apps';

  @override
  String get blockerAddApps => 'Hinzufügen';

  @override
  String get blockerNoAppsSelected =>
      'Keine Apps ausgewählt. Tippe auf Hinzufügen, um Apps für deine Morgen-Fokuszeit auszuwählen.';

  @override
  String get blockerSelectApps => 'Apps zum Blockieren auswählen';

  @override
  String get blockerSearchApps => 'Apps suchen...';

  @override
  String get blockerLoadingApps => 'Installierte Apps werden geladen...';

  @override
  String get blockerStartButton => 'Blockierung starten';

  @override
  String get blockerStopButton => 'Blockierung stoppen';

  @override
  String get blockerPermUsageStats => 'Zugriff auf Nutzungsdaten';

  @override
  String get blockerPermOverlay => 'Über anderen Apps anzeigen';

  @override
  String get blockerRefreshPerms => 'Berechtigungen aktualisieren';

  @override
  String get proActivatedMessage =>
      'Alle PRO-Funktionen sind freigeschaltet und werden in wenigen Sekunden aktiviert.';

  @override
  String get permOnboardingTitle => 'Berechtigungen einrichten';

  @override
  String get permStepUsageTitle => 'Zugriff auf Nutzungsdaten';

  @override
  String get permStepUsageDesc =>
      'Erlaube uns zu sehen, wann du eine Stressquelle öffnest. Dies ist erforderlich, um den Blocker zu aktivieren.';

  @override
  String get permStepUsageButton => 'Nutzungseinstellungen öffnen';

  @override
  String get permStepOverlayTitle => 'Über anderen Apps anzeigen';

  @override
  String get permStepOverlayDesc =>
      'Erlaube uns, die Stressquelle abzudecken. So können wir einen beruhigenden Bildschirm anstelle der blockierten App anzeigen.';

  @override
  String get permStepOverlayButton => 'Overlay-Einstellungen öffnen';

  @override
  String get permStepGranted => 'Berechtigung erteilt';

  @override
  String get permNextStep => 'Nächster Schritt';

  @override
  String get permAllDone => 'Alles bereit — los geht\'s!';

  @override
  String get permBackToStep1 => 'Zurück zu Schritt 1';

  @override
  String get permStepUsageLottieHint =>
      'Finde Cortisol Zero in der Liste und aktiviere den Zugriff';

  @override
  String get permStepOverlayLottieHint =>
      'Schalte den Schalter um, um die Overlay-Anzeige zu erlauben';

  @override
  String get permSetupRequired => 'Einrichtung erforderlich';

  @override
  String get permSetupRequiredDesc =>
      'Zum Blockieren von Apps benötigen wir drei Berechtigungen. Tippe unten, um sie einzurichten.';

  @override
  String get permStepAccessibilityTitle => 'Zugänglichkeitsdienst';

  @override
  String get permStepAccessibilityDesc =>
      'Cortisol Zero verwendet Androids Barrierefreiheitsdienst ausschließlich, um die aktuell auf dem Bildschirm angezeigte App zu erkennen (anhand des Paketnamens). Es greift NICHT auf Nachrichten, Passwörter, Finanzdaten oder persönliche Informationen zu. Die Erkennung erfolgt nur lokal auf deinem Gerät und wird nirgendwo gespeichert oder übertragen.';

  @override
  String get permStepAccessibilityButton =>
      'Zugänglichkeitseinstellungen öffnen';

  @override
  String get permStepAccessibilityLottieHint =>
      'Finde Cortisol Zero in der installierten Apps-Liste und aktiviere es';

  @override
  String get blockerPermAccessibility => 'Zugänglichkeitsdienst';

  @override
  String get permBackToStep2 => 'Zurück zu Schritt 2';

  @override
  String get permDisclosureAccesses => 'Worauf es zugreift';

  @override
  String get permDisclosureAccessesDesc =>
      'Welche App gerade auf dem Bildschirm ist (nur Paketname)';

  @override
  String get permDisclosureNotAccesses => 'Worauf es NICHT zugreift';

  @override
  String get permDisclosureNotAccessesDesc =>
      'Nachrichten, Passwörter, Finanzdaten, persönliche Informationen, Browserverlauf, Kontakte';

  @override
  String get permDisclosureDataUsage => 'Wie Daten verwendet werden';

  @override
  String get permDisclosureDataUsageDesc =>
      'Alle Erkennung erfolgt lokal auf Ihrem Gerät. Nichts wird gespeichert oder übertragen.';

  @override
  String get permUnderstandContinue => 'Ich verstehe & weiter';

  @override
  String get moodInsights3DayTitle => '3-Tage Schnellübersicht';

  @override
  String get moodInsightsWeeklyTitle => 'Wöchentliche Musteranalyse';

  @override
  String get moodInsightsRetry => 'Analyse wiederholen';

  @override
  String get moodInsightsError =>
      'Analyse fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get moodInsightsNotEnoughData =>
      'Füge mindestens 2 Stimmungseinträge hinzu, um Einblicke zu sehen';

  @override
  String get privacyOverviewTitle => 'Wie wir Ihre Daten verarbeiten';

  @override
  String get privacyOverviewBody =>
      'Cortisol Zero benötigt 3 Berechtigungen, um Stress-Apps zu blockieren. Die gesamte Verarbeitung erfolgt lokal auf Ihrem Gerät. Wir erfassen, speichern oder senden KEINE Daten an Server. Wir haben keine Benutzerkonten oder Analysen.';

  @override
  String get privacyOverviewAccept => 'Ich stimme zu & weiter';

  @override
  String get privacyOverviewLearnMore => 'Datenschutzrichtlinie';

  @override
  String get privacyOverviewTerms => 'Nutzungsbedingungen';

  @override
  String get permTutorialButton => 'Video-Tutorial ansehen';

  @override
  String get permTapToGrant => 'BERECHTIGUNG ERTEILEN';

  @override
  String get permFindAppText =>
      'Finden Sie Cortisol Zero auf dem nächsten Bildschirm';

  @override
  String get permTapAndToggle => 'Antippen und den Schalter einschalten';

  @override
  String get permWhatItDoes => 'Was diese Berechtigung tut';

  @override
  String get permWhatItDoesNot => 'Was diese Berechtigung NICHT tut';

  @override
  String get legalSectionTitle => 'Rechtliches';

  @override
  String get legalPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get legalTermsOfService => 'Nutzungsbedingungen';

  @override
  String get todaysMoodRecorded => 'Heutige Stimmung: erfasst';

  @override
  String blockerScheduleInfo(String time, String hours) {
    return 'Sperre täglich ab $time für $hours Std. geplant. Sperre endet automatisch.';
  }

  @override
  String get privacyPolicyTitle => 'Datenschutzrichtlinie';

  @override
  String get privacyPolicyLastUpdated => 'Gültig ab: 1. Januar 2025';

  @override
  String get privacyPolicyIntro =>
      'Cortisol Zero (\"wir\", \"unser\", \"App\") verpflichtet sich, Ihre Privatsphäre zu schützen.';

  @override
  String get privacyPolicyDataCollectedTitle => '1. Erhobene Daten';

  @override
  String get privacyPolicyDataCollectedBody =>
      'Cortisol Zero erhebt KEINE personenbezogenen Daten. Alle Daten (Tagebucheinträge, Schlafaufzeichnungen, Atemubungshistorie und App-Blocker-Zeitpläne) werden ausschließlich auf Ihrem Gerät gespeichert und niemals an einen Server übertragen.';

  @override
  String get privacyPolicyPermissionsTitle => '2. Verwendete Berechtigungen';

  @override
  String get privacyPolicyPermissionsBody =>
      '• Barrierefreiheitsdienst — erkennt, welche App gerade angezeigt wird (nur Paketname), um Ihren Blockierungsplan anzuwenden. Er liest KEINE Nachrichten, Passwörter oder persönliche Daten.\n\n• Über anderen Apps anzeigen — zeigt einen beruhigenden Überlagerungsbildschirm, wenn eine blockierte App während der Fokuszeiten geöffnet wird.\n\n• Nutzungsstatistiken — liest App-Nutzungsdaten, um Blockierungsregeln zu aktivieren. Diese Daten verbleiben nur auf Ihrem Gerät.\n\n• Vordergunddienst — hält den Blocker während Ihres geplanten Fokusfensters im Hintergrund aktiv.\n\nKeine dieser Berechtigungen wird verwendet, um Daten zu erfassen, zu übertragen oder mit uns oder Dritten zu teilen.';

  @override
  String get privacyPolicyPurchasesTitle => '3. In-App-Käufe';

  @override
  String get privacyPolicyPurchasesBody =>
      'Käufe werden über Google Play abgewickelt. Wir speichern keine Zahlungsinformationen. Wir erhalten nur ein Kauftoken zur Verifizierung Ihres PRO-Status.';

  @override
  String get privacyPolicyThirdPartyTitle => '4. Drittanbieterdienste';

  @override
  String get privacyPolicyThirdPartyBody =>
      'Wir integrieren keine Analyse-, Werbe-SDKs oder Absturzberichte, die personenbezogene Daten erheben. Die App enthält keinen Tracking-Code.';

  @override
  String get privacyPolicyChildrenTitle => '5. Kinder';

  @override
  String get privacyPolicyChildrenBody =>
      'Cortisol Zero erhebt wissentlich keine Informationen von Kindern unter 13 Jahren. Die App ist für ein allgemeines Publikum eingestuft.';

  @override
  String get privacyPolicyContactTitle => '6. Kontakt';

  @override
  String get privacyPolicyContactBody =>
      'Für Datenschutzfragen kontaktieren Sie uns unter: cartizolzero@gmail.com';

  @override
  String get privacyPolicyChangesTitle => '7. Änderungen';

  @override
  String get privacyPolicyChangesBody =>
      'Wir können diese Richtlinie aktualisieren. Die fortgesetzte Nutzung der App nach Aktualisierungen gilt als Zustimmung zur überarbeiteten Richtlinie.';

  @override
  String get termsTitle => 'Nutzungsbedingungen';

  @override
  String get termsLastUpdated => 'Gültig ab: 1. Januar 2025';

  @override
  String get termsIntro =>
      'Durch die Nutzung von Cortisol Zero erklären Sie sich mit diesen Bedingungen einverstanden.';

  @override
  String get termsUseTitle => '1. Nutzung der App';

  @override
  String get termsUseBody =>
      'Cortisol Zero ist ein persönliches Gesundheits- und Produktivitätswerkzeug. Sie dürfen es für Ihre eigenen Stressmanagement- und Fokusviele nutzen. Sie dürfen die App oder ihre Inhalte nicht dekompilieren, verteilen oder weiterverkaufen.';

  @override
  String get termsProTitle => '2. PRO-Abonnement';

  @override
  String get termsProBody =>
      'PRO-Funktionen werden über einen In-App-Kauf über Google Play freigeschaltet. Abonnements verlängern sich automatisch, sofern sie nicht mindestens 24 Stunden vor dem Verlängerungsdatum gekündigt werden. Rückerstattungen werden gemäß der Rückgaberichtlinie von Google Play abgewickelt.';

  @override
  String get termsPermissionsTitle => '3. Berechtigungen';

  @override
  String get termsPermissionsBody =>
      'Die App benötigt bestimmte Android-Berechtigungen (Barrierefreiheitsdienst, Über anderen Apps anzeigen, Nutzungsstatistiken), um die App-Blockierungsfunktionalität bereitzustellen. Diese Berechtigungen werden ausschließlich für den angegebenen Zweck verwendet und niemals zur Erfassung personenbezogener Daten.';

  @override
  String get termsDisclaimerTitle => '4. Haftungsausschluss';

  @override
  String get termsDisclaimerBody =>
      'Cortisol Zero ist ein Wellness-Tool und KEIN Medizinprodukt oder medizinischer Rat. Konsultieren Sie bei medizinischen Fragen stets einen Facharzt.';

  @override
  String get termsLiabilityTitle => '5. Haftungsbeschränkung';

  @override
  String get termsLiabilityBody =>
      'Wir haften nicht für Schäden, die aus der Nutzung dieser App entstehen. Die App wird \"wie besehen\" ohne jegliche Gewährleistung bereitgestellt.';

  @override
  String get termsChangesTitle => '6. Änderungen';

  @override
  String get termsChangesBody =>
      'Wir können diese Bedingungen aktualisieren. Die fortgesetzte Nutzung der App nach Aktualisierungen gilt als Zustimmung.';

  @override
  String get termsContactTitle => '7. Kontakt';

  @override
  String get termsContactBody =>
      'Für Fragen kontaktieren Sie uns unter: cartizolzero@gmail.com';

  @override
  String get testAlarmIn1Min => 'Testalarm in 1 Minute';

  @override
  String get testAlarmScheduled => 'Testalarm in 1 Minute geplant';

  @override
  String get blockerLockedTitle => 'Einstellungen gesperrt';

  @override
  String blockerLockedBody(String time) {
    return 'Fokus-Modus ist aktiv. Du kannst die Einstellungen nach Ende der Blockierung um $time ändern.';
  }
}
