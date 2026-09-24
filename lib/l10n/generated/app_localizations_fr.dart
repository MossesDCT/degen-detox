// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Cortisol Zero';

  @override
  String get appTagline => 'Votre compagnon quotidien pour réduire le stress';

  @override
  String get navHome => 'Accueil';

  @override
  String get navLearn => 'Apprendre';

  @override
  String get navBreathe => 'Respirer';

  @override
  String get navSounds => 'Sons';

  @override
  String get navMore => 'Plus';

  @override
  String get greetingMorning => 'Bonjour';

  @override
  String get greetingAfternoon => 'Bon après-midi';

  @override
  String get greetingEvening => 'Bonsoir';

  @override
  String get greetingNight => 'Bonne nuit';

  @override
  String get dayStreak => 'jours consécutifs';

  @override
  String get dailyTip => 'Conseil du jour';

  @override
  String get quickAccess => 'Accès rapide';

  @override
  String get moodCheckin => 'Comment vous sentez-vous?';

  @override
  String get howAreYouFeeling => 'Comment vous sentez-vous aujourd\'hui?';

  @override
  String get explore => 'Explorer';

  @override
  String get learnTitle => 'Apprendre';

  @override
  String get learnSubtitle => 'Comprenez le cortisol et comment le gérer';

  @override
  String get searchTopics => 'Rechercher des sujets...';

  @override
  String get seeAll => 'Voir tout';

  @override
  String minuteRead(int count) {
    return '$count min de lecture';
  }

  @override
  String get noResultsFound => 'Aucun résultat trouvé';

  @override
  String get nutritionGuide => 'Guide Nutritionnel';

  @override
  String get antiStressFoods => 'Aliments Anti-Stress';

  @override
  String get tapToLearnScience =>
      'Touchez un aliment pour comprendre comment il réduit le cortisol';

  @override
  String get servingIdea => 'Idée de portion';

  @override
  String get breatheTitle => 'Respirer';

  @override
  String get breatheSubtitle =>
      'Les exercices de respiration réduisent le cortisol en minutes';

  @override
  String get scienceBackedTechniques => 'Techniques validées scientifiquement';

  @override
  String get vagusNerveInfo =>
      'Chaque technique active le nerf vague pour réduire le cortisol en quelques minutes';

  @override
  String get beginner => 'Débutant';

  @override
  String get intermediate => 'Intermédiaire';

  @override
  String get advanced => 'Avancé';

  @override
  String get phaseInhale => 'Inspirez';

  @override
  String get phaseHold => 'Retenez';

  @override
  String get phaseExhale => 'Expirez';

  @override
  String get sessionComplete => 'Séance terminée!';

  @override
  String get sessionCompleteMessage =>
      'Vos niveaux de cortisol diminuent. Prenez un moment pour remarquer comment vous vous sentez.';

  @override
  String get cyclesCompleted => 'Cycles';

  @override
  String get duration => 'Durée';

  @override
  String get done => 'Terminé';

  @override
  String get endSession => 'Terminer la séance';

  @override
  String cycleOf(int current, int total) {
    return 'Cycle $current sur $total';
  }

  @override
  String get soundsTitle => 'Sons';

  @override
  String get soundsSubtitle =>
      'Sons naturels pour calmer votre système nerveux';

  @override
  String nowPlaying(String name) {
    return 'En cours: $name';
  }

  @override
  String get tapToPlay => 'Touchez pour jouer';

  @override
  String get paused => 'En pause';

  @override
  String get sleepTimer => 'Minuterie de sommeil';

  @override
  String get audioWillStop => 'L\'audio s\'arrêtera automatiquement';

  @override
  String get cancelTimer => 'Annuler la minuterie';

  @override
  String sleepTimerSet(int minutes) {
    return 'Minuterie: $minutes min';
  }

  @override
  String get journalTitle => 'Journal d\'humeur';

  @override
  String get addEntry => 'Ajouter une entrée';

  @override
  String get saveEntry => 'Sauvegarder';

  @override
  String get noEntriesThisMonth => 'Aucune entrée ce mois';

  @override
  String get tapPlusToAdd => 'Touchez + pour ajouter votre première entrée';

  @override
  String weeklyAverage(String mood) {
    return 'Moyenne hebdomadaire: $mood';
  }

  @override
  String get addNoteOptional =>
      'Ajoutez une note sur votre humeur... (optionnel)';

  @override
  String get moodTerrible => 'Terrible';

  @override
  String get moodBad => 'Mauvais';

  @override
  String get moodOkay => 'Correct';

  @override
  String get moodGood => 'Bien';

  @override
  String get moodGreat => 'Excellent';

  @override
  String get sleepTrackerTitle => 'Suivi du Sommeil';

  @override
  String get logSleep => 'Enregistrer le sommeil';

  @override
  String get sleepQuality => 'Qualité du sommeil';

  @override
  String get bedtimeReminder => 'Rappel du coucher';

  @override
  String get avgQuality => 'Qualité moyenne';

  @override
  String get avgDuration => 'Durée moyenne';

  @override
  String get tracked => 'Suivi';

  @override
  String get bedtime => 'Heure du coucher';

  @override
  String get wakeTime => 'Heure du réveil';

  @override
  String get last7Days => '7 derniers jours';

  @override
  String get recentEntries => 'Entrées récentes';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get appearance => 'Apparence';

  @override
  String get themeLabel => 'Thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get language => 'Langue';

  @override
  String get notifications => 'Notifications';

  @override
  String get enableNotifications => 'Activer les notifications';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get rateApp => 'Évaluer l\'application';

  @override
  String get version => 'Version';

  @override
  String get about => 'À propos';

  @override
  String get proTitle => 'PRO';

  @override
  String get proActive => 'PRO — Actif ✓';

  @override
  String get upgradeToProCTA => 'Passer à PRO';

  @override
  String get upgradeSubtitle =>
      'Débloquez la boîte à outils complète de réduction du stress';

  @override
  String get proPrice => 'USD 6,50 paiement unique';

  @override
  String get oneTimePayment => 'Paiement unique • Accès à vie';

  @override
  String get noSubscription => 'Pas d\'abonnement, pas de frais récurrents';

  @override
  String unlockPro(String price) {
    return 'Débloquer PRO — $price';
  }

  @override
  String get restorePurchases => 'Restaurer les achats';

  @override
  String get proThankYou => 'Merci pour votre soutien!';

  @override
  String get youHavePro => 'Vous avez PRO!';

  @override
  String get proFeaturesUnlocked =>
      'Toutes les fonctionnalités PRO sont débloquées.';

  @override
  String get awesome => 'Super!';

  @override
  String get checkingPurchases => 'Vérification des achats...';

  @override
  String get recipeBook => 'Livre de recettes';

  @override
  String get recipes22 => '22 recettes réduisant le cortisol';

  @override
  String get searchRecipes => 'Rechercher des recettes...';

  @override
  String get ingredients => 'Ingrédients';

  @override
  String get instructions => 'Instructions';

  @override
  String get whyItWorks => 'Pourquoi ça marche';

  @override
  String servings(int count) {
    return '$count portions';
  }

  @override
  String prepTime(String time) {
    return 'Prép: $time';
  }

  @override
  String totalTime(String time) {
    return 'Total: $time';
  }

  @override
  String get meditationLibrary => 'Bibliothèque de méditation';

  @override
  String get guidedMeditations => 'Méditations guidées contre le stress';

  @override
  String get appBlocker => 'Bloqueur d\'applications';

  @override
  String get morningFocusMode => 'Mode de concentration matinal';

  @override
  String get enableAppBlocker => 'Activer le bloqueur';

  @override
  String get blockDuration => 'Durée de blocage';

  @override
  String get grantPermission => 'Accorder la permission';

  @override
  String get unlockWithBreathing =>
      'Complétez un exercice de respiration de 5 minutes pour débloquer';

  @override
  String get moodInsights => 'Analyse d\'humeur IA';

  @override
  String get weeklyPatternAnalysis =>
      'Analyse hebdomadaire des tendances d\'humeur';

  @override
  String get stressLevel => 'Niveau de stress';

  @override
  String get avgMood => 'Humeur moyenne';

  @override
  String get trend => 'Tendance';

  @override
  String get weeklyMoodTrend => 'Tendance hebdomadaire de l\'humeur';

  @override
  String get aiDetectedPatterns => 'Modèles détectés par l\'IA';

  @override
  String get weeklyPersonalizedTip => 'Conseil personnalisé hebdomadaire';

  @override
  String get onboarding1Title => 'Bienvenue dans\nCortisol Zero';

  @override
  String get onboarding1Subtitle =>
      'Votre compagnon quotidien pour gérer le stress et construire une vie plus sereine.';

  @override
  String get onboarding2Title => 'Comprendre\nVotre Stress';

  @override
  String get onboarding2Subtitle =>
      'Le cortisol est votre hormone du stress. Lorsqu\'il est chroniquement élevé, il affecte votre santé.';

  @override
  String get onboarding3Title => 'Votre Voyage\nCommence';

  @override
  String get onboarding3Subtitle =>
      'Seulement 5 minutes par jour avec Cortisol Zero peuvent réduire votre stress en quelques semaines.';

  @override
  String get continueButton => 'Continuer';

  @override
  String get getStarted => 'Commencer';

  @override
  String get skip => 'Passer';

  @override
  String get moreTitle => 'Plus';

  @override
  String get toolsSection => 'Outils';

  @override
  String get proFeaturesSection => 'Fonctionnalités PRO';

  @override
  String get unlockCortisolZeroPro => 'Débloquer Cortisol Zero PRO';

  @override
  String get unlock => 'Débloquer';

  @override
  String get save => 'Sauvegarder';

  @override
  String get cancel => 'Annuler';

  @override
  String get close => 'Fermer';

  @override
  String get change => 'Modifier';

  @override
  String get scienceBacked => 'Réducteur de cortisol validé scientifiquement';

  @override
  String get free => 'GRATUIT';

  @override
  String get whatYouGet => 'Ce que vous obtenez';

  @override
  String scheduledAt(String time) {
    return 'Programmé: $time';
  }

  @override
  String get dailyTipBadge => 'Conseil du jour';

  @override
  String get journalLabel => 'Journal';

  @override
  String get featureNutrition => 'Nutrition';

  @override
  String get featureNutritionSub => '20 aliments anti-stress';

  @override
  String get featureSleep => 'Sommeil';

  @override
  String get featureSleepSub => 'Suivre et améliorer';

  @override
  String get nutritionBannerTitle => 'Guide nutrition anti-stress';

  @override
  String get nutritionBannerSub => '20+ aliments réducteurs de cortisol';

  @override
  String minRead(int count) {
    return '$count min de lecture';
  }

  @override
  String get filterAll => 'Tout';

  @override
  String get filterBasics => 'Bases';

  @override
  String get filterScience => 'Science';

  @override
  String get filterImpact => 'Impact';

  @override
  String get filterReduce => 'Réduire';

  @override
  String get filterLifestyle => 'Mode de vie';

  @override
  String get filterNutrition => 'Nutrition';

  @override
  String get filterSleep => 'Sommeil';

  @override
  String get filterMind => 'Esprit';

  @override
  String get catBasics => 'Les bases';

  @override
  String get catScience => 'La science';

  @override
  String get catImpact => 'Impact sur la santé';

  @override
  String get catReduction => 'Conseils de réduction';

  @override
  String get catLifestyle => 'Mode de vie';

  @override
  String get catNutrition => 'Nutrition';

  @override
  String get catSleep => 'Sommeil';

  @override
  String get catExercise => 'Exercice';

  @override
  String get catMindfulness => 'Pleine conscience';

  @override
  String get dailyTip0 =>
      'Prenez 5 respirations profondes maintenant. Chaque longue expiration active le nerf vague et réduit le cortisol en 60 secondes.';

  @override
  String get dailyTip1 =>
      'Buvez un verre d\'eau froide. Une légère déshydratation augmente le cortisol jusqu\'à 33%. L\'hydratation est une gestion du stress.';

  @override
  String get dailyTip2 =>
      'Sortez dehors pendant 10 minutes. La lumière naturelle et la verdure réduisent le cortisol de manière mesurable — même une courte marche fonctionne.';

  @override
  String get dailyTip3 =>
      'Posez votre téléphone pendant 30 minutes. Chaque notification déclenche un micro pic de cortisol. Laissez votre système nerveux se reposer.';

  @override
  String get dailyTip4 =>
      'Mangez une poignée d\'amandes ou de chocolat noir. Le magnésium et les flavanols suppriment directement l\'axe HPA.';

  @override
  String get dailyTip5 =>
      'Notez 3 choses pour lesquelles vous êtes reconnaissant. 5 minutes de gratitude réduisent le cortisol de 23%.';

  @override
  String get dailyTip6 =>
      'Écoutez de la musique calme. La musique à 432Hz réduit le cortisol et ralentit le rythme cardiaque.';

  @override
  String get dailyTip7 =>
      'Passez du temps avec quelqu\'un qui vous est cher. L\'ocytocine du contact social positif inhibe directement le cortisol.';

  @override
  String get dailyTip8 =>
      'Essayez la respiration 4-7-8 avant votre prochaine tâche stressante. Inspirez 4, retenez 7, expirez 8. Tranquillisant naturel.';

  @override
  String get dailyTip9 =>
      'Prenez le petit-déjeuner dans les 90 minutes après le réveil. Sauter le petit-déjeuner provoque des pics de cortisol pour maintenir la glycémie.';

  @override
  String get dailyTip10 =>
      'Fixez un couvre-feu d\'écran 1 heure avant le coucher. La lumière bleue supprime la mélatonine et maintient le cortisol élevé la nuit.';

  @override
  String get dailyTip11 =>
      'Bougez pendant 20 minutes. L\'exercice modéré crée un « dividende de cortisol » — les niveaux descendent sous la ligne de base pendant des heures.';

  @override
  String get dailyTip12 =>
      'Préparez une tasse de camomille ou de thé vert. La L-théanine du thé vert favorise le calme ; l\'apigénine de la camomille se lie aux récepteurs GABA.';

  @override
  String get dailyTip13 =>
      'Pratiquez la relaxation musculaire progressive. Contractez et relâchez chaque groupe musculaire. Cela active directement le système nerveux parasympathique.';

  @override
  String get eduTitle000 => 'Qu\'est-ce que le cortisol ?';

  @override
  String get eduTitle001 => 'Le rythme du cortisol';

  @override
  String get eduTitle002 => 'L\'axe HPA expliqué';

  @override
  String get eduTitle003 => 'Cortisol vs. adrénaline';

  @override
  String get eduTitle004 => 'Comment un cortisol élevé affecte votre corps';

  @override
  String get eduTitle005 => 'Le cortisol et votre humeur';

  @override
  String get eduTitle006 => 'Respiration profonde : la solution la plus rapide';

  @override
  String get eduTitle007 => 'Le pouvoir de la nature';

  @override
  String get eduTitle008 => 'Exercice : le timing compte';

  @override
  String get eduTitle009 => 'La connexion sociale réduit le cortisol';

  @override
  String get eduTitle010 => 'Sommeil et cortisol : le cercle vicieux';

  @override
  String get eduTitle011 => 'Yoga et réponse au stress';

  @override
  String get eduTitle012 =>
      'Méditation de pleine conscience : résultats prouvés';

  @override
  String get eduTitle013 => 'Aliments qui augmentent le cortisol';

  @override
  String get eduTitle014 => 'La connexion intestin-cerveau-cortisol';

  @override
  String get eduTitle015 => 'Magnésium : le minéral anti-stress';

  @override
  String get eduTitle016 => 'Le journal comme médecine du cortisol';

  @override
  String get eduContent000 =>
      'Le cortisol est la principale hormone du stress de votre corps, produite par les glandes surrénales situées au-dessus de vos reins. Souvent appelée « hormone du stress », elle joue un rôle vital dans la réponse combat-fuite.\n\nLorsque vous faites face à une situation stressante, l\'hypothalamus de votre cerveau déclenche une cascade de signaux menant à la libération de cortisol. Cela prépare votre corps à combattre ou fuir — augmentant la fréquence cardiaque, la pression artérielle et la glycémie.\n\nEn quantités saines, le cortisol est essentiel à la vie. Il aide à réguler le métabolisme, réduit l\'inflammation et assiste la formation de la mémoire. Le problème survient lorsque les niveaux restent chroniquement élevés en raison du stress continu.';

  @override
  String get eduContent001 =>
      'Le cortisol suit un rythme quotidien naturel appelé le modèle diurne du cortisol. Les niveaux sont généralement les plus élevés le matin (vers 8h), ce qui vous aide à vous réveiller et à vous sentir alerte. Ils diminuent progressivement au cours de la journée, atteignant leur point le plus bas vers minuit.\n\nC\'est la Réponse d\'Éveil au Cortisol (CAR). Une CAR saine voit le cortisol augmenter de 50-160% dans les 30 minutes suivant le réveil — le réveil naturel de la nature.\n\nLes modes de vie modernes perturbent ce rythme par un mauvais sommeil, le stress chronique, la lumière artificielle la nuit et des horaires de repas irréguliers.';

  @override
  String get eduContent002 =>
      'L\'axe Hypothalamo-Hypophyso-Surrénalien (HPA) est le système central de réponse au stress de votre corps. Voici comment il fonctionne :\n\n1. **L\'hypothalamus** détecte le stress et libère la CRH (hormone de libération de la corticotrophine)\n2. **L\'hypophyse** reçoit la CRH et libère l\'ACTH (hormone adrénocorticotrope)\n3. **Les glandes surrénales** reçoivent l\'ACTH et produisent le cortisol\n4. **Boucle de rétroaction négative** : quand le cortisol est suffisamment élevé, il signale à l\'hypothalamus de ralentir la production\n\nLe stress chronique peut déréguler cette boucle, conduisant à un cortisol persistamment élevé que le corps ne peut plus correctement supprimer.';

  @override
  String get eduContent003 =>
      'Beaucoup confondent le cortisol avec l\'adrénaline (épinéphrine). Bien que les deux soient des hormones du stress, elles fonctionnent différemment :\n\n**L\'adrénaline** est rapide — elle se déclenche en quelques secondes lors du stress aigu, faisant battre votre cœur plus vite. Ses effets s\'estompent rapidement.\n\n**Le cortisol** est lent — il faut des minutes pour se mobiliser mais ses effets durent des heures ou des jours. Il est conçu pour les menaces soutenues, pas soudaines.\n\nLe problème moderne est que nos facteurs de stress psychologiques (délais, circulation, réseaux sociaux) activent continuellement la voie du cortisol — le maintenant élevé comme si nous faisions constamment face à un prédateur.';

  @override
  String get eduContent004 =>
      'Le cortisol chroniquement élevé a des conséquences étendues :\n\n🩺 **Système immunitaire** : supprime la réponse immunitaire, vous rendant plus susceptible aux maladies\n⚖️ **Poids** : favorise le stockage des graisses, surtout la graisse viscérale abdominale\n💤 **Sommeil** : perturbe les cycles de sommeil, causant l\'insomnie\n🧠 **Cerveau** : altère la mémoire et la concentration ; peut rétrécir l\'hippocampe\n❤️ **Cœur** : élève la pression artérielle et augmente le risque cardiovasculaire\n🦴 **Os** : réduit la densité osseuse\n🩸 **Glycémie** : cause la résistance à l\'insuline\n\nLa bonne nouvelle ? Ces effets sont en grande partie réversibles avec une bonne gestion du stress.';

  @override
  String get eduContent005 =>
      'Le lien entre le cortisol et la santé mentale est profond. Un cortisol élevé est associé à :\n\n**L\'anxiété** : le cortisol amplifie la détection des menaces par l\'amygdale, faisant que tout semble plus dangereux.\n\n**La dépression** : un cortisol chroniquement élevé réduit la sérotonine et la dopamine — les neurotransmetteurs du « bien-être ».\n\n**Le brouillard cérébral** : le cortisol entre en compétition avec le glucose dans le cortex préfrontal, altérant la pensée claire.\n\n**La réactivité émotionnelle** : vous devenez plus facilement déclenché par des frustrations mineures.\n\nUn cortisol très bas (fatigue surrénale) peut aussi causer la dépression et une fatigue extrême — l\'équilibre est la clé.';

  @override
  String get eduContent006 =>
      'La respiration profonde diaphragmatique est l\'un des moyens les plus puissants et immédiats de réduire le cortisol. La science :\n\nQuand vous respirez lentement et profondément, vous activez le système nerveux parasympathique — la réponse « repos et digestion » qui contrecarre directement la réponse au stress.\n\nLe nerf vague, qui va de votre cerveau à votre intestin, est stimulé par la respiration profonde. Cela envoie un signal de « sécurité » dans tout votre corps, faisant baisser les niveaux de cortisol en minutes.\n\n**La technique 4-7-8** : inspirez pendant 4 secondes, retenez pendant 7, expirez pendant 8. L\'expiration prolongée est la clé.';

  @override
  String get eduContent007 =>
      'Passer du temps dans la nature est scientifiquement prouvé pour réduire le cortisol. La pratique japonaise « Shinrin-yoku » (bain de forêt) a été largement étudiée :\n\n🌿 Seulement 20 minutes en forêt réduit le cortisol de 15,8%\n🌳 Les espaces verts réduisent à la fois le cortisol salivaire et la fréquence cardiaque\n🌊 Les espaces bleus (environnements aquatiques) ont des effets similaires\n🌸 Même regarder des images de nature réduit les marqueurs de stress\n\nVous n\'avez pas besoin d\'une forêt. Même une marche de 10 minutes dans un parc local, entretenir des plantes ou s\'asseoir près d\'une fenêtre avec vue sur le jardin active l\'effet calmant de la nature.';

  @override
  String get eduContent008 =>
      'L\'exercice est une épée à double tranchant avec le cortisol. Comprendre cela vous aide à optimiser vos entraînements :\n\n**Pendant l\'exercice** : le cortisol augmente pour mobiliser l\'énergie — c\'est sain et normal.\n\n**Après un exercice modéré** : le cortisol chute sous la ligne de base pendant des heures.\n\n**Surentraînement** : l\'exercice excessif de haute intensité maintient le cortisol chroniquement élevé.\n\n**Meilleures pratiques** :\n• Cardio modéré le matin (30-45 min) est optimal\n• Évitez les entraînements intenses tard le soir\n• Intégrez des jours de repos\n• Le yoga et le tai chi sont particulièrement efficaces pour réduire le cortisol';

  @override
  String get eduContent009 =>
      'La connexion humaine est un puissant tampon contre le cortisol. Les recherches montrent :\n\n• **L\'ocytocine** (l\'« hormone du lien ») inhibe directement la libération de cortisol\n• Les personnes avec un fort soutien social ont une réponse de cortisol au stress 25% plus faible\n• Même de brèves interactions sociales positives réduisent le cortisol\n• Avoir un animal de compagnie réduit significativement le cortisol — caresser un chien pendant 10 minutes le réduit de manière mesurable\n• La solitude élève le cortisol — elle est perçue comme une menace de survie\n\nC\'est pourquoi l\'isolement est si physiquement nocif. Votre corps a genuinement besoin de contact social pour réguler sa réponse au stress.';

  @override
  String get eduContent010 =>
      'Le cortisol élevé et le mauvais sommeil forment une boucle de rétroaction dangereuse :\n\n**Cortisol élevé → mauvais sommeil** : le cortisol est stimulant. Quand il est élevé la nuit, il empêche le cerveau d\'atteindre les phases de sommeil profond et réparateur.\n\n**Mauvais sommeil → cortisol élevé** : même une nuit de mauvais sommeil élève le cortisol de 37% le lendemain.\n\n**Comment briser le cycle** :\n✓ Gardez un horaire de sommeil/réveil régulier (même le week-end)\n✓ Évitez les écrans 1 heure avant le coucher\n✓ Gardez votre chambre fraîche (18-20°C est optimal)\n✓ Évitez la caféine après 14h\n✓ Pratiquez une routine de détente avant le coucher';

  @override
  String get eduContent011 =>
      'Le yoga est l\'une des interventions les plus étudiées pour la réduction du cortisol :\n\n**Les études montrent** que 8 semaines de pratique régulière de yoga réduisent le cortisol matinal jusqu\'à 30%.\n\n**Pourquoi le yoga fonctionne** :\n• Combine respiration, mouvement et pleine conscience — triple effet réducteur de cortisol\n• Active le système nerveux parasympathique par la respiration consciente\n• Réduit la réactivité de l\'amygdale\n• Améliore les niveaux de GABA — le neurotransmetteur calmant du cerveau\n\n**Meilleurs styles pour le cortisol** : Hatha, Yin, Restauratif et Yoga Nidra sont particulièrement efficaces.';

  @override
  String get eduContent012 =>
      'La Réduction du Stress Basée sur la Pleine Conscience (MBSR) a été rigoureusement étudiée depuis les années 1970. Les résultats sont convaincants :\n\n🧪 **8 semaines** de MBSR réduit le cortisol de 20-25%\n🧠 **Change la structure cérébrale** : développe le cortex préfrontal (pensée rationnelle) tout en réduisant l\'amygdale (centre de la peur)\n💊 **Équivalent aux médicaments** pour l\'anxiété légère-modérée dans plusieurs essais\n❤️ **Réduit les marqueurs d\'inflammation** (CRP, IL-6) liés au cortisol\n\nVous n\'avez pas besoin d\'heures. La recherche montre que **10 minutes par jour** de pleine conscience produisent des réductions mesurables de cortisol en 4 semaines.';

  @override
  String get eduContent013 =>
      'Votre alimentation influence directement le cortisol. Ces aliments peuvent faire monter les hormones du stress :\n\n☕ **Caféine** : élève le cortisol de 30% même chez les buveurs de café habituels. Attendez 90 minutes après le réveil avant votre première tasse.\n\n🍬 **Pics de sucre** : les fluctuations rapides de glucose déclenchent la libération de cortisol. Choisissez des aliments à faible indice glycémique.\n\n🥃 **Alcool** : initialement sédatif, l\'alcool perturbe l\'architecture du sommeil et élève le cortisol le lendemain.\n\n🔥 **Aliments inflammatoires** : les graisses trans et les aliments ultra-transformés augmentent l\'inflammation systémique, qui élève le cortisol.\n\n🧂 **Excès de sodium** : un régime riche en sodium est lié à des niveaux élevés de cortisol.';

  @override
  String get eduContent014 =>
      'Votre microbiome intestinal a une ligne directe avec votre réponse au stress — l\'axe intestin-cerveau :\n\n🦠 **Les bactéries intestinales produisent des neurotransmetteurs** : 90% de la sérotonine est produite dans l\'intestin. Une flore intestinale déséquilibrée signifie moins de sérotonine.\n\n🔗 **Le nerf vague** connecte l\'intestin au cerveau — l\'inflammation intestinale active directement l\'axe HPA.\n\n🥛 **Les probiotiques réduisent le cortisol** : les études montrent que les suppléments de Lactobacillus rhamnosus réduisent l\'anxiété et la réponse de cortisol au stress.\n\n**Aliments pour un microbiome sain** :\n• Aliments fermentés (kéfir, yaourt, kimchi, choucroute)\n• Fibres prébiotiques (ail, oignons, avoine, bananes)\n• Aliments riches en polyphénols (baies, chocolat noir, thé vert)';

  @override
  String get eduContent015 =>
      'Le magnésium est souvent appelé « le tranquillisant de la nature » — et pour cause :\n\n**La connexion avec le cortisol** : le magnésium régule l\'axe HPA. La carence permet au cortisol de fonctionner sans contrôle, tandis qu\'un magnésium adéquat freine la libération excessive.\n\n**L\'épidémie de carence** : jusqu\'à 68% des Américains manquent de magnésium. Le stress chronique épuise le magnésium — créant un cercle vicieux.\n\n**Signes de carence** : anxiété, tension musculaire, mauvais sommeil, irritabilité, maux de tête, envies de sucre.\n\n**Meilleures sources alimentaires** : légumes verts à feuilles foncées, graines de citrouille, amandes, avocat, chocolat noir, légumineuses, grains entiers.\n\n**Supplémentation** : le glycinate de magnésium et le thréonate de magnésium ont la meilleure absorption.';

  @override
  String get eduContent016 =>
      'Écrire sur vos émotions est cliniquement prouvé pour réduire le cortisol :\n\n📝 **L\'écriture expressive** (écrire sur des expériences stressantes) réduit la réponse de cortisol lors de situations stressantes ultérieures\n\n🧠 **Pourquoi ça fonctionne** : écrire active le cortex préfrontal (cerveau rationnel), qui peut réguler l\'amygdale (cerveau émotionnel) — fermant le robinet du cortisol\n\n💙 **Le journal de gratitude** est particulièrement puissant : même une brève écriture quotidienne de gratitude réduit le cortisol de 23% (recherche UCDavis)\n\n**Pour commencer** : juste 15 minutes, 3 jours par semaine. Ne modifiez pas, écrivez simplement. Concentrez-vous sur ce qui s\'est passé et comment vous vous êtes senti.\n\nLa fonction journal de cette app est conçue exactement dans ce but.';

  @override
  String get nutFilterAll => 'Tout';

  @override
  String get nutFilterFruits => 'Fruits';

  @override
  String get nutFilterVegetables => 'Légumes';

  @override
  String get nutFilterProteins => 'Protéines';

  @override
  String get nutFilterBeverages => 'Boissons';

  @override
  String get nutFilterNutsSeeds => 'Noix et graines';

  @override
  String get nutFilterGrains => 'Céréales';

  @override
  String get nutFilterDairy => 'Produits laitiers';

  @override
  String get nutFilterSpices => 'Épices';

  @override
  String get nutCatFruits => 'Fruits';

  @override
  String get nutCatVegetables => 'Légumes';

  @override
  String get nutCatProteins => 'Protéines';

  @override
  String get nutCatBeverages => 'Boissons';

  @override
  String get nutCatNutsSeeds => 'Noix et graines';

  @override
  String get nutCatGrains => 'Céréales';

  @override
  String get nutCatDairy => 'Produits laitiers';

  @override
  String get nutCatSpices => 'Épices';

  @override
  String get foodName000 => 'Myrtilles';

  @override
  String get foodBenefit000 =>
      'De puissants antioxydants réduisent le stress oxydatif';

  @override
  String get foodMechanism000 =>
      'Riches en anthocyanines qui traversent la barrière hémato-encéphalique, réduisant la neuro-inflammation et les dommages oxydatifs induits par le cortisol. Des études montrent que l\'extrait de myrtille réduit la réponse au cortisol après un stress aigu.';

  @override
  String get foodServing000 =>
      'Ajoutez une poignée dans des flocons d\'avoine préparés la veille ou mélangez dans un smoothie';

  @override
  String get foodNutrients000 => 'Vitamin C, Anthocyanins, Fiber, Vitamin K';

  @override
  String get foodName001 => 'Bananes';

  @override
  String get foodBenefit001 =>
      'Le potassium abaisse la tension artérielle ; le tryptophane stimule la sérotonine';

  @override
  String get foodMechanism001 =>
      'Les bananes contiennent du tryptophane, un précurseur de la sérotonine — le neurotransmetteur calmant qui module le cortisol. Le potassium contrecarre l\'effet du cortisol sur la tension artérielle. Les sucres naturels fournissent une énergie rapide sans pic de cortisol.';

  @override
  String get foodServing001 =>
      'Tranchez sur une tartine au beurre d\'amande pour un en-cas parfait anti-stress';

  @override
  String get foodNutrients001 => 'Potassium, Tryptophan, Vitamin B6, Magnesium';

  @override
  String get foodName002 => 'Oranges';

  @override
  String get foodBenefit002 =>
      'La forte teneur en vitamine C réduit directement le cortisol';

  @override
  String get foodMechanism002 =>
      'La vitamine C est rapidement consommée par les glandes surrénales lors de la production de cortisol. La supplémentation en vitamine C réduit la réponse au cortisol face aux facteurs de stress psychologiques. Une étude allemande de 2001 a constaté que 1000 mg de vitamine C réduisaient le cortisol et la tension artérielle lors de tests de prise de parole en public.';

  @override
  String get foodServing002 =>
      'Mangez le fruit entier (pas le jus) pour les bénéfices des fibres ; consommez avant des événements stressants';

  @override
  String get foodNutrients002 => 'Vitamin C, Folate, Potassium, Flavonoids';

  @override
  String get foodName003 => 'Avocats';

  @override
  String get foodBenefit003 =>
      'Les graisses saines réduisent l\'inflammation liée au stress';

  @override
  String get foodMechanism003 =>
      'Les avocats sont riches en graisses monoinsaturées qui soutiennent la santé des surrénales et réduisent les cytokines inflammatoires liées à l\'activation de l\'axe HPA. Les vitamines B (B5, B6) soutiennent la production d\'hormones surrénales. Le magnésium module directement l\'axe HPA.';

  @override
  String get foodServing003 =>
      'Garnissez le saumon ou les œufs d\'avocat en tranches ; ajoutez aux smoothies pour l\'onctuosité';

  @override
  String get foodNutrients003 =>
      'Magnesium, B5 (Pantothenic Acid), B6, Monounsaturated Fats, Potassium';

  @override
  String get foodName004 => 'Épinards';

  @override
  String get foodBenefit004 => 'Riche en magnésium — le tranquillisant naturel';

  @override
  String get foodMechanism004 =>
      'Les épinards sont l\'une des sources alimentaires les plus riches en magnésium, qui régule l\'axe HPA et inhibe la libération excessive de cortisol. La carence en magnésium est directement liée à un cortisol élevé. Le folate des épinards soutient également la production de GABA — le neurotransmetteur calmant du cerveau.';

  @override
  String get foodServing004 =>
      'Faites sauter avec de l\'ail en accompagnement ou mixez cru dans les smoothies du matin (le goût est masqué)';

  @override
  String get foodNutrients004 =>
      'Magnesium, Folate, Iron, Vitamin K, Vitamin C';

  @override
  String get foodName005 => 'Patates douces';

  @override
  String get foodBenefit005 =>
      'L\'énergie soutenue prévient les pics de cortisol liés aux chutes de glycémie';

  @override
  String get foodMechanism005 =>
      'Les patates douces fournissent des glucides complexes à libération lente qui préviennent les chutes de glycémie qui déclenchent la libération de cortisol. Les variétés violettes sont particulièrement riches en anthocyanines. La teneur élevée en potassium aide à contrecarrer les effets du cortisol sur la tension artérielle.';

  @override
  String get foodServing005 =>
      'Rôtissez avec de l\'huile d\'olive et de la cannelle ; écrasez en accompagnement ou base pour des Buddha bowls';

  @override
  String get foodNutrients005 =>
      'Potassium, Vitamin A, Fiber, Vitamin C, Manganese';

  @override
  String get foodName006 => 'Brocoli';

  @override
  String get foodBenefit006 =>
      'Le sulforaphane protège contre les dommages cérébraux induits par le stress';

  @override
  String get foodMechanism006 =>
      'Le sulforaphane du brocoli active le Nrf2 — l\'interrupteur maître antioxydant du corps — protégeant les neurones du stress oxydatif induit par le cortisol. Le brocoli est également riche en vitamine C, magnésium et folate, tous des modulateurs directs du cortisol.';

  @override
  String get foodServing006 =>
      'Cuisez légèrement à la vapeur pour préserver le sulforaphane ; arrosez de citron et d\'huile d\'olive';

  @override
  String get foodNutrients006 =>
      'Sulforaphane, Vitamin C, Folate, Calcium, Fiber';

  @override
  String get foodName007 => 'Saumon';

  @override
  String get foodBenefit007 =>
      'Les graisses oméga-3 suppriment directement la production de cortisol';

  @override
  String get foodMechanism007 =>
      'L\'EPA et le DHA (acides gras oméga-3) du saumon réduisent le cortisol de deux façons : ils diminuent la libération hypothalamique de CRH et réduisent la neuro-inflammation qui amplifie les réponses au stress. Les études montrent que la consommation régulière d\'oméga-3 réduit la réactivité au cortisol jusqu\'à 22%.';

  @override
  String get foodServing007 =>
      'Faites cuire au four avec du citron et des herbes 2-3 fois par semaine ; accompagnez de légumes à feuilles et d\'avocat';

  @override
  String get foodNutrients007 =>
      'EPA/DHA Omega-3, Vitamin D, B12, Selenium, Protein';

  @override
  String get foodName008 => 'Dinde';

  @override
  String get foodBenefit008 =>
      'Le tryptophane élève la sérotonine pour tamponner le stress';

  @override
  String get foodMechanism008 =>
      'La dinde est exceptionnellement riche en tryptophane, que le corps convertit en sérotonine et mélatonine. La sérotonine module la libération de cortisol et favorise la régulation émotionnelle. Les vitamines B de la dinde soutiennent également la fonction surrénale.';

  @override
  String get foodServing008 =>
      'Tranchez pour des wraps avec de l\'avocat et des épinards ; ajoutez aux salades comme protéine maigre';

  @override
  String get foodNutrients008 => 'Tryptophan, B3 (Niacin), B6, Selenium, Zinc';

  @override
  String get foodName009 => 'Œufs';

  @override
  String get foodBenefit009 =>
      'La protéine complète avec la choline soutient la réponse cérébrale au stress';

  @override
  String get foodMechanism009 =>
      'Les œufs contiennent de la choline, essentielle à la production d\'acétylcholine — le neurotransmetteur qui régule le système nerveux parasympathique (repos). La phosphatidylsérine dans les jaunes d\'œufs s\'est avérée réduire la réponse au cortisol à l\'exercice jusqu\'à 30%.';

  @override
  String get foodServing009 =>
      'Brouillés avec des épinards et du curcuma ; cuisez durs pour des collations transportables';

  @override
  String get foodNutrients009 =>
      'Choline, Phosphatidylserine, B12, Vitamin D, Tryptophan';

  @override
  String get foodName010 => 'Thé vert';

  @override
  String get foodBenefit010 =>
      'La L-théanine favorise la vigilance calme sans pic de cortisol';

  @override
  String get foodMechanism010 =>
      'La L-théanine, propre aux feuilles de thé, augmente les ondes cérébrales alpha (associées à une concentration détendue) et favorise la production de GABA. Elle contrecarre l\'effet élévateur de cortisol de la caféine, réduisant la réponse au stress tout en maintenant la clarté mentale.';

  @override
  String get foodServing010 =>
      'Buvez 2-3 tasses par jour ; préparez à 80°C (pas bouillant) pour préserver la L-théanine';

  @override
  String get foodNutrients010 =>
      'L-theanine, EGCG (catechins), Caffeine (low), Antioxidants';

  @override
  String get foodName011 => 'Thé à la camomille';

  @override
  String get foodBenefit011 =>
      'L\'apigénine se lie aux récepteurs GABA pour réduire l\'anxiété';

  @override
  String get foodMechanism011 =>
      'La camomille contient de l\'apigénine, un flavonoïde qui se lie aux récepteurs GABA dans le cerveau — les mêmes récepteurs ciblés par les médicaments anxiolytiques, mais avec un effet doux et naturel. Une consommation régulière réduit les niveaux de cortisol et améliore la qualité du sommeil.';

  @override
  String get foodServing011 =>
      'Buvez 1-2 tasses avant de dormir dans le cadre d\'un rituel de détente';

  @override
  String get foodNutrients011 =>
      'Apigenin, Bisabolol, Chamazulene, Antioxidants';

  @override
  String get foodName012 => 'Amandes';

  @override
  String get foodBenefit012 =>
      'Magnésium + vitamine E protègent contre les dommages liés au stress';

  @override
  String get foodMechanism012 =>
      'Les amandes apportent 20% du magnésium journalier par once — amortissant directement la suractivité de l\'axe HPA. La vitamine E est un antioxydant qui protège les cellules surrénales des dommages des radicaux libres causés par la production chronique de cortisol.';

  @override
  String get foodServing012 =>
      'Une petite poignée (23 amandes) comme collation en milieu de matinée ; ajoutez au porridge';

  @override
  String get foodNutrients012 =>
      'Magnesium, Vitamin E, Monounsaturated Fats, Protein, Fiber';

  @override
  String get foodName013 => 'Graines de citrouille';

  @override
  String get foodBenefit013 =>
      'La carence en zinc est liée à un cortisol élevé — les graines de citrouille en sont la source la plus riche';

  @override
  String get foodMechanism013 =>
      'Le zinc est un cofacteur essentiel dans la boucle de rétroaction négative qui arrête la production de cortisol. La carence en zinc entraîne un cortisol chroniquement élevé. Les graines de citrouille sont la source végétale la plus riche en zinc, et contiennent également du tryptophane et du magnésium.';

  @override
  String get foodServing013 =>
      'Faites griller et ajoutez aux salades, soupes ou mélanges trail ; incorporez au porridge';

  @override
  String get foodNutrients013 =>
      'Zinc, Tryptophan, Magnesium, Phosphorus, Manganese';

  @override
  String get foodName014 => 'Flocons d\'avoine';

  @override
  String get foodBenefit014 =>
      'Les glucides complexes stabilisent la glycémie et élèvent la sérotonine';

  @override
  String get foodMechanism014 =>
      'Les flocons d\'avoine fournissent des glucides complexes qui déclenchent la production de sérotonine (les glucides augmentent l\'absorption du tryptophane dans le cerveau). La fibre de bêta-glucane favorise un microbiome intestinal sain, qui soutient l\'axe intestin-cerveau pour la régulation du cortisol. Ils préviennent les chutes de glycémie qui déclenchent le cortisol.';

  @override
  String get foodServing014 =>
      'Préparez des flocons d\'avoine la veille avec des myrtilles, des noix et du miel';

  @override
  String get foodNutrients014 =>
      'Beta-glucan, B1 (Thiamine), Magnesium, Zinc, Fiber';

  @override
  String get foodName015 => 'Quinoa';

  @override
  String get foodBenefit015 =>
      'Protéine complète avec tous les acides aminés essentiels pour la production de neurotransmetteurs';

  @override
  String get foodMechanism015 =>
      'Le quinoa est une protéine complète contenant les 9 acides aminés essentiels, dont le tryptophane et la tyrosine — précurseurs respectivement de la sérotonine et de la dopamine. Son faible indice glycémique prévient les fluctuations de glycémie qui déclenchent la libération de cortisol.';

  @override
  String get foodServing015 =>
      'Utilisez comme base pour des Buddha bowls ou des salades méditerranéennes';

  @override
  String get foodNutrients015 =>
      'Complete Protein, Magnesium, Iron, Fiber, Riboflavin';

  @override
  String get foodName016 => 'Yaourt grec';

  @override
  String get foodBenefit016 =>
      'Les probiotiques soutiennent l\'axe intestin-cerveau pour la régulation du cortisol';

  @override
  String get foodMechanism016 =>
      'Le yaourt grec est riche en souches Lactobacillus et Bifidobacterium qui produisent du GABA directement dans l\'intestin. La recherche montre que la supplémentation en probiotiques réduit le cortisol et l\'anxiété dans les études cliniques. La teneur élevée en protéines soutient la satiété et une glycémie stable.';

  @override
  String get foodServing016 =>
      'Garnissez de myrtilles et de graines de citrouille pour un petit-déjeuner complet anti-stress';

  @override
  String get foodNutrients016 =>
      'Probiotics, Protein, Calcium, B12, Tryptophan';

  @override
  String get foodName017 => 'Kéfir';

  @override
  String get foodBenefit017 =>
      'L\'aliment le plus dense en probiotiques — réduit directement le cortisol via l\'axe intestinal';

  @override
  String get foodMechanism017 =>
      'Le kéfir contient jusqu\'à 61 souches de bactéries bénéfiques — bien plus que le yaourt. Les études montrent que la consommation de kéfir réduit le cortisol en modulant la connexion microbiome intestinal-cerveau. La teneur en tryptophane stimule également la sérotonine.';

  @override
  String get foodServing017 =>
      'Buvez nature ou mélangez dans des smoothies ; utilisez comme base pour des smoothie bowls';

  @override
  String get foodNutrients017 =>
      'Probiotics (61 strains), Tryptophan, Calcium, B12, K2';

  @override
  String get foodName018 => 'Curcuma';

  @override
  String get foodBenefit018 =>
      'La curcumine est aussi efficace que les antidépresseurs dans plusieurs essais';

  @override
  String get foodMechanism018 =>
      'La curcumine du curcuma inhibe les cytokines inflammatoires (IL-6, TNF-alpha) qui activent l\'axe HPA. Elle élève également le BDNF (facteur neurotrophique dérivé du cerveau), protégeant les neurones des dommages du cortisol. Plusieurs essais montrent que la curcumine réduit le cortisol et la dépression aussi efficacement que certains médicaments.';

  @override
  String get foodServing018 =>
      'Lait doré avant de dormir : lait chaud + curcuma + poivre noir + miel';

  @override
  String get foodNutrients018 =>
      'Curcumin, Iron, Manganese, Anti-inflammatory compounds';

  @override
  String get foodName019 => 'Chocolat noir (70%+)';

  @override
  String get foodBenefit019 =>
      'Réduit directement le cortisol et l\'adrénaline — prouvé dans des essais cliniques';

  @override
  String get foodMechanism019 =>
      'Une étude marquante de 2009 a constaté que manger 40 g de chocolat noir quotidiennement pendant 2 semaines réduisait le cortisol et les catécholamines de façon significative. La teneur en magnésium module l\'axe HPA ; les flavanols augmentent le BDNF et protègent contre les dommages neuronaux induits par le stress. La théobromine fournit une énergie calme.';

  @override
  String get foodServing019 =>
      '1-2 carrés (40 g) après le déjeuner ; recherchez une teneur en cacao de 70%+';

  @override
  String get foodNutrients019 =>
      'Magnesium, Flavanols, Theobromine, Iron, Zinc';

  @override
  String get breathTechBelly => 'Respiration abdominale';

  @override
  String get breathTechBox => 'Respiration carrée';

  @override
  String get breathTech478 => 'Respiration 4-7-8';

  @override
  String get breathDescBelly =>
      'La base de toutes les techniques de respiration. Aussi appelée respiration diaphragmatique, elle active immédiatement votre système nerveux parasympathique. Parfaite pour les débutants ou toute personne ayant besoin d\'une réinitialisation rapide du stress.';

  @override
  String get breathDescBox =>
      'Utilisée par les Navy SEALs et les athlètes d\'élite pour maintenir le calme sous pression extrême. Les phases de durée égale créent un motif en \"boîte\" qui réinitialise rapidement le système nerveux. Excellente pour la concentration.';

  @override
  String get breathDesc478 =>
      'Développée par le Dr Andrew Weil basée sur les traditions de pranayama yogique. L\'expiration prolongée (8 temps) active le frein vagal sur la réponse au stress. Le Dr Weil l\'appelle \"un tranquillisant naturel pour le système nerveux\".';

  @override
  String get breathInstrBellyInhale =>
      'Inspirez lentement par le nez, en remplissant votre ventre';

  @override
  String get breathInstrBellyExhale =>
      'Expirez lentement par la bouche, en vidant votre ventre';

  @override
  String get breathInstrBoxInhale =>
      'Inspirez lentement par le nez, en comptant jusqu\'à 4';

  @override
  String get breathInstrBoxHoldFull =>
      'Retenez doucement — poumons pleins, corps détendu';

  @override
  String get breathInstrBoxExhale =>
      'Expirez complètement par la bouche, en comptant jusqu\'à 4';

  @override
  String get breathInstrBoxHoldEmpty =>
      'Retenez doucement — poumons vides, corps détendu';

  @override
  String get breathInstr478Inhale =>
      'Inspirez silencieusement par le nez pendant 4 temps';

  @override
  String get breathInstr478Hold =>
      'Retenez complètement votre souffle pendant 7 temps';

  @override
  String get breathInstr478Exhale =>
      'Expirez complètement par la bouche avec un son de souffle pendant 8 temps';

  @override
  String get breathBenefitBelly1 => 'Active le système nerveux parasympathique';

  @override
  String get breathBenefitBelly2 => 'Réduit le cortisol en quelques minutes';

  @override
  String get breathBenefitBelly3 =>
      'Diminue la fréquence cardiaque et la pression artérielle';

  @override
  String get breathBenefitBelly4 => 'Améliore l\'échange d\'oxygène';

  @override
  String get breathBenefitBox1 => 'Réduction rapide du stress et de l\'anxiété';

  @override
  String get breathBenefitBox2 => 'Améliore la concentration et l\'attention';

  @override
  String get breathBenefitBox3 =>
      'Utilisé par les Navy SEALs et les sportifs d\'élite';

  @override
  String get breathBenefitBox4 => 'Équilibre les niveaux de CO2 et O2';

  @override
  String get breathBenefitBox5 => 'Réduit la réponse au cortisol';

  @override
  String get breathBenefit4781 => 'Effet tranquillisant naturel';

  @override
  String get breathBenefit4782 => 'Réduit l\'anxiété aiguë en minutes';

  @override
  String get breathBenefit4783 => 'Active le nerf vague';

  @override
  String get breathBenefit4784 =>
      'Aide contre l\'insomnie — à faire avant le coucher';

  @override
  String get breathBenefit4785 =>
      'Gère les envies de nourriture liées au stress';

  @override
  String get breathBenefit4786 => 'Basé sur le pranayama yogique ancestral';

  @override
  String get durationMin => 'min';

  @override
  String get durationSec => 'sec';

  @override
  String get appBlockerSubtitle =>
      'Bloquez les applications stressantes pendant votre routine matinale';

  @override
  String get compEducation => 'Module éducatif';

  @override
  String get compBreathing => 'Exercices de respiration (3)';

  @override
  String get compSoundscapes => 'Ambiances sonores (5)';

  @override
  String get compNutrition => 'Guide nutritionnel';

  @override
  String get compJournal => 'Journal d\'humeur';

  @override
  String get compSleep => 'Suivi du sommeil';

  @override
  String get compMeditation => 'Bibliothèque de méditations guidées';

  @override
  String get compRecipes => 'Livre de recettes (22 recettes)';

  @override
  String get compAppBlocker => 'Bloqueur d\'apps / Mode focus';

  @override
  String get compAiInsights => 'Analyses d\'humeur IA';

  @override
  String get compWeeklyAnalysis => 'Analyse des tendances hebdomadaires';

  @override
  String get blockerHeroText =>
      'Les 2 premières heures après le réveil ont les niveaux de cortisol les plus élevés. Éviter les applis stressantes (réseaux sociaux, actualités) améliore considérablement votre journée.';

  @override
  String blockerActiveStatus(Object hours) {
    return 'Actif — ${hours}h après le réveil';
  }

  @override
  String get blockerInactive => 'Inactif';

  @override
  String blockerDurationLabel(Object hours) {
    return 'Durée du blocage : $hours heures';
  }

  @override
  String get thisWeek => 'Cette semaine';

  @override
  String get sevenDayAverage => 'Moyenne sur 7 jours';

  @override
  String get vsLastWeek => 'vs semaine dernière';

  @override
  String get stressLow => 'Faible';

  @override
  String get stressModerate => 'Modéré';

  @override
  String get stressHigh => 'Élevé';

  @override
  String get dayMon => 'Lun';

  @override
  String get dayTue => 'Mar';

  @override
  String get dayWed => 'Mer';

  @override
  String get dayThu => 'Jeu';

  @override
  String get dayFri => 'Ven';

  @override
  String get daySat => 'Sam';

  @override
  String get daySun => 'Dim';

  @override
  String get moodPattern1obs => 'Votre humeur tend à baisser le mercredi';

  @override
  String get moodPattern1tip =>
      'Essayez de planifier une séance de respiration de 5 minutes le mercredi matin pour devancer le pic de stress de milieu de semaine.';

  @override
  String get moodPattern2obs =>
      'Vous vous sentez toujours mieux le vendredi et le week-end';

  @override
  String get moodPattern2tip =>
      'Cela suggère que le stress professionnel est le facteur principal. Le bloqueur d\'applis et la routine de respiration matinale peuvent aider.';

  @override
  String get moodPattern3obs =>
      'Une humeur plus basse corrèle avec des nuits de moins de 7 heures de sommeil';

  @override
  String get moodPattern3tip =>
      'Se coucher régulièrement à 22h30 et utiliser la recette de Latte à la Camomille pourrait améliorer votre humeur de base.';

  @override
  String get weeklyTipText =>
      'D\'après vos tendances d\'humeur, votre cortisol est probablement le plus élevé les mardis et mercredis matin. Essayez l\'exercice de respiration 4-7-8 avant votre première tâche ces jours-là. Vos entrées de journal suggèrent une meilleure humeur quand vous faites de l\'exercice — envisagez 20 minutes d\'activité modérée avant 10h.';

  @override
  String playingMeditation(Object title) {
    return 'Lecture : $title';
  }

  @override
  String get medTitle1 => 'Réinitialisation matinale du cortisol';

  @override
  String get medDesc1 =>
      'Commencez votre journée en régulant votre réponse cortisolique au réveil.';

  @override
  String get medCat1 => 'Matin';

  @override
  String get medTitle2 => 'Préparation au sommeil';

  @override
  String get medDesc2 =>
      'Détendez votre système nerveux pour un sommeil profond et réparateur.';

  @override
  String get medCat2 => 'Sommeil';

  @override
  String get medTitle3 => 'Soulagement de l\'anxiété';

  @override
  String get medDesc3 =>
      'Interrompez le cycle de stress avec des techniques MBSR.';

  @override
  String get medCat3 => 'Anxiété';

  @override
  String get medTitle4 => 'Concentration profonde';

  @override
  String get medDesc4 =>
      'Réduisez le cortisol en entrant dans un état de productivité calme.';

  @override
  String get medCat4 => 'Concentration';

  @override
  String get medTitle5 => 'Scan corporel';

  @override
  String get medDesc5 =>
      'Libérez la tension physique accumulée par le stress chronique.';

  @override
  String get medCat5 => 'Corps';

  @override
  String get filterBreakfast => 'Petit-déjeuner';

  @override
  String get filterSmoothies => 'Smoothies';

  @override
  String get filterSalads => 'Salades';

  @override
  String get filterMains => 'Plats';

  @override
  String get filterSnacks => 'Collations';

  @override
  String get filterDrinks => 'Boissons';

  @override
  String get filterDesserts => 'Desserts';

  @override
  String get moreJournalSub => 'Suivez votre humeur quotidienne';

  @override
  String get moreSleepSub => 'Surveillez la qualité de votre sommeil';

  @override
  String get moreSettingsSub => 'Thème, langue, notifications';

  @override
  String unlockProButton(Object price) {
    return 'Débloquer PRO — $price';
  }

  @override
  String get paymentDisclaimer =>
      'Paiement traité par Google Play. Achat unique. Sans abonnement.';

  @override
  String get proThankYouSnackbar =>
      'Merci ! Toutes les fonctionnalités PRO sont débloquées.';

  @override
  String get cortisolZeroPro => 'Cortisol Zero PRO';

  @override
  String get proBannerDescription =>
      'Recettes, méditation, bloqueur d\'applis, analyses IA — 6,50 \$ unique';

  @override
  String get aiDemoDataNotice =>
      'Ceci est un aperçu de démonstration. Commencez à enregistrer votre humeur quotidienne pour voir des analyses IA personnalisées.';

  @override
  String get aiDemoLabel => 'Données démo';

  @override
  String get recipeWhyItWorks => 'Pourquoi ça marche';

  @override
  String get recipeIngredients => 'Ingrédients';

  @override
  String get recipeInstructions => 'Instructions';

  @override
  String recipeServings(int count) {
    return '$count portions';
  }

  @override
  String get blockedAppsTitle => 'Apps bloquées';

  @override
  String get blockerAddApps => 'Ajouter';

  @override
  String get blockerNoAppsSelected =>
      'Aucune app sélectionnée. Appuyez sur Ajouter pour choisir les apps à bloquer le matin.';

  @override
  String get blockerSelectApps => 'Sélectionner les apps à bloquer';

  @override
  String get blockerSearchApps => 'Rechercher des apps...';

  @override
  String get blockerLoadingApps => 'Chargement des apps installées...';

  @override
  String get blockerStartButton => 'Démarrer le blocage';

  @override
  String get blockerStopButton => 'Arrêter le blocage';

  @override
  String get blockerPermUsageStats => 'Accès aux données d\'utilisation';

  @override
  String get blockerPermOverlay => 'Afficher par-dessus les autres apps';

  @override
  String get blockerRefreshPerms => 'Actualiser les permissions';

  @override
  String get proActivatedMessage =>
      'Toutes les fonctionnalités PRO sont déverrouillées et seront activées dans quelques secondes.';

  @override
  String get permOnboardingTitle => 'Configurer les permissions';

  @override
  String get permStepUsageTitle => 'Accès aux données d\'utilisation';

  @override
  String get permStepUsageDesc =>
      'Autorisez-nous à voir quand vous ouvrez une source de stress. C\'est nécessaire pour activer le bloqueur.';

  @override
  String get permStepUsageButton => 'Ouvrir les paramètres d\'utilisation';

  @override
  String get permStepOverlayTitle => 'Affichage par-dessus les apps';

  @override
  String get permStepOverlayDesc =>
      'Autorisez-nous à couvrir la source de stress. Cela nous permettra d\'afficher un écran apaisant à la place de l\'app bloquée.';

  @override
  String get permStepOverlayButton => 'Ouvrir les paramètres de superposition';

  @override
  String get permStepGranted => 'Permission accordée';

  @override
  String get permNextStep => 'Étape suivante';

  @override
  String get permAllDone => 'Tout est prêt — allons-y !';

  @override
  String get permBackToStep1 => 'Retour à l\'étape 1';

  @override
  String get permStepUsageLottieHint =>
      'Trouvez Cortisol Zero dans la liste et activez l\'accès';

  @override
  String get permStepOverlayLottieHint =>
      'Activez l\'interrupteur pour autoriser l\'affichage en superposition';

  @override
  String get permSetupRequired => 'Configuration requise';

  @override
  String get permSetupRequiredDesc =>
      'Pour bloquer des apps, nous avons besoin de trois permissions. Appuyez ci-dessous pour les configurer.';

  @override
  String get permStepAccessibilityTitle => 'Service d\'accessibilité';

  @override
  String get permStepAccessibilityDesc =>
      'Cortisol Zero utilise le Service d\'accessibilité Android uniquement pour détecter quelle app est affichée à l\'écran (par nom de paquet). Il n\'accède PAS aux messages, mots de passe, données financières ou informations personnelles. Tout le traitement est local sur votre appareil et n\'est jamais stocké ni transmis.';

  @override
  String get permStepAccessibilityButton =>
      'Ouvrir les paramètres d\'accessibilité';

  @override
  String get permStepAccessibilityLottieHint =>
      'Trouvez Cortisol Zero dans la liste des apps installées et activez-le';

  @override
  String get blockerPermAccessibility => 'Service d\'accessibilité';

  @override
  String get permBackToStep2 => 'Retour à l\'étape 2';

  @override
  String get permDisclosureAccesses => 'Ce à quoi il accède';

  @override
  String get permDisclosureAccessesDesc =>
      'Quelle application est actuellement à l\'écran (nom du paquet uniquement)';

  @override
  String get permDisclosureNotAccesses => 'Ce à quoi il N\'accède PAS';

  @override
  String get permDisclosureNotAccessesDesc =>
      'Messages, mots de passe, données financières, informations personnelles, historique de navigation, contacts';

  @override
  String get permDisclosureDataUsage => 'Comment les données sont utilisées';

  @override
  String get permDisclosureDataUsageDesc =>
      'Toute la détection est locale sur votre appareil. Rien n\'est stocké ni transmis.';

  @override
  String get permUnderstandContinue => 'Je comprends et continue';

  @override
  String get moodInsights3DayTitle => 'Aperçu rapide sur 3 jours';

  @override
  String get moodInsightsWeeklyTitle => 'Analyse des tendances hebdomadaires';

  @override
  String get moodInsightsRetry => 'Relancer l\'analyse';

  @override
  String get moodInsightsError => 'Analyse échouée. Veuillez réessayer.';

  @override
  String get moodInsightsNotEnoughData =>
      'Ajoutez au moins 2 entrées d\'humeur pour voir les aperçus';

  @override
  String get privacyOverviewTitle => 'Comment nous gérons vos données';

  @override
  String get privacyOverviewBody =>
      'Cortisol Zero a besoin de 3 autorisations pour bloquer les applications stressantes. Tout le traitement se fait localement sur votre appareil. Nous ne collectons, ne stockons, ni n\'envoyons aucune donnée à des serveurs. Nous n\'avons pas de comptes utilisateurs ni d\'analyses.';

  @override
  String get privacyOverviewAccept => 'J\'accepte et continuer';

  @override
  String get privacyOverviewLearnMore => 'Politique de confidentialité';

  @override
  String get privacyOverviewTerms => 'Conditions d\'utilisation';

  @override
  String get permTutorialButton => 'Voir le tutoriel vidéo';

  @override
  String get permTapToGrant => 'APPUYEZ POUR AUTORISER';

  @override
  String get permFindAppText => 'Trouvez Cortisol Zero sur l\'écran suivant';

  @override
  String get permTapAndToggle => 'Appuyez dessus et activez le commutateur';

  @override
  String get permWhatItDoes => 'Ce que fait cette autorisation';

  @override
  String get permWhatItDoesNot => 'Ce que cette autorisation NE fait PAS';

  @override
  String get legalSectionTitle => 'Légal';

  @override
  String get legalPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get legalTermsOfService => 'Conditions d\'utilisation';

  @override
  String get todaysMoodRecorded => 'Humeur d\'aujourd\'hui : enregistrée';

  @override
  String blockerScheduleInfo(String time, String hours) {
    return 'Blocage programmé à partir de $time pendant ${hours}h par jour. Le blocage se terminera automatiquement.';
  }

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get privacyPolicyLastUpdated =>
      'Date d\'entrée en vigueur : 1er janvier 2025';

  @override
  String get privacyPolicyIntro =>
      'Cortisol Zero (\"nous\", \"notre\", \"application\") s\'engage à protéger votre vie privée.';

  @override
  String get privacyPolicyDataCollectedTitle => '1. Données collectées';

  @override
  String get privacyPolicyDataCollectedBody =>
      'Cortisol Zero ne collecte AUCUNE donnée personnelle. Toutes les données (entrées du journal, enregistrements de sommeil, historique des sessions de respiration et plannings du bloqueur d\'applications) sont stockées exclusivement sur votre appareil et ne sont jamais transmises à un serveur.';

  @override
  String get privacyPolicyPermissionsTitle => '2. Autorisations utilisées';

  @override
  String get privacyPolicyPermissionsBody =>
      '• Service d\'accessibilité — détecte quelle application est à l\'écran (nom du paquet uniquement) pour appliquer votre planning de blocage. Il ne LIT PAS vos messages, mots de passe ou données personnelles.\n\n• Affichage par-dessus d\'autres applications — affiche un écran de superposition apaisant lorsqu\'une application bloquée est ouverte pendant les heures de concentration.\n\n• Statistiques d\'utilisation — lit les données d\'utilisation des applications pour activer les règles de blocage. Ces données restent uniquement sur votre appareil.\n\n• Service de premier plan — maintient le bloqueur actif en arrière-plan pendant votre fenêtre de concentration planifiée.\n\nAucune de ces autorisations n\'est utilisée pour collecter, transmettre ou partager des données avec nous ou des tiers.';

  @override
  String get privacyPolicyPurchasesTitle => '3. Achats dans l\'application';

  @override
  String get privacyPolicyPurchasesBody =>
      'Les achats sont traités par Google Play. Nous ne stockons pas d\'informations de paiement. Nous recevons uniquement un jeton d\'achat pour vérifier votre statut PRO.';

  @override
  String get privacyPolicyThirdPartyTitle => '4. Services tiers';

  @override
  String get privacyPolicyThirdPartyBody =>
      'Nous n\'intégrons pas de services d\'analyse, de SDK publicitaires ni de rapports de pannes qui collectent des données personnelles. L\'application ne contient aucun code de suivi.';

  @override
  String get privacyPolicyChildrenTitle => '5. Enfants';

  @override
  String get privacyPolicyChildrenBody =>
      'Cortisol Zero ne collecte pas sciemment d\'informations auprès d\'enfants de moins de 13 ans. L\'application est destinée à un public général.';

  @override
  String get privacyPolicyContactTitle => '6. Contact';

  @override
  String get privacyPolicyContactBody =>
      'Pour toute question relative à la confidentialité, contactez-nous à : cartizolzero@gmail.com';

  @override
  String get privacyPolicyChangesTitle => '7. Modifications';

  @override
  String get privacyPolicyChangesBody =>
      'Nous pouvons mettre à jour cette politique. L\'utilisation continue de l\'application après les mises à jour vaut acceptation de la politique révisée.';

  @override
  String get termsTitle => 'Conditions d\'utilisation';

  @override
  String get termsLastUpdated => 'Date d\'entrée en vigueur : 1er janvier 2025';

  @override
  String get termsIntro =>
      'En utilisant Cortisol Zero, vous acceptez ces conditions.';

  @override
  String get termsUseTitle => '1. Utilisation de l\'application';

  @override
  String get termsUseBody =>
      'Cortisol Zero est un outil personnel de santé et de productivité. Vous pouvez l\'utiliser pour vos propres objectifs de gestion du stress et de concentration. Vous ne pouvez pas procéder à une ingénierie inverse, distribuer ou revendre l\'application ou son contenu.';

  @override
  String get termsProTitle => '2. Abonnement PRO';

  @override
  String get termsProBody =>
      'Les fonctionnalités PRO sont déverrouillées via un achat dans l\'application traité par Google Play. Les abonnements se renouvellent automatiquement sauf annulation au moins 24 heures avant la date de renouvellement. Les remboursements sont gérés conformément à la politique de remboursement de Google Play.';

  @override
  String get termsPermissionsTitle => '3. Autorisations';

  @override
  String get termsPermissionsBody =>
      'L\'application requiert certaines autorisations Android (Service d\'accessibilité, Affichage par-dessus d\'autres applications, Statistiques d\'utilisation) pour fournir la fonctionnalité de blocage d\'applications. Ces autorisations sont utilisées uniquement dans le but indiqué et ne servent jamais à collecter des données personnelles.';

  @override
  String get termsDisclaimerTitle => '4. Avertissement';

  @override
  String get termsDisclaimerBody =>
      'Cortisol Zero est un outil de bien-être et N\'EST PAS un dispositif médical ni un conseil médical. Consultez toujours un professionnel de santé pour toute préoccupation médicale.';

  @override
  String get termsLiabilityTitle => '5. Limitation de responsabilité';

  @override
  String get termsLiabilityBody =>
      'Nous ne sommes pas responsables des dommages découlant de l\'utilisation de cette application. L\'application est fournie \"telle quelle\" sans garantie d\'aucune sorte.';

  @override
  String get termsChangesTitle => '6. Modifications';

  @override
  String get termsChangesBody =>
      'Nous pouvons mettre à jour ces conditions. L\'utilisation continue de l\'application après les mises à jour vaut acceptation.';

  @override
  String get termsContactTitle => '7. Contact';

  @override
  String get termsContactBody =>
      'Pour toute question, contactez-nous à : cartizolzero@gmail.com';

  @override
  String get testAlarmIn1Min => 'Tester l\'alarme dans 1 minute';

  @override
  String get testAlarmScheduled => 'Alarme de test programmée dans 1 minute';

  @override
  String get blockerLockedTitle => 'Paramètres verrouillés';

  @override
  String blockerLockedBody(String time) {
    return 'Le mode concentration est actif. Tu pourras modifier les paramètres après la fin du blocage à $time.';
  }
}
