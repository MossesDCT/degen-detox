// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Cortisol Zero';

  @override
  String get appTagline => 'Your daily stress reduction companion';

  @override
  String get navHome => 'Home';

  @override
  String get navLearn => 'Learn';

  @override
  String get navBreathe => 'Breathe';

  @override
  String get navSounds => 'Sounds';

  @override
  String get navMore => 'More';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get greetingNight => 'Good night';

  @override
  String get dayStreak => 'day streak';

  @override
  String get dailyTip => 'Today\'s Tip';

  @override
  String get quickAccess => 'Quick Access';

  @override
  String get moodCheckin => 'Mood Check-In';

  @override
  String get howAreYouFeeling => 'How are you feeling?';

  @override
  String get explore => 'Explore';

  @override
  String get learnTitle => 'Learn';

  @override
  String get learnSubtitle => 'Understand cortisol and how to manage it';

  @override
  String get searchTopics => 'Search topics...';

  @override
  String get seeAll => 'See All';

  @override
  String minuteRead(int count) {
    return '$count min read';
  }

  @override
  String get noResultsFound => 'No results found';

  @override
  String get nutritionGuide => 'Nutrition Guide';

  @override
  String get antiStressFoods => 'Anti-Stress Foods';

  @override
  String get tapToLearnScience =>
      'Tap any food to learn the science behind how it lowers cortisol';

  @override
  String get servingIdea => 'Serving idea';

  @override
  String get breatheTitle => 'Breathe';

  @override
  String get breatheSubtitle => 'Breathing exercises lower cortisol in minutes';

  @override
  String get scienceBackedTechniques => 'Science-backed techniques';

  @override
  String get vagusNerveInfo =>
      'Each technique activates your vagus nerve to reduce cortisol within minutes';

  @override
  String get beginner => 'Beginner';

  @override
  String get intermediate => 'Intermediate';

  @override
  String get advanced => 'Advanced';

  @override
  String get phaseInhale => 'Inhale';

  @override
  String get phaseHold => 'Hold';

  @override
  String get phaseExhale => 'Exhale';

  @override
  String get sessionComplete => 'Session Complete!';

  @override
  String get sessionCompleteMessage =>
      'Your cortisol levels are lowering. Take a moment to notice how you feel.';

  @override
  String get cyclesCompleted => 'Cycles';

  @override
  String get duration => 'Duration';

  @override
  String get done => 'Done';

  @override
  String get endSession => 'End Session';

  @override
  String cycleOf(int current, int total) {
    return 'Cycle $current of $total';
  }

  @override
  String get soundsTitle => 'Sounds';

  @override
  String get soundsSubtitle => 'Nature sounds to calm your nervous system';

  @override
  String nowPlaying(String name) {
    return 'Now Playing: $name';
  }

  @override
  String get tapToPlay => 'Tap to play';

  @override
  String get paused => 'Paused';

  @override
  String get sleepTimer => 'Sleep Timer';

  @override
  String get audioWillStop => 'Audio will stop automatically';

  @override
  String get cancelTimer => 'Cancel Timer';

  @override
  String sleepTimerSet(int minutes) {
    return 'Sleep timer: $minutes min';
  }

  @override
  String get journalTitle => 'Mood Journal';

  @override
  String get addEntry => 'Add Entry';

  @override
  String get saveEntry => 'Save Entry';

  @override
  String get noEntriesThisMonth => 'No entries this month';

  @override
  String get tapPlusToAdd => 'Tap + to add your first mood entry';

  @override
  String weeklyAverage(String mood) {
    return 'Weekly average: $mood';
  }

  @override
  String get addNoteOptional =>
      'Add a note about how you\'re feeling... (optional)';

  @override
  String get moodTerrible => 'Terrible';

  @override
  String get moodBad => 'Bad';

  @override
  String get moodOkay => 'Okay';

  @override
  String get moodGood => 'Good';

  @override
  String get moodGreat => 'Great';

  @override
  String get sleepTrackerTitle => 'Sleep Tracker';

  @override
  String get logSleep => 'Log Sleep';

  @override
  String get sleepQuality => 'Sleep Quality';

  @override
  String get bedtimeReminder => 'Bedtime Reminder';

  @override
  String get avgQuality => 'Avg Quality';

  @override
  String get avgDuration => 'Avg Duration';

  @override
  String get tracked => 'Tracked';

  @override
  String get bedtime => 'Bedtime';

  @override
  String get wakeTime => 'Wake Time';

  @override
  String get last7Days => 'Last 7 Days';

  @override
  String get recentEntries => 'Recent Entries';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get notifications => 'Notifications';

  @override
  String get enableNotifications => 'Enable Notifications';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get rateApp => 'Rate the App';

  @override
  String get version => 'Version';

  @override
  String get about => 'About';

  @override
  String get proTitle => 'PRO';

  @override
  String get proActive => 'PRO — Active ✓';

  @override
  String get upgradeToProCTA => 'Upgrade to PRO';

  @override
  String get upgradeSubtitle => 'Unlock the complete stress reduction toolkit';

  @override
  String get proPrice => 'USD 6.50 one-time';

  @override
  String get oneTimePayment => 'One-time payment • Lifetime access';

  @override
  String get noSubscription => 'No subscription, no recurring charges';

  @override
  String unlockPro(String price) {
    return 'Unlock PRO — $price';
  }

  @override
  String get restorePurchases => 'Restore Purchases';

  @override
  String get proThankYou => 'Thank you for your support!';

  @override
  String get youHavePro => 'You have PRO!';

  @override
  String get proFeaturesUnlocked => 'All PRO features are unlocked.';

  @override
  String get awesome => 'Awesome!';

  @override
  String get checkingPurchases => 'Checking for purchases...';

  @override
  String get recipeBook => 'Recipe Book';

  @override
  String get recipes22 => '22 cortisol-lowering recipes';

  @override
  String get searchRecipes => 'Search recipes...';

  @override
  String get ingredients => 'Ingredients';

  @override
  String get instructions => 'Instructions';

  @override
  String get whyItWorks => 'Why It Works';

  @override
  String servings(int count) {
    return '$count servings';
  }

  @override
  String prepTime(String time) {
    return 'Prep: $time';
  }

  @override
  String totalTime(String time) {
    return 'Total: $time';
  }

  @override
  String get meditationLibrary => 'Meditation Library';

  @override
  String get guidedMeditations => 'Guided meditations for stress';

  @override
  String get appBlocker => 'App Blocker';

  @override
  String get morningFocusMode => 'Morning Focus Mode';

  @override
  String get enableAppBlocker => 'Enable App Blocker';

  @override
  String get blockDuration => 'Block Duration';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get unlockWithBreathing =>
      'Complete a 5-minute breathing exercise to unlock';

  @override
  String get moodInsights => 'AI Mood Insights';

  @override
  String get weeklyPatternAnalysis => 'Weekly mood pattern analysis';

  @override
  String get stressLevel => 'Stress Level';

  @override
  String get avgMood => 'Avg Mood';

  @override
  String get trend => 'Trend';

  @override
  String get weeklyMoodTrend => 'Weekly Mood Trend';

  @override
  String get aiDetectedPatterns => 'AI-Detected Patterns';

  @override
  String get weeklyPersonalizedTip => 'Weekly Personalized Tip';

  @override
  String get onboarding1Title => 'Welcome to\nCortisol Zero';

  @override
  String get onboarding1Subtitle =>
      'Your daily companion for managing stress and building a calmer, healthier life.';

  @override
  String get onboarding2Title => 'Understand\nYour Stress';

  @override
  String get onboarding2Subtitle =>
      'Cortisol is your stress hormone. When chronically elevated, it affects your health, mood, and sleep.';

  @override
  String get onboarding3Title => 'Your Journey\nBegins Now';

  @override
  String get onboarding3Subtitle =>
      'Just 5 minutes a day with Cortisol Zero can measurably lower your stress levels within weeks.';

  @override
  String get continueButton => 'Continue';

  @override
  String get getStarted => 'Get Started';

  @override
  String get skip => 'Skip';

  @override
  String get moreTitle => 'More';

  @override
  String get toolsSection => 'Tools';

  @override
  String get proFeaturesSection => 'PRO Features';

  @override
  String get unlockCortisolZeroPro => 'Unlock Cortisol Zero PRO';

  @override
  String get unlock => 'Unlock';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get change => 'Change';

  @override
  String get scienceBacked => 'Science-backed cortisol reducer';

  @override
  String get free => 'FREE';

  @override
  String get whatYouGet => 'What you get';

  @override
  String scheduledAt(String time) {
    return 'Scheduled: $time';
  }

  @override
  String get dailyTipBadge => 'Daily Tip';

  @override
  String get journalLabel => 'Journal';

  @override
  String get featureNutrition => 'Nutrition';

  @override
  String get featureNutritionSub => '20 anti-stress foods';

  @override
  String get featureSleep => 'Sleep';

  @override
  String get featureSleepSub => 'Track & improve';

  @override
  String get nutritionBannerTitle => 'Anti-Stress Nutrition Guide';

  @override
  String get nutritionBannerSub => '20+ cortisol-lowering foods';

  @override
  String minRead(int count) {
    return '$count min read';
  }

  @override
  String get filterAll => 'All';

  @override
  String get filterBasics => 'Basics';

  @override
  String get filterScience => 'Science';

  @override
  String get filterImpact => 'Impact';

  @override
  String get filterReduce => 'Reduce';

  @override
  String get filterLifestyle => 'Lifestyle';

  @override
  String get filterNutrition => 'Nutrition';

  @override
  String get filterSleep => 'Sleep';

  @override
  String get filterMind => 'Mind';

  @override
  String get catBasics => 'The Basics';

  @override
  String get catScience => 'The Science';

  @override
  String get catImpact => 'Health Impact';

  @override
  String get catReduction => 'Reduction Tips';

  @override
  String get catLifestyle => 'Lifestyle';

  @override
  String get catNutrition => 'Nutrition';

  @override
  String get catSleep => 'Sleep';

  @override
  String get catExercise => 'Exercise';

  @override
  String get catMindfulness => 'Mindfulness';

  @override
  String get dailyTip0 =>
      'Take 5 deep breaths right now. Each long exhale activates your vagus nerve and lowers cortisol within 60 seconds.';

  @override
  String get dailyTip1 =>
      'Drink a glass of cold water. Mild dehydration increases cortisol by up to 33%. Hydration is stress management.';

  @override
  String get dailyTip2 =>
      'Go outside for 10 minutes. Natural light and greenery reduce cortisol measurably — even a short walk works.';

  @override
  String get dailyTip3 =>
      'Put your phone down for 30 minutes. Every notification triggers a micro cortisol spike. Give your nervous system a rest.';

  @override
  String get dailyTip4 =>
      'Have a handful of almonds or dark chocolate. Magnesium and flavanols directly suppress the HPA axis.';

  @override
  String get dailyTip5 =>
      'Write down 3 things you\'re grateful for. Just 5 minutes of gratitude journaling reduces cortisol by 23%.';

  @override
  String get dailyTip6 =>
      'Listen to calm music. Music at 432Hz resonance has been shown to lower cortisol and slow heart rate.';

  @override
  String get dailyTip7 =>
      'Spend time with someone you care about. Oxytocin from positive social contact directly inhibits cortisol.';

  @override
  String get dailyTip8 =>
      'Try 4-7-8 breathing before your next stressful task. 4 counts in, hold 7, exhale 8. Natural tranquilizer.';

  @override
  String get dailyTip9 =>
      'Eat breakfast within 90 minutes of waking. Skipping breakfast triggers cortisol spikes to maintain blood sugar.';

  @override
  String get dailyTip10 =>
      'Set a screen curfew 1 hour before bed. Blue light suppresses melatonin and keeps cortisol elevated at night.';

  @override
  String get dailyTip11 =>
      'Move your body for 20 minutes. Moderate exercise creates a \"cortisol dividend\" — levels drop below baseline for hours afterward.';

  @override
  String get dailyTip12 =>
      'Make a cup of chamomile or green tea. L-theanine in green tea promotes calm alertness; chamomile\'s apigenin binds GABA receptors.';

  @override
  String get dailyTip13 =>
      'Practice progressive muscle relaxation. Tense and release each muscle group. This directly activates the parasympathetic nervous system.';

  @override
  String get eduTitle000 => 'What Is Cortisol?';

  @override
  String get eduTitle001 => 'The Cortisol Rhythm';

  @override
  String get eduTitle002 => 'The HPA Axis Explained';

  @override
  String get eduTitle003 => 'Cortisol vs. Adrenaline';

  @override
  String get eduTitle004 => 'How High Cortisol Affects Your Body';

  @override
  String get eduTitle005 => 'Cortisol and Your Mood';

  @override
  String get eduTitle006 => 'Deep Breathing: The Fastest Fix';

  @override
  String get eduTitle007 => 'The Power of Nature';

  @override
  String get eduTitle008 => 'Exercise: Timing Matters';

  @override
  String get eduTitle009 => 'Social Connection Lowers Cortisol';

  @override
  String get eduTitle010 => 'Sleep and Cortisol: The Vicious Cycle';

  @override
  String get eduTitle011 => 'Yoga and the Stress Response';

  @override
  String get eduTitle012 => 'Mindfulness Meditation: Proven Results';

  @override
  String get eduTitle013 => 'Foods That Raise Cortisol';

  @override
  String get eduTitle014 => 'The Gut-Brain-Cortisol Connection';

  @override
  String get eduTitle015 => 'Magnesium: The Anti-Stress Mineral';

  @override
  String get eduTitle016 => 'Journaling as Cortisol Medicine';

  @override
  String get eduContent000 =>
      'Cortisol is your body\'s primary stress hormone, produced by the adrenal glands sitting atop your kidneys. Often called the \"stress hormone,\" it plays a vital role in your body\'s fight-or-flight response.\n\nWhen you face a stressful situation, your brain\'s hypothalamus triggers a cascade of signals that leads to cortisol release. This prepares your body to either fight or flee — increasing heart rate, blood pressure, and blood sugar.\n\nIn healthy amounts, cortisol is essential for life. It helps regulate metabolism, reduces inflammation, and assists with memory formation. The problem arises when cortisol levels remain chronically elevated due to ongoing stress.';

  @override
  String get eduContent001 =>
      'Cortisol follows a natural daily rhythm called the diurnal cortisol pattern. Levels are typically highest in the morning (around 8 AM), which helps you wake up and feel alert. They gradually decline throughout the day, reaching their lowest point around midnight.\n\nThis is called the Cortisol Awakening Response (CAR). A healthy CAR sees cortisol spike 50-160% within 30 minutes of waking — nature\'s own alarm clock.\n\nModern lifestyles disrupt this rhythm through poor sleep, chronic stress, artificial light at night, and irregular meal times. When the rhythm is disrupted, you may feel exhausted in the morning and wired at night.';

  @override
  String get eduContent002 =>
      'The Hypothalamic-Pituitary-Adrenal (HPA) axis is your body\'s central stress response system. Here\'s how it works:\n\n1. **Hypothalamus** detects stress and releases CRH (corticotropin-releasing hormone)\n2. **Pituitary gland** receives CRH and releases ACTH (adrenocorticotropic hormone)\n3. **Adrenal glands** receive ACTH and produce cortisol\n4. **Negative feedback loop**: when cortisol is high enough, it signals the hypothalamus to slow down production\n\nChronic stress can dysregulate this feedback loop, leading to persistently elevated cortisol that the body can no longer properly suppress.';

  @override
  String get eduContent003 =>
      'Many people confuse cortisol with adrenaline (epinephrine). While both are stress hormones, they work differently:\n\n**Adrenaline** is fast — it kicks in within seconds during acute stress, causing your heart to race and palms to sweat. Its effects fade quickly.\n\n**Cortisol** is slow — it takes minutes to mobilize but its effects last for hours or days. It\'s designed for sustained threats, not sudden ones.\n\nThe modern problem is that our psychological stressors (deadlines, traffic, social media) continuously activate the cortisol pathway — keeping it elevated as if we were constantly facing a predator.';

  @override
  String get eduContent004 =>
      'Chronically elevated cortisol has far-reaching consequences:\n\n🩺 **Immune system**: Suppresses immune response, making you more susceptible to illness\n⚖️ **Weight**: Promotes fat storage, especially visceral belly fat\n💤 **Sleep**: Disrupts sleep cycles, causing insomnia\n🧠 **Brain**: Impairs memory and concentration; can shrink the hippocampus over time\n❤️ **Heart**: Raises blood pressure and increases cardiovascular risk\n🦴 **Bones**: Reduces bone density\n🩸 **Blood sugar**: Causes insulin resistance\n\nThe good news? These effects are largely reversible with proper stress management.';

  @override
  String get eduContent005 =>
      'The link between cortisol and mental health is profound. High cortisol is associated with:\n\n**Anxiety**: Cortisol amplifies the amygdala\'s threat-detection, making everything feel more dangerous.\n\n**Depression**: Chronically high cortisol reduces serotonin and dopamine — the \"feel-good\" neurotransmitters.\n\n**Brain fog**: Cortisol competes with glucose in the prefrontal cortex, impairing clear thinking, decision-making, and focus.\n\n**Emotional reactivity**: You become more easily triggered by minor frustrations.\n\nInterestingly, very low cortisol (adrenal fatigue) can also cause depression and extreme fatigue — balance is key.';

  @override
  String get eduContent006 =>
      'Deep, diaphragmatic breathing is one of the most powerful and immediate ways to lower cortisol. Here\'s the science:\n\nWhen you breathe slowly and deeply, you activate the parasympathetic nervous system — the \"rest and digest\" response that directly counters the stress response.\n\nThe vagus nerve, which runs from your brain to your gut, is stimulated by deep breathing. This sends a \"safety\" signal throughout your body, dropping cortisol levels within minutes.\n\n**The 4-7-8 technique**: Inhale for 4 seconds, hold for 7, exhale for 8. The extended exhale is key — it activates the vagal brake on your stress response.';

  @override
  String get eduContent007 =>
      'Spending time in nature is scientifically proven to lower cortisol. A Japanese practice called \"Shinrin-yoku\" (forest bathing) has been extensively studied:\n\n🌿 Just 20 minutes in a forest reduces cortisol by 15.8%\n🌳 Green spaces lower both salivary cortisol and heart rate\n🌊 Blue spaces (water environments) have similar effects\n🌸 Even viewing nature images reduces stress markers\n\nYou don\'t need a forest. Even a 10-minute walk in a local park, tending houseplants, or sitting by a window with a garden view activates nature\'s calming effect on your HPA axis.';

  @override
  String get eduContent008 =>
      'Exercise is a double-edged sword with cortisol. Understanding this helps you optimize your workouts:\n\n**During exercise**: Cortisol rises to mobilize energy — this is healthy and normal.\n\n**After moderate exercise**: Cortisol drops below baseline for hours, providing a \"cortisol dividend.\"\n\n**Over-training**: Excessive high-intensity exercise keeps cortisol chronically elevated. More isn\'t always better.\n\n**Best practices for cortisol balance**:\n• Morning moderate cardio (30-45 min) is optimal\n• Avoid intense training late at night\n• Incorporate rest days — they\'re when adaptation happens\n• Yoga and tai chi are especially effective at lowering cortisol';

  @override
  String get eduContent009 =>
      'Human connection is a powerful cortisol buffer. Research shows:\n\n• **Oxytocin** (the \"bonding hormone\") directly inhibits cortisol release\n• People with strong social support have 25% lower cortisol responses to stress\n• Even brief, positive social interactions lower cortisol\n• Pet ownership significantly reduces cortisol — petting a dog for 10 minutes lowers cortisol by measurable amounts\n• Loneliness, conversely, elevates cortisol — it\'s perceived as a survival threat\n\nThis is why isolation is so physically harmful. Your body genuinely needs social contact to regulate its stress response.';

  @override
  String get eduContent010 =>
      'High cortisol and poor sleep form a dangerous feedback loop:\n\n**High cortisol → poor sleep**: Cortisol is stimulating. When elevated at night, it prevents the brain from reaching deep, restorative sleep stages.\n\n**Poor sleep → high cortisol**: Even one night of poor sleep raises cortisol by 37% the following day.\n\n**Breaking the cycle**:\n✓ Keep a consistent sleep/wake schedule (even weekends)\n✓ Avoid screens 1 hour before bed — blue light suppresses melatonin\n✓ Keep your bedroom cool (65-68°F / 18-20°C is optimal)\n✓ Avoid caffeine after 2 PM\n✓ Practice a wind-down routine (reading, gentle stretching, breathwork)';

  @override
  String get eduContent011 =>
      'Yoga is one of the most well-studied interventions for cortisol reduction:\n\n**Studies show** that 8 weeks of regular yoga practice reduces morning cortisol by up to 30%.\n\n**Why yoga works**:\n• Combines breathing, movement, and mindfulness — triple cortisol-lowering effect\n• Activates the parasympathetic nervous system through conscious breathing\n• Reduces amygdala reactivity (makes you less easily triggered)\n• Improves GABA levels — the brain\'s calming neurotransmitter\n\n**Best styles for cortisol**: Hatha, Yin, Restorative, and Yoga Nidra (yogic sleep) are particularly effective. Even 10 minutes of gentle yoga before bed can transform sleep quality.';

  @override
  String get eduContent012 =>
      'Mindfulness-Based Stress Reduction (MBSR) has been rigorously studied since the 1970s. The results are compelling:\n\n🧪 **8 weeks** of MBSR reduces cortisol by 20-25%\n🧠 **Changes brain structure**: Grows the prefrontal cortex (rational thinking) while shrinking the amygdala (fear center)\n💊 **Equivalent to medication** for mild-moderate anxiety in multiple trials\n❤️ **Reduces inflammation** markers (CRP, IL-6) that are linked to cortisol\n\nYou don\'t need hours. Research shows that **10 minutes daily** of focused mindfulness practice produces measurable cortisol reductions within 4 weeks.';

  @override
  String get eduContent013 =>
      'Your diet directly influences cortisol. These foods can spike stress hormones:\n\n☕ **Caffeine**: Raises cortisol by 30% even in coffee-habituated individuals. Decaf doesn\'t fully solve it — wait 90 minutes after waking before your first cup.\n\n🍬 **Sugar spikes**: Rapid glucose swings trigger cortisol release. Choose low-glycemic foods.\n\n🥃 **Alcohol**: Initially sedating, alcohol disrupts sleep architecture and elevates cortisol the next day.\n\n🔥 **Inflammatory foods**: Trans fats, processed vegetable oils, and ultra-processed foods increase systemic inflammation, which elevates cortisol.\n\n🧂 **Excess sodium**: A high-sodium diet is linked to elevated cortisol levels in multiple studies.';

  @override
  String get eduContent014 =>
      'Your gut microbiome has a direct line to your stress response — the gut-brain axis:\n\n🦠 **Gut bacteria produce neurotransmitters**: 90% of serotonin is made in your gut. Imbalanced gut flora means less serotonin, more stress vulnerability.\n\n🔗 **The vagus nerve** connects gut to brain — gut inflammation directly activates the HPA axis.\n\n🥛 **Probiotics lower cortisol**: Studies show Lactobacillus rhamnosus supplementation reduces anxiety and cortisol response to stress.\n\n**Foods for a healthy gut microbiome**:\n• Fermented foods (kefir, yogurt, kimchi, sauerkraut)\n• Prebiotic fiber (garlic, onions, oats, bananas)\n• Polyphenol-rich foods (berries, dark chocolate, green tea)';

  @override
  String get eduContent015 =>
      'Magnesium is often called \"nature\'s tranquilizer\" — and for good reason:\n\n**The cortisol connection**: Magnesium regulates the HPA axis. Deficiency allows cortisol to run unchecked, while adequate magnesium puts the brakes on excessive cortisol release.\n\n**The deficiency epidemic**: Up to 68% of Americans are magnesium-deficient. Chronic stress itself depletes magnesium — creating a vicious cycle.\n\n**Signs of deficiency**: Anxiety, muscle tension, poor sleep, irritability, headaches, sugar cravings.\n\n**Top food sources**: Dark leafy greens (spinach, kale), pumpkin seeds, almonds, avocado, dark chocolate, legumes, whole grains.\n\n**Supplementation**: Magnesium glycinate and magnesium threonate have the best absorption and brain-penetrating effects.';

  @override
  String get eduContent016 =>
      'Writing about your emotions is clinically proven to lower cortisol:\n\n📝 **Expressive writing** (writing about stressful experiences) reduces cortisol response in subsequent stressors\n\n🧠 **Why it works**: Writing activates the prefrontal cortex (rational brain), which can then regulate the amygdala (emotional brain) — turning down the cortisol tap\n\n💙 **Gratitude journaling** is particularly powerful: Even brief daily gratitude writing reduces cortisol by 23% (UCDavis research)\n\n**Getting started**: Just 15 minutes, 3 days per week. Don\'t edit, just write. Focus on both what happened and how you felt about it.\n\nThis app\'s journal feature is designed exactly for this purpose — your daily entries accumulate into a powerful self-awareness practice.';

  @override
  String get nutFilterAll => 'All';

  @override
  String get nutFilterFruits => 'Fruits';

  @override
  String get nutFilterVegetables => 'Vegetables';

  @override
  String get nutFilterProteins => 'Proteins';

  @override
  String get nutFilterBeverages => 'Beverages';

  @override
  String get nutFilterNutsSeeds => 'Nuts & Seeds';

  @override
  String get nutFilterGrains => 'Grains';

  @override
  String get nutFilterDairy => 'Dairy';

  @override
  String get nutFilterSpices => 'Spices';

  @override
  String get nutCatFruits => 'Fruits';

  @override
  String get nutCatVegetables => 'Vegetables';

  @override
  String get nutCatProteins => 'Proteins';

  @override
  String get nutCatBeverages => 'Beverages';

  @override
  String get nutCatNutsSeeds => 'Nuts & Seeds';

  @override
  String get nutCatGrains => 'Grains';

  @override
  String get nutCatDairy => 'Dairy';

  @override
  String get nutCatSpices => 'Spices';

  @override
  String get foodName000 => 'Blueberries';

  @override
  String get foodBenefit000 => 'Powerful antioxidants reduce oxidative stress';

  @override
  String get foodMechanism000 =>
      'Rich in anthocyanins that cross the blood-brain barrier, reducing neuroinflammation and cortisol-induced oxidative damage. Studies show blueberry extract lowers cortisol response after acute stress.';

  @override
  String get foodServing000 =>
      'Add a handful to overnight oats or blend into a smoothie';

  @override
  String get foodNutrients000 => 'Vitamin C, Anthocyanins, Fiber, Vitamin K';

  @override
  String get foodName001 => 'Bananas';

  @override
  String get foodBenefit001 =>
      'Potassium lowers blood pressure; tryptophan boosts serotonin';

  @override
  String get foodMechanism001 =>
      'Bananas contain tryptophan, a precursor to serotonin — the calming neurotransmitter that modulates cortisol. Potassium counteracts cortisol\'s effect on blood pressure. The natural sugars provide quick energy without a cortisol spike.';

  @override
  String get foodServing001 =>
      'Slice onto almond butter toast for a perfect stress-busting snack';

  @override
  String get foodNutrients001 => 'Potassium, Tryptophan, Vitamin B6, Magnesium';

  @override
  String get foodName002 => 'Oranges';

  @override
  String get foodBenefit002 => 'High vitamin C directly reduces cortisol';

  @override
  String get foodMechanism002 =>
      'Vitamin C is consumed rapidly by the adrenal glands during cortisol production. Supplementing vitamin C reduces cortisol response to psychological stressors. A 2001 German study found 1000mg vitamin C reduced cortisol and blood pressure during public speaking tests.';

  @override
  String get foodServing002 =>
      'Eat the whole fruit (not juice) for fiber benefit; have before stressful events';

  @override
  String get foodNutrients002 => 'Vitamin C, Folate, Potassium, Flavonoids';

  @override
  String get foodName003 => 'Avocados';

  @override
  String get foodBenefit003 => 'Healthy fats reduce stress inflammation';

  @override
  String get foodMechanism003 =>
      'Avocados are rich in monounsaturated fats that support adrenal health and reduce inflammatory cytokines linked to HPA axis activation. B vitamins (B5, B6) support adrenal hormone production. Magnesium directly modulates the HPA axis.';

  @override
  String get foodServing003 =>
      'Top salmon or eggs with sliced avocado; add to smoothies for creaminess';

  @override
  String get foodNutrients003 =>
      'Magnesium, B5 (Pantothenic Acid), B6, Monounsaturated Fats, Potassium';

  @override
  String get foodName004 => 'Spinach';

  @override
  String get foodBenefit004 => 'Magnesium-rich — nature\'s tranquilizer';

  @override
  String get foodMechanism004 =>
      'Spinach is one of the richest food sources of magnesium, which regulates the HPA axis and inhibits excessive cortisol release. Magnesium deficiency is directly linked to elevated cortisol. Folate in spinach also supports GABA production — the brain\'s calming neurotransmitter.';

  @override
  String get foodServing004 =>
      'Sauté with garlic as a side dish or blend raw into morning smoothies (taste is masked)';

  @override
  String get foodNutrients004 =>
      'Magnesium, Folate, Iron, Vitamin K, Vitamin C';

  @override
  String get foodName005 => 'Sweet Potatoes';

  @override
  String get foodBenefit005 =>
      'Sustained energy prevents cortisol spikes from blood sugar crashes';

  @override
  String get foodMechanism005 =>
      'Sweet potatoes provide slow-releasing complex carbohydrates that prevent the blood sugar crashes that trigger cortisol release. The purple varieties are especially high in anthocyanins. High potassium content helps counteract cortisol\'s blood pressure effects.';

  @override
  String get foodServing005 =>
      'Roast with olive oil and cinnamon; mash as a side dish or base for Buddha bowls';

  @override
  String get foodNutrients005 =>
      'Potassium, Vitamin A, Fiber, Vitamin C, Manganese';

  @override
  String get foodName006 => 'Broccoli';

  @override
  String get foodBenefit006 =>
      'Sulforaphane protects against stress-induced brain damage';

  @override
  String get foodMechanism006 =>
      'Sulforaphane in broccoli activates Nrf2 — the body\'s master antioxidant switch — protecting neurons from cortisol-induced oxidative stress. Broccoli is also rich in vitamin C, magnesium, and folate, all direct cortisol modulators.';

  @override
  String get foodServing006 =>
      'Steam lightly to preserve sulforaphane; top with lemon and olive oil';

  @override
  String get foodNutrients006 =>
      'Sulforaphane, Vitamin C, Folate, Calcium, Fiber';

  @override
  String get foodName007 => 'Salmon';

  @override
  String get foodBenefit007 =>
      'Omega-3 fats directly suppress cortisol production';

  @override
  String get foodMechanism007 =>
      'EPA and DHA (omega-3 fatty acids) in salmon reduce cortisol in two ways: they decrease hypothalamic CRH release, and they reduce neuroinflammation that amplifies stress responses. Studies show regular omega-3 intake reduces cortisol reactivity by up to 22%.';

  @override
  String get foodServing007 =>
      'Bake with lemon and herbs 2-3x per week; pair with leafy greens and avocado';

  @override
  String get foodNutrients007 =>
      'EPA/DHA Omega-3, Vitamin D, B12, Selenium, Protein';

  @override
  String get foodName008 => 'Turkey';

  @override
  String get foodBenefit008 => 'Tryptophan raises serotonin to buffer stress';

  @override
  String get foodMechanism008 =>
      'Turkey is exceptionally rich in tryptophan, which the body converts to serotonin and melatonin. Serotonin modulates cortisol release and promotes emotional regulation. The B vitamins in turkey also support adrenal function.';

  @override
  String get foodServing008 =>
      'Slice for wraps with avocado and spinach; add to salads as a lean protein';

  @override
  String get foodNutrients008 => 'Tryptophan, B3 (Niacin), B6, Selenium, Zinc';

  @override
  String get foodName009 => 'Eggs';

  @override
  String get foodBenefit009 =>
      'Complete protein with choline supports brain stress response';

  @override
  String get foodMechanism009 =>
      'Eggs contain choline, essential for acetylcholine production — the neurotransmitter that regulates the parasympathetic (rest) nervous system. Phosphatidylserine in egg yolks has been shown to reduce cortisol response to exercise by up to 30%.';

  @override
  String get foodServing009 =>
      'Scramble with spinach and turmeric; boil for portable snacks';

  @override
  String get foodNutrients009 =>
      'Choline, Phosphatidylserine, B12, Vitamin D, Tryptophan';

  @override
  String get foodName010 => 'Green Tea';

  @override
  String get foodBenefit010 =>
      'L-theanine promotes calm alertness without cortisol spike';

  @override
  String get foodMechanism010 =>
      'L-theanine, unique to tea leaves, increases alpha brain waves (associated with relaxed focus) and promotes GABA production. It counteracts caffeine\'s cortisol-raising effect, reducing the stress response while maintaining mental clarity.';

  @override
  String get foodServing010 =>
      'Drink 2-3 cups daily; brew at 80°C (not boiling) to preserve L-theanine';

  @override
  String get foodNutrients010 =>
      'L-theanine, EGCG (catechins), Caffeine (low), Antioxidants';

  @override
  String get foodName011 => 'Chamomile Tea';

  @override
  String get foodBenefit011 =>
      'Apigenin binds GABA receptors to reduce anxiety';

  @override
  String get foodMechanism011 =>
      'Chamomile contains apigenin, a flavonoid that binds to GABA receptors in the brain — the same receptors targeted by anti-anxiety medications, but with a gentle, natural effect. Regular consumption reduces cortisol levels and improves sleep quality.';

  @override
  String get foodServing011 =>
      'Drink 1-2 cups before bed as part of a wind-down ritual';

  @override
  String get foodNutrients011 =>
      'Apigenin, Bisabolol, Chamazulene, Antioxidants';

  @override
  String get foodName012 => 'Almonds';

  @override
  String get foodBenefit012 =>
      'Magnesium + vitamin E protect against stress damage';

  @override
  String get foodMechanism012 =>
      'Almonds pack 20% of daily magnesium per ounce — directly dampening HPA axis overactivity. Vitamin E is an antioxidant that protects adrenal cells from free radical damage caused by chronic cortisol production.';

  @override
  String get foodServing012 =>
      'A small handful (23 almonds) as a mid-morning snack; add to oatmeal';

  @override
  String get foodNutrients012 =>
      'Magnesium, Vitamin E, Monounsaturated Fats, Protein, Fiber';

  @override
  String get foodName013 => 'Pumpkin Seeds';

  @override
  String get foodBenefit013 =>
      'Zinc deficiency linked to high cortisol — pumpkin seeds are richest source';

  @override
  String get foodMechanism013 =>
      'Zinc is a critical cofactor in the negative feedback loop that shuts down cortisol production. Zinc deficiency leads to chronically elevated cortisol. Pumpkin seeds are the richest plant source of zinc, plus they contain tryptophan and magnesium.';

  @override
  String get foodServing013 =>
      'Toast and add to salads, soups, or trail mix; stir into oatmeal';

  @override
  String get foodNutrients013 =>
      'Zinc, Tryptophan, Magnesium, Phosphorus, Manganese';

  @override
  String get foodName014 => 'Oats';

  @override
  String get foodBenefit014 =>
      'Complex carbs stabilize blood sugar and raise serotonin';

  @override
  String get foodMechanism014 =>
      'Oats provide complex carbohydrates that trigger serotonin production (carbs increase tryptophan uptake in the brain). Beta-glucan fiber promotes healthy gut microbiome, which supports the gut-brain axis for cortisol regulation. They prevent blood sugar crashes that trigger cortisol.';

  @override
  String get foodServing014 =>
      'Prepare overnight oats with blueberries, walnuts, and honey the night before';

  @override
  String get foodNutrients014 =>
      'Beta-glucan, B1 (Thiamine), Magnesium, Zinc, Fiber';

  @override
  String get foodName015 => 'Quinoa';

  @override
  String get foodBenefit015 =>
      'Complete protein with all essential amino acids for neurotransmitter production';

  @override
  String get foodMechanism015 =>
      'Quinoa is a complete protein containing all 9 essential amino acids, including tryptophan and tyrosine — precursors to serotonin and dopamine respectively. Its low glycemic index prevents the blood sugar swings that trigger cortisol release.';

  @override
  String get foodServing015 =>
      'Use as a base for Buddha bowls or Mediterranean salads';

  @override
  String get foodNutrients015 =>
      'Complete Protein, Magnesium, Iron, Fiber, Riboflavin';

  @override
  String get foodName016 => 'Greek Yogurt';

  @override
  String get foodBenefit016 =>
      'Probiotics support gut-brain axis for cortisol regulation';

  @override
  String get foodMechanism016 =>
      'Greek yogurt is rich in Lactobacillus and Bifidobacterium strains that produce GABA directly in the gut. Research shows probiotic supplementation reduces cortisol and anxiety in clinical studies. High protein content supports satiety and stable blood sugar.';

  @override
  String get foodServing016 =>
      'Top with blueberries and pumpkin seeds for a complete stress-busting breakfast';

  @override
  String get foodNutrients016 =>
      'Probiotics, Protein, Calcium, B12, Tryptophan';

  @override
  String get foodName017 => 'Kefir';

  @override
  String get foodBenefit017 =>
      'Most probiotic-dense food — directly lowers cortisol via gut axis';

  @override
  String get foodMechanism017 =>
      'Kefir contains up to 61 strains of beneficial bacteria — far more than yogurt. Studies show kefir consumption reduces cortisol by modulating the gut microbiome-brain connection. The tryptophan content also boosts serotonin.';

  @override
  String get foodServing017 =>
      'Drink plain or blend into smoothies; use as a base for smoothie bowls';

  @override
  String get foodNutrients017 =>
      'Probiotics (61 strains), Tryptophan, Calcium, B12, K2';

  @override
  String get foodName018 => 'Turmeric';

  @override
  String get foodBenefit018 =>
      'Curcumin is as effective as antidepressants in multiple trials';

  @override
  String get foodMechanism018 =>
      'Curcumin in turmeric inhibits inflammatory cytokines (IL-6, TNF-alpha) that activate the HPA axis. It also raises BDNF (brain-derived neurotrophic factor), protecting neurons from cortisol damage. Multiple trials show curcumin reduces cortisol and depression as effectively as some pharmaceuticals.';

  @override
  String get foodServing018 =>
      'Golden milk before bed: warm milk + turmeric + black pepper + honey';

  @override
  String get foodNutrients018 =>
      'Curcumin, Iron, Manganese, Anti-inflammatory compounds';

  @override
  String get foodName019 => 'Dark Chocolate (70%+)';

  @override
  String get foodBenefit019 =>
      'Directly reduces cortisol and adrenaline — proven in clinical trials';

  @override
  String get foodMechanism019 =>
      'A landmark 2009 study found that eating 40g of dark chocolate daily for 2 weeks reduced cortisol and catecholamines by significant amounts. Magnesium content modulates HPA axis; flavanols increase BDNF and protect against stress-induced neuronal damage. Theobromine provides calm energy.';

  @override
  String get foodServing019 =>
      '1-2 squares (40g) after lunch; look for 70%+ cacao content';

  @override
  String get foodNutrients019 =>
      'Magnesium, Flavanols, Theobromine, Iron, Zinc';

  @override
  String get breathTechBelly => 'Belly Breathing';

  @override
  String get breathTechBox => 'Box Breathing';

  @override
  String get breathTech478 => '4-7-8 Breathing';

  @override
  String get breathDescBelly =>
      'The foundation of all breathwork. Also called diaphragmatic breathing, this activates your parasympathetic nervous system immediately. Perfect for beginners or anyone needing a quick stress reset.';

  @override
  String get breathDescBox =>
      'Used by Navy SEALs and elite athletes to maintain calm under extreme pressure. Equal-duration phases create a \"box\" pattern that rapidly resets the nervous system. Excellent for focus and pre-performance anxiety.';

  @override
  String get breathDesc478 =>
      'Developed by Dr. Andrew Weil based on yogic pranayama traditions. The extended exhale (8 counts) activates the vagal brake on the stress response. Dr. Weil calls it \"a natural tranquilizer for the nervous system.\"';

  @override
  String get breathInstrBellyInhale =>
      'Breathe in slowly through your nose, filling your belly';

  @override
  String get breathInstrBellyExhale =>
      'Breathe out slowly through your mouth, emptying your belly';

  @override
  String get breathInstrBoxInhale =>
      'Inhale slowly through your nose, counting to 4';

  @override
  String get breathInstrBoxHoldFull => 'Hold gently — lungs full, body relaxed';

  @override
  String get breathInstrBoxExhale =>
      'Exhale completely through your mouth, counting to 4';

  @override
  String get breathInstrBoxHoldEmpty =>
      'Hold gently — lungs empty, body relaxed';

  @override
  String get breathInstr478Inhale =>
      'Inhale quietly through your nose for 4 counts';

  @override
  String get breathInstr478Hold => 'Hold your breath completely for 7 counts';

  @override
  String get breathInstr478Exhale =>
      'Exhale completely through your mouth with a whoosh sound for 8 counts';

  @override
  String get breathBenefitBelly1 => 'Activates parasympathetic nervous system';

  @override
  String get breathBenefitBelly2 => 'Reduces cortisol within minutes';

  @override
  String get breathBenefitBelly3 => 'Lowers heart rate and blood pressure';

  @override
  String get breathBenefitBelly4 => 'Improves oxygen exchange';

  @override
  String get breathBenefitBox1 => 'Rapid stress and anxiety reduction';

  @override
  String get breathBenefitBox2 => 'Improves focus and concentration';

  @override
  String get breathBenefitBox3 => 'Used by Navy SEALs and elite performers';

  @override
  String get breathBenefitBox4 => 'Balances CO2 and O2 levels';

  @override
  String get breathBenefitBox5 => 'Reduces cortisol response';

  @override
  String get breathBenefit4781 => 'Natural tranquilizer effect';

  @override
  String get breathBenefit4782 => 'Reduces acute anxiety in minutes';

  @override
  String get breathBenefit4783 => 'Activates the vagus nerve';

  @override
  String get breathBenefit4784 => 'Helps with insomnia — do before bed';

  @override
  String get breathBenefit4785 => 'Manages food cravings from stress';

  @override
  String get breathBenefit4786 => 'Based on ancient yogic pranayama';

  @override
  String get durationMin => 'min';

  @override
  String get durationSec => 'sec';

  @override
  String get appBlockerSubtitle =>
      'Block stress-triggering apps during your morning routine';

  @override
  String get compEducation => 'Education Module';

  @override
  String get compBreathing => 'Breathing Exercises (3)';

  @override
  String get compSoundscapes => 'Soundscapes (5)';

  @override
  String get compNutrition => 'Nutrition Guide';

  @override
  String get compJournal => 'Mood Journal';

  @override
  String get compSleep => 'Sleep Tracker';

  @override
  String get compMeditation => 'Guided Meditation Library';

  @override
  String get compRecipes => 'Recipe Book (22 recipes)';

  @override
  String get compAppBlocker => 'App Blocker / Focus Mode';

  @override
  String get compAiInsights => 'AI Mood Insights';

  @override
  String get compWeeklyAnalysis => 'Weekly Pattern Analysis';

  @override
  String get blockerHeroText =>
      'The first 2 hours after waking have the highest cortisol levels. Avoiding stressful apps (social media, news) during this window dramatically improves your day.';

  @override
  String blockerActiveStatus(Object hours) {
    return 'Active — ${hours}h after wake time';
  }

  @override
  String get blockerInactive => 'Inactive';

  @override
  String blockerDurationLabel(Object hours) {
    return 'Block duration: $hours hours';
  }

  @override
  String get thisWeek => 'This week';

  @override
  String get sevenDayAverage => '7-day average';

  @override
  String get vsLastWeek => 'vs last week';

  @override
  String get stressLow => 'Low';

  @override
  String get stressModerate => 'Moderate';

  @override
  String get stressHigh => 'High';

  @override
  String get dayMon => 'Mon';

  @override
  String get dayTue => 'Tue';

  @override
  String get dayWed => 'Wed';

  @override
  String get dayThu => 'Thu';

  @override
  String get dayFri => 'Fri';

  @override
  String get daySat => 'Sat';

  @override
  String get daySun => 'Sun';

  @override
  String get moodPattern1obs => 'Your mood tends to dip on Wednesdays';

  @override
  String get moodPattern1tip =>
      'Consider scheduling a 5-minute breathing session Wednesday mornings to preempt the mid-week stress peak.';

  @override
  String get moodPattern2obs =>
      'You consistently feel better on Fridays and weekends';

  @override
  String get moodPattern2tip =>
      'This suggests work stress is a primary driver. The App Blocker and morning breathing routine can help weekday mornings.';

  @override
  String get moodPattern3obs =>
      'Lower mood correlates with nights under 7 hours sleep';

  @override
  String get moodPattern3tip =>
      'Setting a consistent 10:30 PM bedtime and using the Chamomile Latte recipe could improve your baseline mood.';

  @override
  String get weeklyTipText =>
      'Based on your mood patterns, your cortisol is likely highest on Tuesday and Wednesday mornings. Try the 4-7-8 breathing exercise before your first task on those days. Your journal entries suggest better mood when you exercise — consider 20 minutes of moderate movement before 10 AM.';

  @override
  String playingMeditation(Object title) {
    return 'Playing: $title';
  }

  @override
  String get medTitle1 => 'Morning Cortisol Reset';

  @override
  String get medDesc1 =>
      'Begin your day by regulating your cortisol awakening response.';

  @override
  String get medCat1 => 'Morning';

  @override
  String get medTitle2 => 'Sleep Preparation';

  @override
  String get medDesc2 =>
      'Wind down your nervous system for deep, restorative sleep.';

  @override
  String get medCat2 => 'Sleep';

  @override
  String get medTitle3 => 'Anxiety Relief';

  @override
  String get medDesc3 =>
      'Interrupt the stress response cycle with MBSR techniques.';

  @override
  String get medCat3 => 'Anxiety';

  @override
  String get medTitle4 => 'Deep Focus';

  @override
  String get medDesc4 =>
      'Lower cortisol while entering a state of calm productivity.';

  @override
  String get medCat4 => 'Focus';

  @override
  String get medTitle5 => 'Body Scan';

  @override
  String get medDesc5 => 'Release physical tension stored from chronic stress.';

  @override
  String get medCat5 => 'Body';

  @override
  String get filterBreakfast => 'Breakfast';

  @override
  String get filterSmoothies => 'Smoothies';

  @override
  String get filterSalads => 'Salads';

  @override
  String get filterMains => 'Mains';

  @override
  String get filterSnacks => 'Snacks';

  @override
  String get filterDrinks => 'Drinks';

  @override
  String get filterDesserts => 'Desserts';

  @override
  String get moreJournalSub => 'Track your daily mood';

  @override
  String get moreSleepSub => 'Monitor your sleep quality';

  @override
  String get moreSettingsSub => 'Theme, language, notifications';

  @override
  String unlockProButton(Object price) {
    return 'Unlock PRO — $price';
  }

  @override
  String get paymentDisclaimer =>
      'Payment processed by Google Play. One-time purchase. No subscription.';

  @override
  String get proThankYouSnackbar =>
      'Thank you! All PRO features are now unlocked.';

  @override
  String get cortisolZeroPro => 'Cortisol Zero PRO';

  @override
  String get proBannerDescription =>
      'Recipes, Meditation, App Blocker, AI Insights — \$6.50 one-time';

  @override
  String get aiDemoDataNotice =>
      'This is a demo preview. Start logging your daily mood to see personalized AI insights based on your real data.';

  @override
  String get aiDemoLabel => 'Demo data';

  @override
  String get recipeWhyItWorks => 'Why It Works';

  @override
  String get recipeIngredients => 'Ingredients';

  @override
  String get recipeInstructions => 'Instructions';

  @override
  String recipeServings(int count) {
    return '$count servings';
  }

  @override
  String get blockedAppsTitle => 'Blocked apps';

  @override
  String get blockerAddApps => 'Add';

  @override
  String get blockerNoAppsSelected =>
      'No apps selected. Tap Add to choose which apps to block during your morning focus time.';

  @override
  String get blockerSelectApps => 'Select apps to block';

  @override
  String get blockerSearchApps => 'Search apps...';

  @override
  String get blockerLoadingApps => 'Loading installed apps...';

  @override
  String get blockerStartButton => 'Start blocking now';

  @override
  String get blockerStopButton => 'Stop blocking';

  @override
  String get blockerPermUsageStats => 'Usage data access';

  @override
  String get blockerPermOverlay => 'Display over other apps';

  @override
  String get blockerRefreshPerms => 'Refresh permissions';

  @override
  String get proActivatedMessage =>
      'All PRO features are unlocked and will activate in a few seconds.';

  @override
  String get permOnboardingTitle => 'Setup Permissions';

  @override
  String get permStepUsageTitle => 'Usage Data Access';

  @override
  String get permStepUsageDesc =>
      'Allow us to see when you open a stress source. This is required to activate the blocker.';

  @override
  String get permStepUsageButton => 'Open Usage Settings';

  @override
  String get permStepOverlayTitle => 'Display Over Apps';

  @override
  String get permStepOverlayDesc =>
      'Allow us to cover the stress source. This lets us show a calming screen instead of the blocked app.';

  @override
  String get permStepOverlayButton => 'Open Overlay Settings';

  @override
  String get permStepGranted => 'Permission granted';

  @override
  String get permNextStep => 'Next step';

  @override
  String get permAllDone => 'All done — let\'s go!';

  @override
  String get permBackToStep1 => 'Back to step 1';

  @override
  String get permStepUsageLottieHint =>
      'Find Cortisol Zero in the list and enable access';

  @override
  String get permStepOverlayLottieHint =>
      'Toggle the switch to allow overlay display';

  @override
  String get permSetupRequired => 'Setup required';

  @override
  String get permSetupRequiredDesc =>
      'To block apps, we need three permissions. Tap below to set them up.';

  @override
  String get permStepAccessibilityTitle => 'Accessibility Service';

  @override
  String get permStepAccessibilityDesc =>
      'Cortisol Zero uses Android\'s Accessibility Service only to detect which app is currently on screen (by package name). It does NOT access messages, passwords, financial data, or any personal information. All detection happens locally on your device and is never stored or transmitted anywhere.';

  @override
  String get permStepAccessibilityButton => 'Open Accessibility Settings';

  @override
  String get permStepAccessibilityLottieHint =>
      'Find Cortisol Zero in Installed Apps and enable it';

  @override
  String get blockerPermAccessibility => 'Accessibility service';

  @override
  String get permBackToStep2 => 'Back to step 2';

  @override
  String get permDisclosureAccesses => 'What it accesses';

  @override
  String get permDisclosureAccessesDesc =>
      'Which app is currently on screen (package name only)';

  @override
  String get permDisclosureNotAccesses => 'What it does NOT access';

  @override
  String get permDisclosureNotAccessesDesc =>
      'Messages, passwords, financial data, personal information, browsing history, contacts';

  @override
  String get permDisclosureDataUsage => 'How data is used';

  @override
  String get permDisclosureDataUsageDesc =>
      'All detection is local on your device. Nothing is stored or transmitted anywhere.';

  @override
  String get permUnderstandContinue => 'I Understand & Continue';

  @override
  String get moodInsights3DayTitle => '3-Day Quick Insights';

  @override
  String get moodInsightsWeeklyTitle => 'Weekly Pattern Analysis';

  @override
  String get moodInsightsRetry => 'Retry Analysis';

  @override
  String get moodInsightsError => 'Analysis failed. Please try again.';

  @override
  String get moodInsightsNotEnoughData =>
      'Add at least 2 mood entries to see insights';

  @override
  String get privacyOverviewTitle => 'How We Handle Your Data';

  @override
  String get privacyOverviewBody =>
      'Cortisol Zero needs 3 permissions to block stress apps. All processing happens locally on your device. We do NOT collect, store, or send any data to servers. We do NOT have user accounts or analytics.';

  @override
  String get privacyOverviewAccept => 'I Accept & Continue';

  @override
  String get privacyOverviewLearnMore => 'Privacy Policy';

  @override
  String get privacyOverviewTerms => 'Terms of Service';

  @override
  String get permTutorialButton => 'Watch Video Tutorial';

  @override
  String get permTapToGrant => 'TAP TO GRANT';

  @override
  String get permFindAppText => 'Find Cortisol Zero on the next screen';

  @override
  String get permTapAndToggle => 'Tap it and turn on the switch';

  @override
  String get permWhatItDoes => 'What this permission does';

  @override
  String get permWhatItDoesNot => 'What this permission does NOT do';

  @override
  String get legalSectionTitle => 'Legal';

  @override
  String get legalPrivacyPolicy => 'Privacy Policy';

  @override
  String get legalTermsOfService => 'Terms of Service';

  @override
  String get todaysMoodRecorded => 'Today\'s mood: recorded';

  @override
  String blockerScheduleInfo(String time, String hours) {
    return 'Blocking scheduled from $time for ${hours}h daily. Blocking will end automatically.';
  }

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get privacyPolicyLastUpdated => 'Effective date: January 1, 2025';

  @override
  String get privacyPolicyIntro =>
      'Cortisol Zero (\"we\", \"our\", \"app\") is committed to protecting your privacy.';

  @override
  String get privacyPolicyDataCollectedTitle => '1. Data We Collect';

  @override
  String get privacyPolicyDataCollectedBody =>
      'Cortisol Zero does NOT collect any personal data. All data (journal entries, sleep records, breathing session history, and app-blocker schedules) is stored exclusively on your device and is never transmitted to any server.';

  @override
  String get privacyPolicyPermissionsTitle => '2. Permissions Used';

  @override
  String get privacyPolicyPermissionsBody =>
      '• Accessibility Service — detects which app is on screen (package name only) to apply your blocker schedule. It does NOT read your messages, passwords, or personal data.\n\n• Display Over Other Apps — shows a calming overlay screen when a blocked app is opened during focus hours.\n\n• Usage Stats — reads app usage data to activate blocking rules. This data stays on your device only.\n\n• Foreground Service — keeps the blocker active in the background during your scheduled focus window.\n\nNone of these permissions are used to collect, transmit, or share data with us or any third party.';

  @override
  String get privacyPolicyPurchasesTitle => '3. In-App Purchases';

  @override
  String get privacyPolicyPurchasesBody =>
      'Purchases are processed by Google Play. We do not store payment information. We receive only a purchase token to verify your PRO status.';

  @override
  String get privacyPolicyThirdPartyTitle => '4. Third-Party Services';

  @override
  String get privacyPolicyThirdPartyBody =>
      'We do not integrate analytics, advertising SDKs, or crash reporting services that collect personal data. The app contains no tracking code.';

  @override
  String get privacyPolicyChildrenTitle => '5. Children';

  @override
  String get privacyPolicyChildrenBody =>
      'Cortisol Zero does not knowingly collect information from children under 13. The app is rated for general audiences.';

  @override
  String get privacyPolicyContactTitle => '6. Contact';

  @override
  String get privacyPolicyContactBody =>
      'For privacy questions contact us at: cartizolzero@gmail.com';

  @override
  String get privacyPolicyChangesTitle => '7. Changes';

  @override
  String get privacyPolicyChangesBody =>
      'We may update this policy. Continued use of the app after updates constitutes acceptance of the revised policy.';

  @override
  String get termsTitle => 'Terms of Service';

  @override
  String get termsLastUpdated => 'Effective date: January 1, 2025';

  @override
  String get termsIntro => 'By using Cortisol Zero, you agree to these terms.';

  @override
  String get termsUseTitle => '1. Use of the App';

  @override
  String get termsUseBody =>
      'Cortisol Zero is a personal health and productivity tool. You may use it for your own stress management and focus goals. You may not reverse-engineer, distribute, or resell the app or its content.';

  @override
  String get termsProTitle => '2. PRO Subscription';

  @override
  String get termsProBody =>
      'PRO features are unlocked via an in-app purchase processed by Google Play. Subscriptions auto-renew unless cancelled at least 24 hours before the renewal date. Refunds are handled according to Google Play\'s refund policy.';

  @override
  String get termsPermissionsTitle => '3. Permissions';

  @override
  String get termsPermissionsBody =>
      'The app requires certain Android permissions (Accessibility Service, Display Over Other Apps, Usage Stats) to provide app-blocking functionality. These permissions are used solely for the stated purpose and are never used to collect personal data.';

  @override
  String get termsDisclaimerTitle => '4. Disclaimer';

  @override
  String get termsDisclaimerBody =>
      'Cortisol Zero is a wellness tool and is NOT a medical device or medical advice. Always consult a healthcare professional for medical concerns.';

  @override
  String get termsLiabilityTitle => '5. Limitation of Liability';

  @override
  String get termsLiabilityBody =>
      'We are not liable for any damages arising from the use of this app. The app is provided \"as is\" without warranty of any kind.';

  @override
  String get termsChangesTitle => '6. Changes';

  @override
  String get termsChangesBody =>
      'We may update these terms. Continued use of the app after updates constitutes acceptance.';

  @override
  String get termsContactTitle => '7. Contact';

  @override
  String get termsContactBody =>
      'For questions contact us at: cartizolzero@gmail.com';

  @override
  String get testAlarmIn1Min => 'Test alarm in 1 minute';

  @override
  String get testAlarmScheduled => 'Test alarm scheduled for 1 minute from now';

  @override
  String get blockerLockedTitle => 'Settings locked';

  @override
  String blockerLockedBody(String time) {
    return 'Focus mode is active. You can change settings after blocking ends at $time.';
  }
}
