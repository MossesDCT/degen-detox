import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('lt'),
    Locale('de'),
    Locale('ko')
  ];

  /// The application name
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero'**
  String get appName;

  /// App tagline
  ///
  /// In en, this message translates to:
  /// **'Your daily stress reduction companion'**
  String get appTagline;

  /// Bottom nav: Home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom nav: Learn
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get navLearn;

  /// Bottom nav: Breathe
  ///
  /// In en, this message translates to:
  /// **'Breathe'**
  String get navBreathe;

  /// Bottom nav: Sounds
  ///
  /// In en, this message translates to:
  /// **'Sounds'**
  String get navSounds;

  /// Bottom nav: More
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @greetingNight.
  ///
  /// In en, this message translates to:
  /// **'Good night'**
  String get greetingNight;

  /// No description provided for @dayStreak.
  ///
  /// In en, this message translates to:
  /// **'day streak'**
  String get dayStreak;

  /// No description provided for @dailyTip.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Tip'**
  String get dailyTip;

  /// No description provided for @quickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get quickAccess;

  /// No description provided for @moodCheckin.
  ///
  /// In en, this message translates to:
  /// **'Mood Check-In'**
  String get moodCheckin;

  /// No description provided for @howAreYouFeeling.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling?'**
  String get howAreYouFeeling;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @learnTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learnTitle;

  /// No description provided for @learnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Understand cortisol and how to manage it'**
  String get learnSubtitle;

  /// No description provided for @searchTopics.
  ///
  /// In en, this message translates to:
  /// **'Search topics...'**
  String get searchTopics;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @minuteRead.
  ///
  /// In en, this message translates to:
  /// **'{count} min read'**
  String minuteRead(int count);

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @nutritionGuide.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Guide'**
  String get nutritionGuide;

  /// No description provided for @antiStressFoods.
  ///
  /// In en, this message translates to:
  /// **'Anti-Stress Foods'**
  String get antiStressFoods;

  /// No description provided for @tapToLearnScience.
  ///
  /// In en, this message translates to:
  /// **'Tap any food to learn the science behind how it lowers cortisol'**
  String get tapToLearnScience;

  /// No description provided for @servingIdea.
  ///
  /// In en, this message translates to:
  /// **'Serving idea'**
  String get servingIdea;

  /// No description provided for @breatheTitle.
  ///
  /// In en, this message translates to:
  /// **'Breathe'**
  String get breatheTitle;

  /// No description provided for @breatheSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Breathing exercises lower cortisol in minutes'**
  String get breatheSubtitle;

  /// No description provided for @scienceBackedTechniques.
  ///
  /// In en, this message translates to:
  /// **'Science-backed techniques'**
  String get scienceBackedTechniques;

  /// No description provided for @vagusNerveInfo.
  ///
  /// In en, this message translates to:
  /// **'Each technique activates your vagus nerve to reduce cortisol within minutes'**
  String get vagusNerveInfo;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @phaseInhale.
  ///
  /// In en, this message translates to:
  /// **'Inhale'**
  String get phaseInhale;

  /// No description provided for @phaseHold.
  ///
  /// In en, this message translates to:
  /// **'Hold'**
  String get phaseHold;

  /// No description provided for @phaseExhale.
  ///
  /// In en, this message translates to:
  /// **'Exhale'**
  String get phaseExhale;

  /// No description provided for @sessionComplete.
  ///
  /// In en, this message translates to:
  /// **'Session Complete!'**
  String get sessionComplete;

  /// No description provided for @sessionCompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Your cortisol levels are lowering. Take a moment to notice how you feel.'**
  String get sessionCompleteMessage;

  /// No description provided for @cyclesCompleted.
  ///
  /// In en, this message translates to:
  /// **'Cycles'**
  String get cyclesCompleted;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @endSession.
  ///
  /// In en, this message translates to:
  /// **'End Session'**
  String get endSession;

  /// No description provided for @cycleOf.
  ///
  /// In en, this message translates to:
  /// **'Cycle {current} of {total}'**
  String cycleOf(int current, int total);

  /// No description provided for @soundsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sounds'**
  String get soundsTitle;

  /// No description provided for @soundsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Nature sounds to calm your nervous system'**
  String get soundsSubtitle;

  /// No description provided for @nowPlaying.
  ///
  /// In en, this message translates to:
  /// **'Now Playing: {name}'**
  String nowPlaying(String name);

  /// No description provided for @tapToPlay.
  ///
  /// In en, this message translates to:
  /// **'Tap to play'**
  String get tapToPlay;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @sleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Sleep Timer'**
  String get sleepTimer;

  /// No description provided for @audioWillStop.
  ///
  /// In en, this message translates to:
  /// **'Audio will stop automatically'**
  String get audioWillStop;

  /// No description provided for @cancelTimer.
  ///
  /// In en, this message translates to:
  /// **'Cancel Timer'**
  String get cancelTimer;

  /// No description provided for @sleepTimerSet.
  ///
  /// In en, this message translates to:
  /// **'Sleep timer: {minutes} min'**
  String sleepTimerSet(int minutes);

  /// No description provided for @journalTitle.
  ///
  /// In en, this message translates to:
  /// **'Mood Journal'**
  String get journalTitle;

  /// No description provided for @addEntry.
  ///
  /// In en, this message translates to:
  /// **'Add Entry'**
  String get addEntry;

  /// No description provided for @saveEntry.
  ///
  /// In en, this message translates to:
  /// **'Save Entry'**
  String get saveEntry;

  /// No description provided for @noEntriesThisMonth.
  ///
  /// In en, this message translates to:
  /// **'No entries this month'**
  String get noEntriesThisMonth;

  /// No description provided for @tapPlusToAdd.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first mood entry'**
  String get tapPlusToAdd;

  /// No description provided for @weeklyAverage.
  ///
  /// In en, this message translates to:
  /// **'Weekly average: {mood}'**
  String weeklyAverage(String mood);

  /// No description provided for @addNoteOptional.
  ///
  /// In en, this message translates to:
  /// **'Add a note about how you\'re feeling... (optional)'**
  String get addNoteOptional;

  /// No description provided for @moodTerrible.
  ///
  /// In en, this message translates to:
  /// **'Terrible'**
  String get moodTerrible;

  /// No description provided for @moodBad.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get moodBad;

  /// No description provided for @moodOkay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get moodOkay;

  /// No description provided for @moodGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get moodGood;

  /// No description provided for @moodGreat.
  ///
  /// In en, this message translates to:
  /// **'Great'**
  String get moodGreat;

  /// No description provided for @sleepTrackerTitle.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tracker'**
  String get sleepTrackerTitle;

  /// No description provided for @logSleep.
  ///
  /// In en, this message translates to:
  /// **'Log Sleep'**
  String get logSleep;

  /// No description provided for @sleepQuality.
  ///
  /// In en, this message translates to:
  /// **'Sleep Quality'**
  String get sleepQuality;

  /// No description provided for @bedtimeReminder.
  ///
  /// In en, this message translates to:
  /// **'Bedtime Reminder'**
  String get bedtimeReminder;

  /// No description provided for @avgQuality.
  ///
  /// In en, this message translates to:
  /// **'Avg Quality'**
  String get avgQuality;

  /// No description provided for @avgDuration.
  ///
  /// In en, this message translates to:
  /// **'Avg Duration'**
  String get avgDuration;

  /// No description provided for @tracked.
  ///
  /// In en, this message translates to:
  /// **'Tracked'**
  String get tracked;

  /// No description provided for @bedtime.
  ///
  /// In en, this message translates to:
  /// **'Bedtime'**
  String get bedtime;

  /// No description provided for @wakeTime.
  ///
  /// In en, this message translates to:
  /// **'Wake Time'**
  String get wakeTime;

  /// No description provided for @last7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get last7Days;

  /// No description provided for @recentEntries.
  ///
  /// In en, this message translates to:
  /// **'Recent Entries'**
  String get recentEntries;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @themeLabel.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @enableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get enableNotifications;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @rateApp.
  ///
  /// In en, this message translates to:
  /// **'Rate the App'**
  String get rateApp;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @proTitle.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get proTitle;

  /// No description provided for @proActive.
  ///
  /// In en, this message translates to:
  /// **'PRO — Active ✓'**
  String get proActive;

  /// No description provided for @upgradeToProCTA.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to PRO'**
  String get upgradeToProCTA;

  /// No description provided for @upgradeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock the complete stress reduction toolkit'**
  String get upgradeSubtitle;

  /// No description provided for @proPrice.
  ///
  /// In en, this message translates to:
  /// **'USD 6.50 one-time'**
  String get proPrice;

  /// No description provided for @oneTimePayment.
  ///
  /// In en, this message translates to:
  /// **'One-time payment • Lifetime access'**
  String get oneTimePayment;

  /// No description provided for @noSubscription.
  ///
  /// In en, this message translates to:
  /// **'No subscription, no recurring charges'**
  String get noSubscription;

  /// No description provided for @unlockPro.
  ///
  /// In en, this message translates to:
  /// **'Unlock PRO — {price}'**
  String unlockPro(String price);

  /// No description provided for @restorePurchases.
  ///
  /// In en, this message translates to:
  /// **'Restore Purchases'**
  String get restorePurchases;

  /// No description provided for @proThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your support!'**
  String get proThankYou;

  /// No description provided for @youHavePro.
  ///
  /// In en, this message translates to:
  /// **'You have PRO!'**
  String get youHavePro;

  /// No description provided for @proFeaturesUnlocked.
  ///
  /// In en, this message translates to:
  /// **'All PRO features are unlocked.'**
  String get proFeaturesUnlocked;

  /// No description provided for @awesome.
  ///
  /// In en, this message translates to:
  /// **'Awesome!'**
  String get awesome;

  /// No description provided for @checkingPurchases.
  ///
  /// In en, this message translates to:
  /// **'Checking for purchases...'**
  String get checkingPurchases;

  /// No description provided for @recipeBook.
  ///
  /// In en, this message translates to:
  /// **'Recipe Book'**
  String get recipeBook;

  /// No description provided for @recipes22.
  ///
  /// In en, this message translates to:
  /// **'22 cortisol-lowering recipes'**
  String get recipes22;

  /// No description provided for @searchRecipes.
  ///
  /// In en, this message translates to:
  /// **'Search recipes...'**
  String get searchRecipes;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @instructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get instructions;

  /// No description provided for @whyItWorks.
  ///
  /// In en, this message translates to:
  /// **'Why It Works'**
  String get whyItWorks;

  /// No description provided for @servings.
  ///
  /// In en, this message translates to:
  /// **'{count} servings'**
  String servings(int count);

  /// No description provided for @prepTime.
  ///
  /// In en, this message translates to:
  /// **'Prep: {time}'**
  String prepTime(String time);

  /// No description provided for @totalTime.
  ///
  /// In en, this message translates to:
  /// **'Total: {time}'**
  String totalTime(String time);

  /// No description provided for @meditationLibrary.
  ///
  /// In en, this message translates to:
  /// **'Meditation Library'**
  String get meditationLibrary;

  /// No description provided for @guidedMeditations.
  ///
  /// In en, this message translates to:
  /// **'Guided meditations for stress'**
  String get guidedMeditations;

  /// No description provided for @appBlocker.
  ///
  /// In en, this message translates to:
  /// **'App Blocker'**
  String get appBlocker;

  /// No description provided for @morningFocusMode.
  ///
  /// In en, this message translates to:
  /// **'Morning Focus Mode'**
  String get morningFocusMode;

  /// No description provided for @enableAppBlocker.
  ///
  /// In en, this message translates to:
  /// **'Enable App Blocker'**
  String get enableAppBlocker;

  /// No description provided for @blockDuration.
  ///
  /// In en, this message translates to:
  /// **'Block Duration'**
  String get blockDuration;

  /// No description provided for @grantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @unlockWithBreathing.
  ///
  /// In en, this message translates to:
  /// **'Complete a 5-minute breathing exercise to unlock'**
  String get unlockWithBreathing;

  /// No description provided for @moodInsights.
  ///
  /// In en, this message translates to:
  /// **'AI Mood Insights'**
  String get moodInsights;

  /// No description provided for @weeklyPatternAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Weekly mood pattern analysis'**
  String get weeklyPatternAnalysis;

  /// No description provided for @stressLevel.
  ///
  /// In en, this message translates to:
  /// **'Stress Level'**
  String get stressLevel;

  /// No description provided for @avgMood.
  ///
  /// In en, this message translates to:
  /// **'Avg Mood'**
  String get avgMood;

  /// No description provided for @trend.
  ///
  /// In en, this message translates to:
  /// **'Trend'**
  String get trend;

  /// No description provided for @weeklyMoodTrend.
  ///
  /// In en, this message translates to:
  /// **'Weekly Mood Trend'**
  String get weeklyMoodTrend;

  /// No description provided for @aiDetectedPatterns.
  ///
  /// In en, this message translates to:
  /// **'AI-Detected Patterns'**
  String get aiDetectedPatterns;

  /// No description provided for @weeklyPersonalizedTip.
  ///
  /// In en, this message translates to:
  /// **'Weekly Personalized Tip'**
  String get weeklyPersonalizedTip;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to\nCortisol Zero'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your daily companion for managing stress and building a calmer, healthier life.'**
  String get onboarding1Subtitle;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Understand\nYour Stress'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Cortisol is your stress hormone. When chronically elevated, it affects your health, mood, and sleep.'**
  String get onboarding2Subtitle;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Your Journey\nBegins Now'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Just 5 minutes a day with Cortisol Zero can measurably lower your stress levels within weeks.'**
  String get onboarding3Subtitle;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @moreTitle.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get moreTitle;

  /// No description provided for @toolsSection.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get toolsSection;

  /// No description provided for @proFeaturesSection.
  ///
  /// In en, this message translates to:
  /// **'PRO Features'**
  String get proFeaturesSection;

  /// No description provided for @unlockCortisolZeroPro.
  ///
  /// In en, this message translates to:
  /// **'Unlock Cortisol Zero PRO'**
  String get unlockCortisolZeroPro;

  /// No description provided for @unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @scienceBacked.
  ///
  /// In en, this message translates to:
  /// **'Science-backed cortisol reducer'**
  String get scienceBacked;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get free;

  /// No description provided for @whatYouGet.
  ///
  /// In en, this message translates to:
  /// **'What you get'**
  String get whatYouGet;

  /// No description provided for @scheduledAt.
  ///
  /// In en, this message translates to:
  /// **'Scheduled: {time}'**
  String scheduledAt(String time);

  /// No description provided for @dailyTipBadge.
  ///
  /// In en, this message translates to:
  /// **'Daily Tip'**
  String get dailyTipBadge;

  /// No description provided for @journalLabel.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get journalLabel;

  /// No description provided for @featureNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get featureNutrition;

  /// No description provided for @featureNutritionSub.
  ///
  /// In en, this message translates to:
  /// **'20 anti-stress foods'**
  String get featureNutritionSub;

  /// No description provided for @featureSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get featureSleep;

  /// No description provided for @featureSleepSub.
  ///
  /// In en, this message translates to:
  /// **'Track & improve'**
  String get featureSleepSub;

  /// No description provided for @nutritionBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Anti-Stress Nutrition Guide'**
  String get nutritionBannerTitle;

  /// No description provided for @nutritionBannerSub.
  ///
  /// In en, this message translates to:
  /// **'20+ cortisol-lowering foods'**
  String get nutritionBannerSub;

  /// No description provided for @minRead.
  ///
  /// In en, this message translates to:
  /// **'{count} min read'**
  String minRead(int count);

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterBasics.
  ///
  /// In en, this message translates to:
  /// **'Basics'**
  String get filterBasics;

  /// No description provided for @filterScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get filterScience;

  /// No description provided for @filterImpact.
  ///
  /// In en, this message translates to:
  /// **'Impact'**
  String get filterImpact;

  /// No description provided for @filterReduce.
  ///
  /// In en, this message translates to:
  /// **'Reduce'**
  String get filterReduce;

  /// No description provided for @filterLifestyle.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get filterLifestyle;

  /// No description provided for @filterNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get filterNutrition;

  /// No description provided for @filterSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get filterSleep;

  /// No description provided for @filterMind.
  ///
  /// In en, this message translates to:
  /// **'Mind'**
  String get filterMind;

  /// No description provided for @catBasics.
  ///
  /// In en, this message translates to:
  /// **'The Basics'**
  String get catBasics;

  /// No description provided for @catScience.
  ///
  /// In en, this message translates to:
  /// **'The Science'**
  String get catScience;

  /// No description provided for @catImpact.
  ///
  /// In en, this message translates to:
  /// **'Health Impact'**
  String get catImpact;

  /// No description provided for @catReduction.
  ///
  /// In en, this message translates to:
  /// **'Reduction Tips'**
  String get catReduction;

  /// No description provided for @catLifestyle.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get catLifestyle;

  /// No description provided for @catNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get catNutrition;

  /// No description provided for @catSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get catSleep;

  /// No description provided for @catExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get catExercise;

  /// No description provided for @catMindfulness.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness'**
  String get catMindfulness;

  /// No description provided for @dailyTip0.
  ///
  /// In en, this message translates to:
  /// **'Take 5 deep breaths right now. Each long exhale activates your vagus nerve and lowers cortisol within 60 seconds.'**
  String get dailyTip0;

  /// No description provided for @dailyTip1.
  ///
  /// In en, this message translates to:
  /// **'Drink a glass of cold water. Mild dehydration increases cortisol by up to 33%. Hydration is stress management.'**
  String get dailyTip1;

  /// No description provided for @dailyTip2.
  ///
  /// In en, this message translates to:
  /// **'Go outside for 10 minutes. Natural light and greenery reduce cortisol measurably — even a short walk works.'**
  String get dailyTip2;

  /// No description provided for @dailyTip3.
  ///
  /// In en, this message translates to:
  /// **'Put your phone down for 30 minutes. Every notification triggers a micro cortisol spike. Give your nervous system a rest.'**
  String get dailyTip3;

  /// No description provided for @dailyTip4.
  ///
  /// In en, this message translates to:
  /// **'Have a handful of almonds or dark chocolate. Magnesium and flavanols directly suppress the HPA axis.'**
  String get dailyTip4;

  /// No description provided for @dailyTip5.
  ///
  /// In en, this message translates to:
  /// **'Write down 3 things you\'re grateful for. Just 5 minutes of gratitude journaling reduces cortisol by 23%.'**
  String get dailyTip5;

  /// No description provided for @dailyTip6.
  ///
  /// In en, this message translates to:
  /// **'Listen to calm music. Music at 432Hz resonance has been shown to lower cortisol and slow heart rate.'**
  String get dailyTip6;

  /// No description provided for @dailyTip7.
  ///
  /// In en, this message translates to:
  /// **'Spend time with someone you care about. Oxytocin from positive social contact directly inhibits cortisol.'**
  String get dailyTip7;

  /// No description provided for @dailyTip8.
  ///
  /// In en, this message translates to:
  /// **'Try 4-7-8 breathing before your next stressful task. 4 counts in, hold 7, exhale 8. Natural tranquilizer.'**
  String get dailyTip8;

  /// No description provided for @dailyTip9.
  ///
  /// In en, this message translates to:
  /// **'Eat breakfast within 90 minutes of waking. Skipping breakfast triggers cortisol spikes to maintain blood sugar.'**
  String get dailyTip9;

  /// No description provided for @dailyTip10.
  ///
  /// In en, this message translates to:
  /// **'Set a screen curfew 1 hour before bed. Blue light suppresses melatonin and keeps cortisol elevated at night.'**
  String get dailyTip10;

  /// No description provided for @dailyTip11.
  ///
  /// In en, this message translates to:
  /// **'Move your body for 20 minutes. Moderate exercise creates a \"cortisol dividend\" — levels drop below baseline for hours afterward.'**
  String get dailyTip11;

  /// No description provided for @dailyTip12.
  ///
  /// In en, this message translates to:
  /// **'Make a cup of chamomile or green tea. L-theanine in green tea promotes calm alertness; chamomile\'s apigenin binds GABA receptors.'**
  String get dailyTip12;

  /// No description provided for @dailyTip13.
  ///
  /// In en, this message translates to:
  /// **'Practice progressive muscle relaxation. Tense and release each muscle group. This directly activates the parasympathetic nervous system.'**
  String get dailyTip13;

  /// No description provided for @eduTitle000.
  ///
  /// In en, this message translates to:
  /// **'What Is Cortisol?'**
  String get eduTitle000;

  /// No description provided for @eduTitle001.
  ///
  /// In en, this message translates to:
  /// **'The Cortisol Rhythm'**
  String get eduTitle001;

  /// No description provided for @eduTitle002.
  ///
  /// In en, this message translates to:
  /// **'The HPA Axis Explained'**
  String get eduTitle002;

  /// No description provided for @eduTitle003.
  ///
  /// In en, this message translates to:
  /// **'Cortisol vs. Adrenaline'**
  String get eduTitle003;

  /// No description provided for @eduTitle004.
  ///
  /// In en, this message translates to:
  /// **'How High Cortisol Affects Your Body'**
  String get eduTitle004;

  /// No description provided for @eduTitle005.
  ///
  /// In en, this message translates to:
  /// **'Cortisol and Your Mood'**
  String get eduTitle005;

  /// No description provided for @eduTitle006.
  ///
  /// In en, this message translates to:
  /// **'Deep Breathing: The Fastest Fix'**
  String get eduTitle006;

  /// No description provided for @eduTitle007.
  ///
  /// In en, this message translates to:
  /// **'The Power of Nature'**
  String get eduTitle007;

  /// No description provided for @eduTitle008.
  ///
  /// In en, this message translates to:
  /// **'Exercise: Timing Matters'**
  String get eduTitle008;

  /// No description provided for @eduTitle009.
  ///
  /// In en, this message translates to:
  /// **'Social Connection Lowers Cortisol'**
  String get eduTitle009;

  /// No description provided for @eduTitle010.
  ///
  /// In en, this message translates to:
  /// **'Sleep and Cortisol: The Vicious Cycle'**
  String get eduTitle010;

  /// No description provided for @eduTitle011.
  ///
  /// In en, this message translates to:
  /// **'Yoga and the Stress Response'**
  String get eduTitle011;

  /// No description provided for @eduTitle012.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness Meditation: Proven Results'**
  String get eduTitle012;

  /// No description provided for @eduTitle013.
  ///
  /// In en, this message translates to:
  /// **'Foods That Raise Cortisol'**
  String get eduTitle013;

  /// No description provided for @eduTitle014.
  ///
  /// In en, this message translates to:
  /// **'The Gut-Brain-Cortisol Connection'**
  String get eduTitle014;

  /// No description provided for @eduTitle015.
  ///
  /// In en, this message translates to:
  /// **'Magnesium: The Anti-Stress Mineral'**
  String get eduTitle015;

  /// No description provided for @eduTitle016.
  ///
  /// In en, this message translates to:
  /// **'Journaling as Cortisol Medicine'**
  String get eduTitle016;

  /// No description provided for @eduContent000.
  ///
  /// In en, this message translates to:
  /// **'Cortisol is your body\'s primary stress hormone, produced by the adrenal glands sitting atop your kidneys. Often called the \"stress hormone,\" it plays a vital role in your body\'s fight-or-flight response.\n\nWhen you face a stressful situation, your brain\'s hypothalamus triggers a cascade of signals that leads to cortisol release. This prepares your body to either fight or flee — increasing heart rate, blood pressure, and blood sugar.\n\nIn healthy amounts, cortisol is essential for life. It helps regulate metabolism, reduces inflammation, and assists with memory formation. The problem arises when cortisol levels remain chronically elevated due to ongoing stress.'**
  String get eduContent000;

  /// No description provided for @eduContent001.
  ///
  /// In en, this message translates to:
  /// **'Cortisol follows a natural daily rhythm called the diurnal cortisol pattern. Levels are typically highest in the morning (around 8 AM), which helps you wake up and feel alert. They gradually decline throughout the day, reaching their lowest point around midnight.\n\nThis is called the Cortisol Awakening Response (CAR). A healthy CAR sees cortisol spike 50-160% within 30 minutes of waking — nature\'s own alarm clock.\n\nModern lifestyles disrupt this rhythm through poor sleep, chronic stress, artificial light at night, and irregular meal times. When the rhythm is disrupted, you may feel exhausted in the morning and wired at night.'**
  String get eduContent001;

  /// No description provided for @eduContent002.
  ///
  /// In en, this message translates to:
  /// **'The Hypothalamic-Pituitary-Adrenal (HPA) axis is your body\'s central stress response system. Here\'s how it works:\n\n1. **Hypothalamus** detects stress and releases CRH (corticotropin-releasing hormone)\n2. **Pituitary gland** receives CRH and releases ACTH (adrenocorticotropic hormone)\n3. **Adrenal glands** receive ACTH and produce cortisol\n4. **Negative feedback loop**: when cortisol is high enough, it signals the hypothalamus to slow down production\n\nChronic stress can dysregulate this feedback loop, leading to persistently elevated cortisol that the body can no longer properly suppress.'**
  String get eduContent002;

  /// No description provided for @eduContent003.
  ///
  /// In en, this message translates to:
  /// **'Many people confuse cortisol with adrenaline (epinephrine). While both are stress hormones, they work differently:\n\n**Adrenaline** is fast — it kicks in within seconds during acute stress, causing your heart to race and palms to sweat. Its effects fade quickly.\n\n**Cortisol** is slow — it takes minutes to mobilize but its effects last for hours or days. It\'s designed for sustained threats, not sudden ones.\n\nThe modern problem is that our psychological stressors (deadlines, traffic, social media) continuously activate the cortisol pathway — keeping it elevated as if we were constantly facing a predator.'**
  String get eduContent003;

  /// No description provided for @eduContent004.
  ///
  /// In en, this message translates to:
  /// **'Chronically elevated cortisol has far-reaching consequences:\n\n🩺 **Immune system**: Suppresses immune response, making you more susceptible to illness\n⚖️ **Weight**: Promotes fat storage, especially visceral belly fat\n💤 **Sleep**: Disrupts sleep cycles, causing insomnia\n🧠 **Brain**: Impairs memory and concentration; can shrink the hippocampus over time\n❤️ **Heart**: Raises blood pressure and increases cardiovascular risk\n🦴 **Bones**: Reduces bone density\n🩸 **Blood sugar**: Causes insulin resistance\n\nThe good news? These effects are largely reversible with proper stress management.'**
  String get eduContent004;

  /// No description provided for @eduContent005.
  ///
  /// In en, this message translates to:
  /// **'The link between cortisol and mental health is profound. High cortisol is associated with:\n\n**Anxiety**: Cortisol amplifies the amygdala\'s threat-detection, making everything feel more dangerous.\n\n**Depression**: Chronically high cortisol reduces serotonin and dopamine — the \"feel-good\" neurotransmitters.\n\n**Brain fog**: Cortisol competes with glucose in the prefrontal cortex, impairing clear thinking, decision-making, and focus.\n\n**Emotional reactivity**: You become more easily triggered by minor frustrations.\n\nInterestingly, very low cortisol (adrenal fatigue) can also cause depression and extreme fatigue — balance is key.'**
  String get eduContent005;

  /// No description provided for @eduContent006.
  ///
  /// In en, this message translates to:
  /// **'Deep, diaphragmatic breathing is one of the most powerful and immediate ways to lower cortisol. Here\'s the science:\n\nWhen you breathe slowly and deeply, you activate the parasympathetic nervous system — the \"rest and digest\" response that directly counters the stress response.\n\nThe vagus nerve, which runs from your brain to your gut, is stimulated by deep breathing. This sends a \"safety\" signal throughout your body, dropping cortisol levels within minutes.\n\n**The 4-7-8 technique**: Inhale for 4 seconds, hold for 7, exhale for 8. The extended exhale is key — it activates the vagal brake on your stress response.'**
  String get eduContent006;

  /// No description provided for @eduContent007.
  ///
  /// In en, this message translates to:
  /// **'Spending time in nature is scientifically proven to lower cortisol. A Japanese practice called \"Shinrin-yoku\" (forest bathing) has been extensively studied:\n\n🌿 Just 20 minutes in a forest reduces cortisol by 15.8%\n🌳 Green spaces lower both salivary cortisol and heart rate\n🌊 Blue spaces (water environments) have similar effects\n🌸 Even viewing nature images reduces stress markers\n\nYou don\'t need a forest. Even a 10-minute walk in a local park, tending houseplants, or sitting by a window with a garden view activates nature\'s calming effect on your HPA axis.'**
  String get eduContent007;

  /// No description provided for @eduContent008.
  ///
  /// In en, this message translates to:
  /// **'Exercise is a double-edged sword with cortisol. Understanding this helps you optimize your workouts:\n\n**During exercise**: Cortisol rises to mobilize energy — this is healthy and normal.\n\n**After moderate exercise**: Cortisol drops below baseline for hours, providing a \"cortisol dividend.\"\n\n**Over-training**: Excessive high-intensity exercise keeps cortisol chronically elevated. More isn\'t always better.\n\n**Best practices for cortisol balance**:\n• Morning moderate cardio (30-45 min) is optimal\n• Avoid intense training late at night\n• Incorporate rest days — they\'re when adaptation happens\n• Yoga and tai chi are especially effective at lowering cortisol'**
  String get eduContent008;

  /// No description provided for @eduContent009.
  ///
  /// In en, this message translates to:
  /// **'Human connection is a powerful cortisol buffer. Research shows:\n\n• **Oxytocin** (the \"bonding hormone\") directly inhibits cortisol release\n• People with strong social support have 25% lower cortisol responses to stress\n• Even brief, positive social interactions lower cortisol\n• Pet ownership significantly reduces cortisol — petting a dog for 10 minutes lowers cortisol by measurable amounts\n• Loneliness, conversely, elevates cortisol — it\'s perceived as a survival threat\n\nThis is why isolation is so physically harmful. Your body genuinely needs social contact to regulate its stress response.'**
  String get eduContent009;

  /// No description provided for @eduContent010.
  ///
  /// In en, this message translates to:
  /// **'High cortisol and poor sleep form a dangerous feedback loop:\n\n**High cortisol → poor sleep**: Cortisol is stimulating. When elevated at night, it prevents the brain from reaching deep, restorative sleep stages.\n\n**Poor sleep → high cortisol**: Even one night of poor sleep raises cortisol by 37% the following day.\n\n**Breaking the cycle**:\n✓ Keep a consistent sleep/wake schedule (even weekends)\n✓ Avoid screens 1 hour before bed — blue light suppresses melatonin\n✓ Keep your bedroom cool (65-68°F / 18-20°C is optimal)\n✓ Avoid caffeine after 2 PM\n✓ Practice a wind-down routine (reading, gentle stretching, breathwork)'**
  String get eduContent010;

  /// No description provided for @eduContent011.
  ///
  /// In en, this message translates to:
  /// **'Yoga is one of the most well-studied interventions for cortisol reduction:\n\n**Studies show** that 8 weeks of regular yoga practice reduces morning cortisol by up to 30%.\n\n**Why yoga works**:\n• Combines breathing, movement, and mindfulness — triple cortisol-lowering effect\n• Activates the parasympathetic nervous system through conscious breathing\n• Reduces amygdala reactivity (makes you less easily triggered)\n• Improves GABA levels — the brain\'s calming neurotransmitter\n\n**Best styles for cortisol**: Hatha, Yin, Restorative, and Yoga Nidra (yogic sleep) are particularly effective. Even 10 minutes of gentle yoga before bed can transform sleep quality.'**
  String get eduContent011;

  /// No description provided for @eduContent012.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness-Based Stress Reduction (MBSR) has been rigorously studied since the 1970s. The results are compelling:\n\n🧪 **8 weeks** of MBSR reduces cortisol by 20-25%\n🧠 **Changes brain structure**: Grows the prefrontal cortex (rational thinking) while shrinking the amygdala (fear center)\n💊 **Equivalent to medication** for mild-moderate anxiety in multiple trials\n❤️ **Reduces inflammation** markers (CRP, IL-6) that are linked to cortisol\n\nYou don\'t need hours. Research shows that **10 minutes daily** of focused mindfulness practice produces measurable cortisol reductions within 4 weeks.'**
  String get eduContent012;

  /// No description provided for @eduContent013.
  ///
  /// In en, this message translates to:
  /// **'Your diet directly influences cortisol. These foods can spike stress hormones:\n\n☕ **Caffeine**: Raises cortisol by 30% even in coffee-habituated individuals. Decaf doesn\'t fully solve it — wait 90 minutes after waking before your first cup.\n\n🍬 **Sugar spikes**: Rapid glucose swings trigger cortisol release. Choose low-glycemic foods.\n\n🥃 **Alcohol**: Initially sedating, alcohol disrupts sleep architecture and elevates cortisol the next day.\n\n🔥 **Inflammatory foods**: Trans fats, processed vegetable oils, and ultra-processed foods increase systemic inflammation, which elevates cortisol.\n\n🧂 **Excess sodium**: A high-sodium diet is linked to elevated cortisol levels in multiple studies.'**
  String get eduContent013;

  /// No description provided for @eduContent014.
  ///
  /// In en, this message translates to:
  /// **'Your gut microbiome has a direct line to your stress response — the gut-brain axis:\n\n🦠 **Gut bacteria produce neurotransmitters**: 90% of serotonin is made in your gut. Imbalanced gut flora means less serotonin, more stress vulnerability.\n\n🔗 **The vagus nerve** connects gut to brain — gut inflammation directly activates the HPA axis.\n\n🥛 **Probiotics lower cortisol**: Studies show Lactobacillus rhamnosus supplementation reduces anxiety and cortisol response to stress.\n\n**Foods for a healthy gut microbiome**:\n• Fermented foods (kefir, yogurt, kimchi, sauerkraut)\n• Prebiotic fiber (garlic, onions, oats, bananas)\n• Polyphenol-rich foods (berries, dark chocolate, green tea)'**
  String get eduContent014;

  /// No description provided for @eduContent015.
  ///
  /// In en, this message translates to:
  /// **'Magnesium is often called \"nature\'s tranquilizer\" — and for good reason:\n\n**The cortisol connection**: Magnesium regulates the HPA axis. Deficiency allows cortisol to run unchecked, while adequate magnesium puts the brakes on excessive cortisol release.\n\n**The deficiency epidemic**: Up to 68% of Americans are magnesium-deficient. Chronic stress itself depletes magnesium — creating a vicious cycle.\n\n**Signs of deficiency**: Anxiety, muscle tension, poor sleep, irritability, headaches, sugar cravings.\n\n**Top food sources**: Dark leafy greens (spinach, kale), pumpkin seeds, almonds, avocado, dark chocolate, legumes, whole grains.\n\n**Supplementation**: Magnesium glycinate and magnesium threonate have the best absorption and brain-penetrating effects.'**
  String get eduContent015;

  /// No description provided for @eduContent016.
  ///
  /// In en, this message translates to:
  /// **'Writing about your emotions is clinically proven to lower cortisol:\n\n📝 **Expressive writing** (writing about stressful experiences) reduces cortisol response in subsequent stressors\n\n🧠 **Why it works**: Writing activates the prefrontal cortex (rational brain), which can then regulate the amygdala (emotional brain) — turning down the cortisol tap\n\n💙 **Gratitude journaling** is particularly powerful: Even brief daily gratitude writing reduces cortisol by 23% (UCDavis research)\n\n**Getting started**: Just 15 minutes, 3 days per week. Don\'t edit, just write. Focus on both what happened and how you felt about it.\n\nThis app\'s journal feature is designed exactly for this purpose — your daily entries accumulate into a powerful self-awareness practice.'**
  String get eduContent016;

  /// No description provided for @nutFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get nutFilterAll;

  /// No description provided for @nutFilterFruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get nutFilterFruits;

  /// No description provided for @nutFilterVegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get nutFilterVegetables;

  /// No description provided for @nutFilterProteins.
  ///
  /// In en, this message translates to:
  /// **'Proteins'**
  String get nutFilterProteins;

  /// No description provided for @nutFilterBeverages.
  ///
  /// In en, this message translates to:
  /// **'Beverages'**
  String get nutFilterBeverages;

  /// No description provided for @nutFilterNutsSeeds.
  ///
  /// In en, this message translates to:
  /// **'Nuts & Seeds'**
  String get nutFilterNutsSeeds;

  /// No description provided for @nutFilterGrains.
  ///
  /// In en, this message translates to:
  /// **'Grains'**
  String get nutFilterGrains;

  /// No description provided for @nutFilterDairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get nutFilterDairy;

  /// No description provided for @nutFilterSpices.
  ///
  /// In en, this message translates to:
  /// **'Spices'**
  String get nutFilterSpices;

  /// No description provided for @nutCatFruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get nutCatFruits;

  /// No description provided for @nutCatVegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get nutCatVegetables;

  /// No description provided for @nutCatProteins.
  ///
  /// In en, this message translates to:
  /// **'Proteins'**
  String get nutCatProteins;

  /// No description provided for @nutCatBeverages.
  ///
  /// In en, this message translates to:
  /// **'Beverages'**
  String get nutCatBeverages;

  /// No description provided for @nutCatNutsSeeds.
  ///
  /// In en, this message translates to:
  /// **'Nuts & Seeds'**
  String get nutCatNutsSeeds;

  /// No description provided for @nutCatGrains.
  ///
  /// In en, this message translates to:
  /// **'Grains'**
  String get nutCatGrains;

  /// No description provided for @nutCatDairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get nutCatDairy;

  /// No description provided for @nutCatSpices.
  ///
  /// In en, this message translates to:
  /// **'Spices'**
  String get nutCatSpices;

  /// No description provided for @foodName000.
  ///
  /// In en, this message translates to:
  /// **'Blueberries'**
  String get foodName000;

  /// No description provided for @foodBenefit000.
  ///
  /// In en, this message translates to:
  /// **'Powerful antioxidants reduce oxidative stress'**
  String get foodBenefit000;

  /// No description provided for @foodMechanism000.
  ///
  /// In en, this message translates to:
  /// **'Rich in anthocyanins that cross the blood-brain barrier, reducing neuroinflammation and cortisol-induced oxidative damage. Studies show blueberry extract lowers cortisol response after acute stress.'**
  String get foodMechanism000;

  /// No description provided for @foodServing000.
  ///
  /// In en, this message translates to:
  /// **'Add a handful to overnight oats or blend into a smoothie'**
  String get foodServing000;

  /// No description provided for @foodNutrients000.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C, Anthocyanins, Fiber, Vitamin K'**
  String get foodNutrients000;

  /// No description provided for @foodName001.
  ///
  /// In en, this message translates to:
  /// **'Bananas'**
  String get foodName001;

  /// No description provided for @foodBenefit001.
  ///
  /// In en, this message translates to:
  /// **'Potassium lowers blood pressure; tryptophan boosts serotonin'**
  String get foodBenefit001;

  /// No description provided for @foodMechanism001.
  ///
  /// In en, this message translates to:
  /// **'Bananas contain tryptophan, a precursor to serotonin — the calming neurotransmitter that modulates cortisol. Potassium counteracts cortisol\'s effect on blood pressure. The natural sugars provide quick energy without a cortisol spike.'**
  String get foodMechanism001;

  /// No description provided for @foodServing001.
  ///
  /// In en, this message translates to:
  /// **'Slice onto almond butter toast for a perfect stress-busting snack'**
  String get foodServing001;

  /// No description provided for @foodNutrients001.
  ///
  /// In en, this message translates to:
  /// **'Potassium, Tryptophan, Vitamin B6, Magnesium'**
  String get foodNutrients001;

  /// No description provided for @foodName002.
  ///
  /// In en, this message translates to:
  /// **'Oranges'**
  String get foodName002;

  /// No description provided for @foodBenefit002.
  ///
  /// In en, this message translates to:
  /// **'High vitamin C directly reduces cortisol'**
  String get foodBenefit002;

  /// No description provided for @foodMechanism002.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C is consumed rapidly by the adrenal glands during cortisol production. Supplementing vitamin C reduces cortisol response to psychological stressors. A 2001 German study found 1000mg vitamin C reduced cortisol and blood pressure during public speaking tests.'**
  String get foodMechanism002;

  /// No description provided for @foodServing002.
  ///
  /// In en, this message translates to:
  /// **'Eat the whole fruit (not juice) for fiber benefit; have before stressful events'**
  String get foodServing002;

  /// No description provided for @foodNutrients002.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C, Folate, Potassium, Flavonoids'**
  String get foodNutrients002;

  /// No description provided for @foodName003.
  ///
  /// In en, this message translates to:
  /// **'Avocados'**
  String get foodName003;

  /// No description provided for @foodBenefit003.
  ///
  /// In en, this message translates to:
  /// **'Healthy fats reduce stress inflammation'**
  String get foodBenefit003;

  /// No description provided for @foodMechanism003.
  ///
  /// In en, this message translates to:
  /// **'Avocados are rich in monounsaturated fats that support adrenal health and reduce inflammatory cytokines linked to HPA axis activation. B vitamins (B5, B6) support adrenal hormone production. Magnesium directly modulates the HPA axis.'**
  String get foodMechanism003;

  /// No description provided for @foodServing003.
  ///
  /// In en, this message translates to:
  /// **'Top salmon or eggs with sliced avocado; add to smoothies for creaminess'**
  String get foodServing003;

  /// No description provided for @foodNutrients003.
  ///
  /// In en, this message translates to:
  /// **'Magnesium, B5 (Pantothenic Acid), B6, Monounsaturated Fats, Potassium'**
  String get foodNutrients003;

  /// No description provided for @foodName004.
  ///
  /// In en, this message translates to:
  /// **'Spinach'**
  String get foodName004;

  /// No description provided for @foodBenefit004.
  ///
  /// In en, this message translates to:
  /// **'Magnesium-rich — nature\'s tranquilizer'**
  String get foodBenefit004;

  /// No description provided for @foodMechanism004.
  ///
  /// In en, this message translates to:
  /// **'Spinach is one of the richest food sources of magnesium, which regulates the HPA axis and inhibits excessive cortisol release. Magnesium deficiency is directly linked to elevated cortisol. Folate in spinach also supports GABA production — the brain\'s calming neurotransmitter.'**
  String get foodMechanism004;

  /// No description provided for @foodServing004.
  ///
  /// In en, this message translates to:
  /// **'Sauté with garlic as a side dish or blend raw into morning smoothies (taste is masked)'**
  String get foodServing004;

  /// No description provided for @foodNutrients004.
  ///
  /// In en, this message translates to:
  /// **'Magnesium, Folate, Iron, Vitamin K, Vitamin C'**
  String get foodNutrients004;

  /// No description provided for @foodName005.
  ///
  /// In en, this message translates to:
  /// **'Sweet Potatoes'**
  String get foodName005;

  /// No description provided for @foodBenefit005.
  ///
  /// In en, this message translates to:
  /// **'Sustained energy prevents cortisol spikes from blood sugar crashes'**
  String get foodBenefit005;

  /// No description provided for @foodMechanism005.
  ///
  /// In en, this message translates to:
  /// **'Sweet potatoes provide slow-releasing complex carbohydrates that prevent the blood sugar crashes that trigger cortisol release. The purple varieties are especially high in anthocyanins. High potassium content helps counteract cortisol\'s blood pressure effects.'**
  String get foodMechanism005;

  /// No description provided for @foodServing005.
  ///
  /// In en, this message translates to:
  /// **'Roast with olive oil and cinnamon; mash as a side dish or base for Buddha bowls'**
  String get foodServing005;

  /// No description provided for @foodNutrients005.
  ///
  /// In en, this message translates to:
  /// **'Potassium, Vitamin A, Fiber, Vitamin C, Manganese'**
  String get foodNutrients005;

  /// No description provided for @foodName006.
  ///
  /// In en, this message translates to:
  /// **'Broccoli'**
  String get foodName006;

  /// No description provided for @foodBenefit006.
  ///
  /// In en, this message translates to:
  /// **'Sulforaphane protects against stress-induced brain damage'**
  String get foodBenefit006;

  /// No description provided for @foodMechanism006.
  ///
  /// In en, this message translates to:
  /// **'Sulforaphane in broccoli activates Nrf2 — the body\'s master antioxidant switch — protecting neurons from cortisol-induced oxidative stress. Broccoli is also rich in vitamin C, magnesium, and folate, all direct cortisol modulators.'**
  String get foodMechanism006;

  /// No description provided for @foodServing006.
  ///
  /// In en, this message translates to:
  /// **'Steam lightly to preserve sulforaphane; top with lemon and olive oil'**
  String get foodServing006;

  /// No description provided for @foodNutrients006.
  ///
  /// In en, this message translates to:
  /// **'Sulforaphane, Vitamin C, Folate, Calcium, Fiber'**
  String get foodNutrients006;

  /// No description provided for @foodName007.
  ///
  /// In en, this message translates to:
  /// **'Salmon'**
  String get foodName007;

  /// No description provided for @foodBenefit007.
  ///
  /// In en, this message translates to:
  /// **'Omega-3 fats directly suppress cortisol production'**
  String get foodBenefit007;

  /// No description provided for @foodMechanism007.
  ///
  /// In en, this message translates to:
  /// **'EPA and DHA (omega-3 fatty acids) in salmon reduce cortisol in two ways: they decrease hypothalamic CRH release, and they reduce neuroinflammation that amplifies stress responses. Studies show regular omega-3 intake reduces cortisol reactivity by up to 22%.'**
  String get foodMechanism007;

  /// No description provided for @foodServing007.
  ///
  /// In en, this message translates to:
  /// **'Bake with lemon and herbs 2-3x per week; pair with leafy greens and avocado'**
  String get foodServing007;

  /// No description provided for @foodNutrients007.
  ///
  /// In en, this message translates to:
  /// **'EPA/DHA Omega-3, Vitamin D, B12, Selenium, Protein'**
  String get foodNutrients007;

  /// No description provided for @foodName008.
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get foodName008;

  /// No description provided for @foodBenefit008.
  ///
  /// In en, this message translates to:
  /// **'Tryptophan raises serotonin to buffer stress'**
  String get foodBenefit008;

  /// No description provided for @foodMechanism008.
  ///
  /// In en, this message translates to:
  /// **'Turkey is exceptionally rich in tryptophan, which the body converts to serotonin and melatonin. Serotonin modulates cortisol release and promotes emotional regulation. The B vitamins in turkey also support adrenal function.'**
  String get foodMechanism008;

  /// No description provided for @foodServing008.
  ///
  /// In en, this message translates to:
  /// **'Slice for wraps with avocado and spinach; add to salads as a lean protein'**
  String get foodServing008;

  /// No description provided for @foodNutrients008.
  ///
  /// In en, this message translates to:
  /// **'Tryptophan, B3 (Niacin), B6, Selenium, Zinc'**
  String get foodNutrients008;

  /// No description provided for @foodName009.
  ///
  /// In en, this message translates to:
  /// **'Eggs'**
  String get foodName009;

  /// No description provided for @foodBenefit009.
  ///
  /// In en, this message translates to:
  /// **'Complete protein with choline supports brain stress response'**
  String get foodBenefit009;

  /// No description provided for @foodMechanism009.
  ///
  /// In en, this message translates to:
  /// **'Eggs contain choline, essential for acetylcholine production — the neurotransmitter that regulates the parasympathetic (rest) nervous system. Phosphatidylserine in egg yolks has been shown to reduce cortisol response to exercise by up to 30%.'**
  String get foodMechanism009;

  /// No description provided for @foodServing009.
  ///
  /// In en, this message translates to:
  /// **'Scramble with spinach and turmeric; boil for portable snacks'**
  String get foodServing009;

  /// No description provided for @foodNutrients009.
  ///
  /// In en, this message translates to:
  /// **'Choline, Phosphatidylserine, B12, Vitamin D, Tryptophan'**
  String get foodNutrients009;

  /// No description provided for @foodName010.
  ///
  /// In en, this message translates to:
  /// **'Green Tea'**
  String get foodName010;

  /// No description provided for @foodBenefit010.
  ///
  /// In en, this message translates to:
  /// **'L-theanine promotes calm alertness without cortisol spike'**
  String get foodBenefit010;

  /// No description provided for @foodMechanism010.
  ///
  /// In en, this message translates to:
  /// **'L-theanine, unique to tea leaves, increases alpha brain waves (associated with relaxed focus) and promotes GABA production. It counteracts caffeine\'s cortisol-raising effect, reducing the stress response while maintaining mental clarity.'**
  String get foodMechanism010;

  /// No description provided for @foodServing010.
  ///
  /// In en, this message translates to:
  /// **'Drink 2-3 cups daily; brew at 80°C (not boiling) to preserve L-theanine'**
  String get foodServing010;

  /// No description provided for @foodNutrients010.
  ///
  /// In en, this message translates to:
  /// **'L-theanine, EGCG (catechins), Caffeine (low), Antioxidants'**
  String get foodNutrients010;

  /// No description provided for @foodName011.
  ///
  /// In en, this message translates to:
  /// **'Chamomile Tea'**
  String get foodName011;

  /// No description provided for @foodBenefit011.
  ///
  /// In en, this message translates to:
  /// **'Apigenin binds GABA receptors to reduce anxiety'**
  String get foodBenefit011;

  /// No description provided for @foodMechanism011.
  ///
  /// In en, this message translates to:
  /// **'Chamomile contains apigenin, a flavonoid that binds to GABA receptors in the brain — the same receptors targeted by anti-anxiety medications, but with a gentle, natural effect. Regular consumption reduces cortisol levels and improves sleep quality.'**
  String get foodMechanism011;

  /// No description provided for @foodServing011.
  ///
  /// In en, this message translates to:
  /// **'Drink 1-2 cups before bed as part of a wind-down ritual'**
  String get foodServing011;

  /// No description provided for @foodNutrients011.
  ///
  /// In en, this message translates to:
  /// **'Apigenin, Bisabolol, Chamazulene, Antioxidants'**
  String get foodNutrients011;

  /// No description provided for @foodName012.
  ///
  /// In en, this message translates to:
  /// **'Almonds'**
  String get foodName012;

  /// No description provided for @foodBenefit012.
  ///
  /// In en, this message translates to:
  /// **'Magnesium + vitamin E protect against stress damage'**
  String get foodBenefit012;

  /// No description provided for @foodMechanism012.
  ///
  /// In en, this message translates to:
  /// **'Almonds pack 20% of daily magnesium per ounce — directly dampening HPA axis overactivity. Vitamin E is an antioxidant that protects adrenal cells from free radical damage caused by chronic cortisol production.'**
  String get foodMechanism012;

  /// No description provided for @foodServing012.
  ///
  /// In en, this message translates to:
  /// **'A small handful (23 almonds) as a mid-morning snack; add to oatmeal'**
  String get foodServing012;

  /// No description provided for @foodNutrients012.
  ///
  /// In en, this message translates to:
  /// **'Magnesium, Vitamin E, Monounsaturated Fats, Protein, Fiber'**
  String get foodNutrients012;

  /// No description provided for @foodName013.
  ///
  /// In en, this message translates to:
  /// **'Pumpkin Seeds'**
  String get foodName013;

  /// No description provided for @foodBenefit013.
  ///
  /// In en, this message translates to:
  /// **'Zinc deficiency linked to high cortisol — pumpkin seeds are richest source'**
  String get foodBenefit013;

  /// No description provided for @foodMechanism013.
  ///
  /// In en, this message translates to:
  /// **'Zinc is a critical cofactor in the negative feedback loop that shuts down cortisol production. Zinc deficiency leads to chronically elevated cortisol. Pumpkin seeds are the richest plant source of zinc, plus they contain tryptophan and magnesium.'**
  String get foodMechanism013;

  /// No description provided for @foodServing013.
  ///
  /// In en, this message translates to:
  /// **'Toast and add to salads, soups, or trail mix; stir into oatmeal'**
  String get foodServing013;

  /// No description provided for @foodNutrients013.
  ///
  /// In en, this message translates to:
  /// **'Zinc, Tryptophan, Magnesium, Phosphorus, Manganese'**
  String get foodNutrients013;

  /// No description provided for @foodName014.
  ///
  /// In en, this message translates to:
  /// **'Oats'**
  String get foodName014;

  /// No description provided for @foodBenefit014.
  ///
  /// In en, this message translates to:
  /// **'Complex carbs stabilize blood sugar and raise serotonin'**
  String get foodBenefit014;

  /// No description provided for @foodMechanism014.
  ///
  /// In en, this message translates to:
  /// **'Oats provide complex carbohydrates that trigger serotonin production (carbs increase tryptophan uptake in the brain). Beta-glucan fiber promotes healthy gut microbiome, which supports the gut-brain axis for cortisol regulation. They prevent blood sugar crashes that trigger cortisol.'**
  String get foodMechanism014;

  /// No description provided for @foodServing014.
  ///
  /// In en, this message translates to:
  /// **'Prepare overnight oats with blueberries, walnuts, and honey the night before'**
  String get foodServing014;

  /// No description provided for @foodNutrients014.
  ///
  /// In en, this message translates to:
  /// **'Beta-glucan, B1 (Thiamine), Magnesium, Zinc, Fiber'**
  String get foodNutrients014;

  /// No description provided for @foodName015.
  ///
  /// In en, this message translates to:
  /// **'Quinoa'**
  String get foodName015;

  /// No description provided for @foodBenefit015.
  ///
  /// In en, this message translates to:
  /// **'Complete protein with all essential amino acids for neurotransmitter production'**
  String get foodBenefit015;

  /// No description provided for @foodMechanism015.
  ///
  /// In en, this message translates to:
  /// **'Quinoa is a complete protein containing all 9 essential amino acids, including tryptophan and tyrosine — precursors to serotonin and dopamine respectively. Its low glycemic index prevents the blood sugar swings that trigger cortisol release.'**
  String get foodMechanism015;

  /// No description provided for @foodServing015.
  ///
  /// In en, this message translates to:
  /// **'Use as a base for Buddha bowls or Mediterranean salads'**
  String get foodServing015;

  /// No description provided for @foodNutrients015.
  ///
  /// In en, this message translates to:
  /// **'Complete Protein, Magnesium, Iron, Fiber, Riboflavin'**
  String get foodNutrients015;

  /// No description provided for @foodName016.
  ///
  /// In en, this message translates to:
  /// **'Greek Yogurt'**
  String get foodName016;

  /// No description provided for @foodBenefit016.
  ///
  /// In en, this message translates to:
  /// **'Probiotics support gut-brain axis for cortisol regulation'**
  String get foodBenefit016;

  /// No description provided for @foodMechanism016.
  ///
  /// In en, this message translates to:
  /// **'Greek yogurt is rich in Lactobacillus and Bifidobacterium strains that produce GABA directly in the gut. Research shows probiotic supplementation reduces cortisol and anxiety in clinical studies. High protein content supports satiety and stable blood sugar.'**
  String get foodMechanism016;

  /// No description provided for @foodServing016.
  ///
  /// In en, this message translates to:
  /// **'Top with blueberries and pumpkin seeds for a complete stress-busting breakfast'**
  String get foodServing016;

  /// No description provided for @foodNutrients016.
  ///
  /// In en, this message translates to:
  /// **'Probiotics, Protein, Calcium, B12, Tryptophan'**
  String get foodNutrients016;

  /// No description provided for @foodName017.
  ///
  /// In en, this message translates to:
  /// **'Kefir'**
  String get foodName017;

  /// No description provided for @foodBenefit017.
  ///
  /// In en, this message translates to:
  /// **'Most probiotic-dense food — directly lowers cortisol via gut axis'**
  String get foodBenefit017;

  /// No description provided for @foodMechanism017.
  ///
  /// In en, this message translates to:
  /// **'Kefir contains up to 61 strains of beneficial bacteria — far more than yogurt. Studies show kefir consumption reduces cortisol by modulating the gut microbiome-brain connection. The tryptophan content also boosts serotonin.'**
  String get foodMechanism017;

  /// No description provided for @foodServing017.
  ///
  /// In en, this message translates to:
  /// **'Drink plain or blend into smoothies; use as a base for smoothie bowls'**
  String get foodServing017;

  /// No description provided for @foodNutrients017.
  ///
  /// In en, this message translates to:
  /// **'Probiotics (61 strains), Tryptophan, Calcium, B12, K2'**
  String get foodNutrients017;

  /// No description provided for @foodName018.
  ///
  /// In en, this message translates to:
  /// **'Turmeric'**
  String get foodName018;

  /// No description provided for @foodBenefit018.
  ///
  /// In en, this message translates to:
  /// **'Curcumin is as effective as antidepressants in multiple trials'**
  String get foodBenefit018;

  /// No description provided for @foodMechanism018.
  ///
  /// In en, this message translates to:
  /// **'Curcumin in turmeric inhibits inflammatory cytokines (IL-6, TNF-alpha) that activate the HPA axis. It also raises BDNF (brain-derived neurotrophic factor), protecting neurons from cortisol damage. Multiple trials show curcumin reduces cortisol and depression as effectively as some pharmaceuticals.'**
  String get foodMechanism018;

  /// No description provided for @foodServing018.
  ///
  /// In en, this message translates to:
  /// **'Golden milk before bed: warm milk + turmeric + black pepper + honey'**
  String get foodServing018;

  /// No description provided for @foodNutrients018.
  ///
  /// In en, this message translates to:
  /// **'Curcumin, Iron, Manganese, Anti-inflammatory compounds'**
  String get foodNutrients018;

  /// No description provided for @foodName019.
  ///
  /// In en, this message translates to:
  /// **'Dark Chocolate (70%+)'**
  String get foodName019;

  /// No description provided for @foodBenefit019.
  ///
  /// In en, this message translates to:
  /// **'Directly reduces cortisol and adrenaline — proven in clinical trials'**
  String get foodBenefit019;

  /// No description provided for @foodMechanism019.
  ///
  /// In en, this message translates to:
  /// **'A landmark 2009 study found that eating 40g of dark chocolate daily for 2 weeks reduced cortisol and catecholamines by significant amounts. Magnesium content modulates HPA axis; flavanols increase BDNF and protect against stress-induced neuronal damage. Theobromine provides calm energy.'**
  String get foodMechanism019;

  /// No description provided for @foodServing019.
  ///
  /// In en, this message translates to:
  /// **'1-2 squares (40g) after lunch; look for 70%+ cacao content'**
  String get foodServing019;

  /// No description provided for @foodNutrients019.
  ///
  /// In en, this message translates to:
  /// **'Magnesium, Flavanols, Theobromine, Iron, Zinc'**
  String get foodNutrients019;

  /// No description provided for @breathTechBelly.
  ///
  /// In en, this message translates to:
  /// **'Belly Breathing'**
  String get breathTechBelly;

  /// No description provided for @breathTechBox.
  ///
  /// In en, this message translates to:
  /// **'Box Breathing'**
  String get breathTechBox;

  /// No description provided for @breathTech478.
  ///
  /// In en, this message translates to:
  /// **'4-7-8 Breathing'**
  String get breathTech478;

  /// No description provided for @breathDescBelly.
  ///
  /// In en, this message translates to:
  /// **'The foundation of all breathwork. Also called diaphragmatic breathing, this activates your parasympathetic nervous system immediately. Perfect for beginners or anyone needing a quick stress reset.'**
  String get breathDescBelly;

  /// No description provided for @breathDescBox.
  ///
  /// In en, this message translates to:
  /// **'Used by Navy SEALs and elite athletes to maintain calm under extreme pressure. Equal-duration phases create a \"box\" pattern that rapidly resets the nervous system. Excellent for focus and pre-performance anxiety.'**
  String get breathDescBox;

  /// No description provided for @breathDesc478.
  ///
  /// In en, this message translates to:
  /// **'Developed by Dr. Andrew Weil based on yogic pranayama traditions. The extended exhale (8 counts) activates the vagal brake on the stress response. Dr. Weil calls it \"a natural tranquilizer for the nervous system.\"'**
  String get breathDesc478;

  /// No description provided for @breathInstrBellyInhale.
  ///
  /// In en, this message translates to:
  /// **'Breathe in slowly through your nose, filling your belly'**
  String get breathInstrBellyInhale;

  /// No description provided for @breathInstrBellyExhale.
  ///
  /// In en, this message translates to:
  /// **'Breathe out slowly through your mouth, emptying your belly'**
  String get breathInstrBellyExhale;

  /// No description provided for @breathInstrBoxInhale.
  ///
  /// In en, this message translates to:
  /// **'Inhale slowly through your nose, counting to 4'**
  String get breathInstrBoxInhale;

  /// No description provided for @breathInstrBoxHoldFull.
  ///
  /// In en, this message translates to:
  /// **'Hold gently — lungs full, body relaxed'**
  String get breathInstrBoxHoldFull;

  /// No description provided for @breathInstrBoxExhale.
  ///
  /// In en, this message translates to:
  /// **'Exhale completely through your mouth, counting to 4'**
  String get breathInstrBoxExhale;

  /// No description provided for @breathInstrBoxHoldEmpty.
  ///
  /// In en, this message translates to:
  /// **'Hold gently — lungs empty, body relaxed'**
  String get breathInstrBoxHoldEmpty;

  /// No description provided for @breathInstr478Inhale.
  ///
  /// In en, this message translates to:
  /// **'Inhale quietly through your nose for 4 counts'**
  String get breathInstr478Inhale;

  /// No description provided for @breathInstr478Hold.
  ///
  /// In en, this message translates to:
  /// **'Hold your breath completely for 7 counts'**
  String get breathInstr478Hold;

  /// No description provided for @breathInstr478Exhale.
  ///
  /// In en, this message translates to:
  /// **'Exhale completely through your mouth with a whoosh sound for 8 counts'**
  String get breathInstr478Exhale;

  /// No description provided for @breathBenefitBelly1.
  ///
  /// In en, this message translates to:
  /// **'Activates parasympathetic nervous system'**
  String get breathBenefitBelly1;

  /// No description provided for @breathBenefitBelly2.
  ///
  /// In en, this message translates to:
  /// **'Reduces cortisol within minutes'**
  String get breathBenefitBelly2;

  /// No description provided for @breathBenefitBelly3.
  ///
  /// In en, this message translates to:
  /// **'Lowers heart rate and blood pressure'**
  String get breathBenefitBelly3;

  /// No description provided for @breathBenefitBelly4.
  ///
  /// In en, this message translates to:
  /// **'Improves oxygen exchange'**
  String get breathBenefitBelly4;

  /// No description provided for @breathBenefitBox1.
  ///
  /// In en, this message translates to:
  /// **'Rapid stress and anxiety reduction'**
  String get breathBenefitBox1;

  /// No description provided for @breathBenefitBox2.
  ///
  /// In en, this message translates to:
  /// **'Improves focus and concentration'**
  String get breathBenefitBox2;

  /// No description provided for @breathBenefitBox3.
  ///
  /// In en, this message translates to:
  /// **'Used by Navy SEALs and elite performers'**
  String get breathBenefitBox3;

  /// No description provided for @breathBenefitBox4.
  ///
  /// In en, this message translates to:
  /// **'Balances CO2 and O2 levels'**
  String get breathBenefitBox4;

  /// No description provided for @breathBenefitBox5.
  ///
  /// In en, this message translates to:
  /// **'Reduces cortisol response'**
  String get breathBenefitBox5;

  /// No description provided for @breathBenefit4781.
  ///
  /// In en, this message translates to:
  /// **'Natural tranquilizer effect'**
  String get breathBenefit4781;

  /// No description provided for @breathBenefit4782.
  ///
  /// In en, this message translates to:
  /// **'Reduces acute anxiety in minutes'**
  String get breathBenefit4782;

  /// No description provided for @breathBenefit4783.
  ///
  /// In en, this message translates to:
  /// **'Activates the vagus nerve'**
  String get breathBenefit4783;

  /// No description provided for @breathBenefit4784.
  ///
  /// In en, this message translates to:
  /// **'Helps with insomnia — do before bed'**
  String get breathBenefit4784;

  /// No description provided for @breathBenefit4785.
  ///
  /// In en, this message translates to:
  /// **'Manages food cravings from stress'**
  String get breathBenefit4785;

  /// No description provided for @breathBenefit4786.
  ///
  /// In en, this message translates to:
  /// **'Based on ancient yogic pranayama'**
  String get breathBenefit4786;

  /// No description provided for @durationMin.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get durationMin;

  /// No description provided for @durationSec.
  ///
  /// In en, this message translates to:
  /// **'sec'**
  String get durationSec;

  /// No description provided for @appBlockerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Block stress-triggering apps during your morning routine'**
  String get appBlockerSubtitle;

  /// No description provided for @compEducation.
  ///
  /// In en, this message translates to:
  /// **'Education Module'**
  String get compEducation;

  /// No description provided for @compBreathing.
  ///
  /// In en, this message translates to:
  /// **'Breathing Exercises (3)'**
  String get compBreathing;

  /// No description provided for @compSoundscapes.
  ///
  /// In en, this message translates to:
  /// **'Soundscapes (5)'**
  String get compSoundscapes;

  /// No description provided for @compNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Guide'**
  String get compNutrition;

  /// No description provided for @compJournal.
  ///
  /// In en, this message translates to:
  /// **'Mood Journal'**
  String get compJournal;

  /// No description provided for @compSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tracker'**
  String get compSleep;

  /// No description provided for @compMeditation.
  ///
  /// In en, this message translates to:
  /// **'Guided Meditation Library'**
  String get compMeditation;

  /// No description provided for @compRecipes.
  ///
  /// In en, this message translates to:
  /// **'Recipe Book (22 recipes)'**
  String get compRecipes;

  /// No description provided for @compAppBlocker.
  ///
  /// In en, this message translates to:
  /// **'App Blocker / Focus Mode'**
  String get compAppBlocker;

  /// No description provided for @compAiInsights.
  ///
  /// In en, this message translates to:
  /// **'AI Mood Insights'**
  String get compAiInsights;

  /// No description provided for @compWeeklyAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Weekly Pattern Analysis'**
  String get compWeeklyAnalysis;

  /// No description provided for @blockerHeroText.
  ///
  /// In en, this message translates to:
  /// **'The first 2 hours after waking have the highest cortisol levels. Avoiding stressful apps (social media, news) during this window dramatically improves your day.'**
  String get blockerHeroText;

  /// Active blocker status with hours
  ///
  /// In en, this message translates to:
  /// **'Active — {hours}h after wake time'**
  String blockerActiveStatus(Object hours);

  /// No description provided for @blockerInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get blockerInactive;

  /// Block duration label with hours
  ///
  /// In en, this message translates to:
  /// **'Block duration: {hours} hours'**
  String blockerDurationLabel(Object hours);

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get thisWeek;

  /// No description provided for @sevenDayAverage.
  ///
  /// In en, this message translates to:
  /// **'7-day average'**
  String get sevenDayAverage;

  /// No description provided for @vsLastWeek.
  ///
  /// In en, this message translates to:
  /// **'vs last week'**
  String get vsLastWeek;

  /// No description provided for @stressLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get stressLow;

  /// No description provided for @stressModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get stressModerate;

  /// No description provided for @stressHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get stressHigh;

  /// No description provided for @dayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get dayMon;

  /// No description provided for @dayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get dayTue;

  /// No description provided for @dayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get dayWed;

  /// No description provided for @dayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get dayThu;

  /// No description provided for @dayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get dayFri;

  /// No description provided for @daySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get daySat;

  /// No description provided for @daySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get daySun;

  /// No description provided for @moodPattern1obs.
  ///
  /// In en, this message translates to:
  /// **'Your mood tends to dip on Wednesdays'**
  String get moodPattern1obs;

  /// No description provided for @moodPattern1tip.
  ///
  /// In en, this message translates to:
  /// **'Consider scheduling a 5-minute breathing session Wednesday mornings to preempt the mid-week stress peak.'**
  String get moodPattern1tip;

  /// No description provided for @moodPattern2obs.
  ///
  /// In en, this message translates to:
  /// **'You consistently feel better on Fridays and weekends'**
  String get moodPattern2obs;

  /// No description provided for @moodPattern2tip.
  ///
  /// In en, this message translates to:
  /// **'This suggests work stress is a primary driver. The App Blocker and morning breathing routine can help weekday mornings.'**
  String get moodPattern2tip;

  /// No description provided for @moodPattern3obs.
  ///
  /// In en, this message translates to:
  /// **'Lower mood correlates with nights under 7 hours sleep'**
  String get moodPattern3obs;

  /// No description provided for @moodPattern3tip.
  ///
  /// In en, this message translates to:
  /// **'Setting a consistent 10:30 PM bedtime and using the Chamomile Latte recipe could improve your baseline mood.'**
  String get moodPattern3tip;

  /// No description provided for @weeklyTipText.
  ///
  /// In en, this message translates to:
  /// **'Based on your mood patterns, your cortisol is likely highest on Tuesday and Wednesday mornings. Try the 4-7-8 breathing exercise before your first task on those days. Your journal entries suggest better mood when you exercise — consider 20 minutes of moderate movement before 10 AM.'**
  String get weeklyTipText;

  /// Playing meditation with title
  ///
  /// In en, this message translates to:
  /// **'Playing: {title}'**
  String playingMeditation(Object title);

  /// No description provided for @medTitle1.
  ///
  /// In en, this message translates to:
  /// **'Morning Cortisol Reset'**
  String get medTitle1;

  /// No description provided for @medDesc1.
  ///
  /// In en, this message translates to:
  /// **'Begin your day by regulating your cortisol awakening response.'**
  String get medDesc1;

  /// No description provided for @medCat1.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get medCat1;

  /// No description provided for @medTitle2.
  ///
  /// In en, this message translates to:
  /// **'Sleep Preparation'**
  String get medTitle2;

  /// No description provided for @medDesc2.
  ///
  /// In en, this message translates to:
  /// **'Wind down your nervous system for deep, restorative sleep.'**
  String get medDesc2;

  /// No description provided for @medCat2.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get medCat2;

  /// No description provided for @medTitle3.
  ///
  /// In en, this message translates to:
  /// **'Anxiety Relief'**
  String get medTitle3;

  /// No description provided for @medDesc3.
  ///
  /// In en, this message translates to:
  /// **'Interrupt the stress response cycle with MBSR techniques.'**
  String get medDesc3;

  /// No description provided for @medCat3.
  ///
  /// In en, this message translates to:
  /// **'Anxiety'**
  String get medCat3;

  /// No description provided for @medTitle4.
  ///
  /// In en, this message translates to:
  /// **'Deep Focus'**
  String get medTitle4;

  /// No description provided for @medDesc4.
  ///
  /// In en, this message translates to:
  /// **'Lower cortisol while entering a state of calm productivity.'**
  String get medDesc4;

  /// No description provided for @medCat4.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get medCat4;

  /// No description provided for @medTitle5.
  ///
  /// In en, this message translates to:
  /// **'Body Scan'**
  String get medTitle5;

  /// No description provided for @medDesc5.
  ///
  /// In en, this message translates to:
  /// **'Release physical tension stored from chronic stress.'**
  String get medDesc5;

  /// No description provided for @medCat5.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get medCat5;

  /// No description provided for @filterBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get filterBreakfast;

  /// No description provided for @filterSmoothies.
  ///
  /// In en, this message translates to:
  /// **'Smoothies'**
  String get filterSmoothies;

  /// No description provided for @filterSalads.
  ///
  /// In en, this message translates to:
  /// **'Salads'**
  String get filterSalads;

  /// No description provided for @filterMains.
  ///
  /// In en, this message translates to:
  /// **'Mains'**
  String get filterMains;

  /// No description provided for @filterSnacks.
  ///
  /// In en, this message translates to:
  /// **'Snacks'**
  String get filterSnacks;

  /// No description provided for @filterDrinks.
  ///
  /// In en, this message translates to:
  /// **'Drinks'**
  String get filterDrinks;

  /// No description provided for @filterDesserts.
  ///
  /// In en, this message translates to:
  /// **'Desserts'**
  String get filterDesserts;

  /// No description provided for @moreJournalSub.
  ///
  /// In en, this message translates to:
  /// **'Track your daily mood'**
  String get moreJournalSub;

  /// No description provided for @moreSleepSub.
  ///
  /// In en, this message translates to:
  /// **'Monitor your sleep quality'**
  String get moreSleepSub;

  /// No description provided for @moreSettingsSub.
  ///
  /// In en, this message translates to:
  /// **'Theme, language, notifications'**
  String get moreSettingsSub;

  /// Unlock PRO button with price
  ///
  /// In en, this message translates to:
  /// **'Unlock PRO — {price}'**
  String unlockProButton(Object price);

  /// No description provided for @paymentDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Payment processed by Google Play. One-time purchase. No subscription.'**
  String get paymentDisclaimer;

  /// No description provided for @proThankYouSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Thank you! All PRO features are now unlocked.'**
  String get proThankYouSnackbar;

  /// No description provided for @cortisolZeroPro.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero PRO'**
  String get cortisolZeroPro;

  /// No description provided for @proBannerDescription.
  ///
  /// In en, this message translates to:
  /// **'Recipes, Meditation, App Blocker, AI Insights — \$6.50 one-time'**
  String get proBannerDescription;

  /// No description provided for @aiDemoDataNotice.
  ///
  /// In en, this message translates to:
  /// **'This is a demo preview. Start logging your daily mood to see personalized AI insights based on your real data.'**
  String get aiDemoDataNotice;

  /// No description provided for @aiDemoLabel.
  ///
  /// In en, this message translates to:
  /// **'Demo data'**
  String get aiDemoLabel;

  /// No description provided for @recipeWhyItWorks.
  ///
  /// In en, this message translates to:
  /// **'Why It Works'**
  String get recipeWhyItWorks;

  /// No description provided for @recipeIngredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get recipeIngredients;

  /// No description provided for @recipeInstructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get recipeInstructions;

  /// No description provided for @recipeServings.
  ///
  /// In en, this message translates to:
  /// **'{count} servings'**
  String recipeServings(int count);

  /// No description provided for @blockedAppsTitle.
  ///
  /// In en, this message translates to:
  /// **'Blocked apps'**
  String get blockedAppsTitle;

  /// No description provided for @blockerAddApps.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get blockerAddApps;

  /// No description provided for @blockerNoAppsSelected.
  ///
  /// In en, this message translates to:
  /// **'No apps selected. Tap Add to choose which apps to block during your morning focus time.'**
  String get blockerNoAppsSelected;

  /// No description provided for @blockerSelectApps.
  ///
  /// In en, this message translates to:
  /// **'Select apps to block'**
  String get blockerSelectApps;

  /// No description provided for @blockerSearchApps.
  ///
  /// In en, this message translates to:
  /// **'Search apps...'**
  String get blockerSearchApps;

  /// No description provided for @blockerLoadingApps.
  ///
  /// In en, this message translates to:
  /// **'Loading installed apps...'**
  String get blockerLoadingApps;

  /// No description provided for @blockerStartButton.
  ///
  /// In en, this message translates to:
  /// **'Start blocking now'**
  String get blockerStartButton;

  /// No description provided for @blockerStopButton.
  ///
  /// In en, this message translates to:
  /// **'Stop blocking'**
  String get blockerStopButton;

  /// No description provided for @blockerPermUsageStats.
  ///
  /// In en, this message translates to:
  /// **'Usage data access'**
  String get blockerPermUsageStats;

  /// No description provided for @blockerPermOverlay.
  ///
  /// In en, this message translates to:
  /// **'Display over other apps'**
  String get blockerPermOverlay;

  /// No description provided for @blockerRefreshPerms.
  ///
  /// In en, this message translates to:
  /// **'Refresh permissions'**
  String get blockerRefreshPerms;

  /// No description provided for @proActivatedMessage.
  ///
  /// In en, this message translates to:
  /// **'All PRO features are unlocked and will activate in a few seconds.'**
  String get proActivatedMessage;

  /// No description provided for @permOnboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'Setup Permissions'**
  String get permOnboardingTitle;

  /// No description provided for @permStepUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'Usage Data Access'**
  String get permStepUsageTitle;

  /// No description provided for @permStepUsageDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow us to see when you open a stress source. This is required to activate the blocker.'**
  String get permStepUsageDesc;

  /// No description provided for @permStepUsageButton.
  ///
  /// In en, this message translates to:
  /// **'Open Usage Settings'**
  String get permStepUsageButton;

  /// No description provided for @permStepOverlayTitle.
  ///
  /// In en, this message translates to:
  /// **'Display Over Apps'**
  String get permStepOverlayTitle;

  /// No description provided for @permStepOverlayDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow us to cover the stress source. This lets us show a calming screen instead of the blocked app.'**
  String get permStepOverlayDesc;

  /// No description provided for @permStepOverlayButton.
  ///
  /// In en, this message translates to:
  /// **'Open Overlay Settings'**
  String get permStepOverlayButton;

  /// No description provided for @permStepGranted.
  ///
  /// In en, this message translates to:
  /// **'Permission granted'**
  String get permStepGranted;

  /// No description provided for @permNextStep.
  ///
  /// In en, this message translates to:
  /// **'Next step'**
  String get permNextStep;

  /// No description provided for @permAllDone.
  ///
  /// In en, this message translates to:
  /// **'All done — let\'s go!'**
  String get permAllDone;

  /// No description provided for @permBackToStep1.
  ///
  /// In en, this message translates to:
  /// **'Back to step 1'**
  String get permBackToStep1;

  /// No description provided for @permStepUsageLottieHint.
  ///
  /// In en, this message translates to:
  /// **'Find Cortisol Zero in the list and enable access'**
  String get permStepUsageLottieHint;

  /// No description provided for @permStepOverlayLottieHint.
  ///
  /// In en, this message translates to:
  /// **'Toggle the switch to allow overlay display'**
  String get permStepOverlayLottieHint;

  /// No description provided for @permSetupRequired.
  ///
  /// In en, this message translates to:
  /// **'Setup required'**
  String get permSetupRequired;

  /// No description provided for @permSetupRequiredDesc.
  ///
  /// In en, this message translates to:
  /// **'To block apps, we need three permissions. Tap below to set them up.'**
  String get permSetupRequiredDesc;

  /// No description provided for @permStepAccessibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Accessibility Service'**
  String get permStepAccessibilityTitle;

  /// No description provided for @permStepAccessibilityDesc.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero uses Android\'s Accessibility Service only to detect which app is currently on screen (by package name). It does NOT access messages, passwords, financial data, or any personal information. All detection happens locally on your device and is never stored or transmitted anywhere.'**
  String get permStepAccessibilityDesc;

  /// No description provided for @permStepAccessibilityButton.
  ///
  /// In en, this message translates to:
  /// **'Open Accessibility Settings'**
  String get permStepAccessibilityButton;

  /// No description provided for @permStepAccessibilityLottieHint.
  ///
  /// In en, this message translates to:
  /// **'Find Cortisol Zero in Installed Apps and enable it'**
  String get permStepAccessibilityLottieHint;

  /// No description provided for @blockerPermAccessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility service'**
  String get blockerPermAccessibility;

  /// No description provided for @permBackToStep2.
  ///
  /// In en, this message translates to:
  /// **'Back to step 2'**
  String get permBackToStep2;

  /// No description provided for @permDisclosureAccesses.
  ///
  /// In en, this message translates to:
  /// **'What it accesses'**
  String get permDisclosureAccesses;

  /// No description provided for @permDisclosureAccessesDesc.
  ///
  /// In en, this message translates to:
  /// **'Which app is currently on screen (package name only)'**
  String get permDisclosureAccessesDesc;

  /// No description provided for @permDisclosureNotAccesses.
  ///
  /// In en, this message translates to:
  /// **'What it does NOT access'**
  String get permDisclosureNotAccesses;

  /// No description provided for @permDisclosureNotAccessesDesc.
  ///
  /// In en, this message translates to:
  /// **'Messages, passwords, financial data, personal information, browsing history, contacts'**
  String get permDisclosureNotAccessesDesc;

  /// No description provided for @permDisclosureDataUsage.
  ///
  /// In en, this message translates to:
  /// **'How data is used'**
  String get permDisclosureDataUsage;

  /// No description provided for @permDisclosureDataUsageDesc.
  ///
  /// In en, this message translates to:
  /// **'All detection is local on your device. Nothing is stored or transmitted anywhere.'**
  String get permDisclosureDataUsageDesc;

  /// No description provided for @permUnderstandContinue.
  ///
  /// In en, this message translates to:
  /// **'I Understand & Continue'**
  String get permUnderstandContinue;

  /// No description provided for @moodInsights3DayTitle.
  ///
  /// In en, this message translates to:
  /// **'3-Day Quick Insights'**
  String get moodInsights3DayTitle;

  /// No description provided for @moodInsightsWeeklyTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Pattern Analysis'**
  String get moodInsightsWeeklyTitle;

  /// No description provided for @moodInsightsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry Analysis'**
  String get moodInsightsRetry;

  /// No description provided for @moodInsightsError.
  ///
  /// In en, this message translates to:
  /// **'Analysis failed. Please try again.'**
  String get moodInsightsError;

  /// No description provided for @moodInsightsNotEnoughData.
  ///
  /// In en, this message translates to:
  /// **'Add at least 2 mood entries to see insights'**
  String get moodInsightsNotEnoughData;

  /// No description provided for @privacyOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'How We Handle Your Data'**
  String get privacyOverviewTitle;

  /// No description provided for @privacyOverviewBody.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero needs 3 permissions to block stress apps. All processing happens locally on your device. We do NOT collect, store, or send any data to servers. We do NOT have user accounts or analytics.'**
  String get privacyOverviewBody;

  /// No description provided for @privacyOverviewAccept.
  ///
  /// In en, this message translates to:
  /// **'I Accept & Continue'**
  String get privacyOverviewAccept;

  /// No description provided for @privacyOverviewLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyOverviewLearnMore;

  /// No description provided for @privacyOverviewTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get privacyOverviewTerms;

  /// No description provided for @permTutorialButton.
  ///
  /// In en, this message translates to:
  /// **'Watch Video Tutorial'**
  String get permTutorialButton;

  /// No description provided for @permTapToGrant.
  ///
  /// In en, this message translates to:
  /// **'TAP TO GRANT'**
  String get permTapToGrant;

  /// No description provided for @permFindAppText.
  ///
  /// In en, this message translates to:
  /// **'Find Cortisol Zero on the next screen'**
  String get permFindAppText;

  /// No description provided for @permTapAndToggle.
  ///
  /// In en, this message translates to:
  /// **'Tap it and turn on the switch'**
  String get permTapAndToggle;

  /// No description provided for @permWhatItDoes.
  ///
  /// In en, this message translates to:
  /// **'What this permission does'**
  String get permWhatItDoes;

  /// No description provided for @permWhatItDoesNot.
  ///
  /// In en, this message translates to:
  /// **'What this permission does NOT do'**
  String get permWhatItDoesNot;

  /// No description provided for @legalSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legalSectionTitle;

  /// No description provided for @legalPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get legalPrivacyPolicy;

  /// No description provided for @legalTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get legalTermsOfService;

  /// No description provided for @todaysMoodRecorded.
  ///
  /// In en, this message translates to:
  /// **'Today\'s mood: recorded'**
  String get todaysMoodRecorded;

  /// No description provided for @blockerScheduleInfo.
  ///
  /// In en, this message translates to:
  /// **'Blocking scheduled from {time} for {hours}h daily. Blocking will end automatically.'**
  String blockerScheduleInfo(String time, String hours);

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Effective date: January 1, 2025'**
  String get privacyPolicyLastUpdated;

  /// No description provided for @privacyPolicyIntro.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero (\"we\", \"our\", \"app\") is committed to protecting your privacy.'**
  String get privacyPolicyIntro;

  /// No description provided for @privacyPolicyDataCollectedTitle.
  ///
  /// In en, this message translates to:
  /// **'1. Data We Collect'**
  String get privacyPolicyDataCollectedTitle;

  /// No description provided for @privacyPolicyDataCollectedBody.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero does NOT collect any personal data. All data (journal entries, sleep records, breathing session history, and app-blocker schedules) is stored exclusively on your device and is never transmitted to any server.'**
  String get privacyPolicyDataCollectedBody;

  /// No description provided for @privacyPolicyPermissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'2. Permissions Used'**
  String get privacyPolicyPermissionsTitle;

  /// No description provided for @privacyPolicyPermissionsBody.
  ///
  /// In en, this message translates to:
  /// **'• Accessibility Service — detects which app is on screen (package name only) to apply your blocker schedule. It does NOT read your messages, passwords, or personal data.\n\n• Display Over Other Apps — shows a calming overlay screen when a blocked app is opened during focus hours.\n\n• Usage Stats — reads app usage data to activate blocking rules. This data stays on your device only.\n\n• Foreground Service — keeps the blocker active in the background during your scheduled focus window.\n\nNone of these permissions are used to collect, transmit, or share data with us or any third party.'**
  String get privacyPolicyPermissionsBody;

  /// No description provided for @privacyPolicyPurchasesTitle.
  ///
  /// In en, this message translates to:
  /// **'3. In-App Purchases'**
  String get privacyPolicyPurchasesTitle;

  /// No description provided for @privacyPolicyPurchasesBody.
  ///
  /// In en, this message translates to:
  /// **'Purchases are processed by Google Play. We do not store payment information. We receive only a purchase token to verify your PRO status.'**
  String get privacyPolicyPurchasesBody;

  /// No description provided for @privacyPolicyThirdPartyTitle.
  ///
  /// In en, this message translates to:
  /// **'4. Third-Party Services'**
  String get privacyPolicyThirdPartyTitle;

  /// No description provided for @privacyPolicyThirdPartyBody.
  ///
  /// In en, this message translates to:
  /// **'We do not integrate analytics, advertising SDKs, or crash reporting services that collect personal data. The app contains no tracking code.'**
  String get privacyPolicyThirdPartyBody;

  /// No description provided for @privacyPolicyChildrenTitle.
  ///
  /// In en, this message translates to:
  /// **'5. Children'**
  String get privacyPolicyChildrenTitle;

  /// No description provided for @privacyPolicyChildrenBody.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero does not knowingly collect information from children under 13. The app is rated for general audiences.'**
  String get privacyPolicyChildrenBody;

  /// No description provided for @privacyPolicyContactTitle.
  ///
  /// In en, this message translates to:
  /// **'6. Contact'**
  String get privacyPolicyContactTitle;

  /// No description provided for @privacyPolicyContactBody.
  ///
  /// In en, this message translates to:
  /// **'For privacy questions contact us at: cartizolzero@gmail.com'**
  String get privacyPolicyContactBody;

  /// No description provided for @privacyPolicyChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'7. Changes'**
  String get privacyPolicyChangesTitle;

  /// No description provided for @privacyPolicyChangesBody.
  ///
  /// In en, this message translates to:
  /// **'We may update this policy. Continued use of the app after updates constitutes acceptance of the revised policy.'**
  String get privacyPolicyChangesBody;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsTitle;

  /// No description provided for @termsLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Effective date: January 1, 2025'**
  String get termsLastUpdated;

  /// No description provided for @termsIntro.
  ///
  /// In en, this message translates to:
  /// **'By using Cortisol Zero, you agree to these terms.'**
  String get termsIntro;

  /// No description provided for @termsUseTitle.
  ///
  /// In en, this message translates to:
  /// **'1. Use of the App'**
  String get termsUseTitle;

  /// No description provided for @termsUseBody.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero is a personal health and productivity tool. You may use it for your own stress management and focus goals. You may not reverse-engineer, distribute, or resell the app or its content.'**
  String get termsUseBody;

  /// No description provided for @termsProTitle.
  ///
  /// In en, this message translates to:
  /// **'2. PRO Subscription'**
  String get termsProTitle;

  /// No description provided for @termsProBody.
  ///
  /// In en, this message translates to:
  /// **'PRO features are unlocked via an in-app purchase processed by Google Play. Subscriptions auto-renew unless cancelled at least 24 hours before the renewal date. Refunds are handled according to Google Play\'s refund policy.'**
  String get termsProBody;

  /// No description provided for @termsPermissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'3. Permissions'**
  String get termsPermissionsTitle;

  /// No description provided for @termsPermissionsBody.
  ///
  /// In en, this message translates to:
  /// **'The app requires certain Android permissions (Accessibility Service, Display Over Other Apps, Usage Stats) to provide app-blocking functionality. These permissions are used solely for the stated purpose and are never used to collect personal data.'**
  String get termsPermissionsBody;

  /// No description provided for @termsDisclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'4. Disclaimer'**
  String get termsDisclaimerTitle;

  /// No description provided for @termsDisclaimerBody.
  ///
  /// In en, this message translates to:
  /// **'Cortisol Zero is a wellness tool and is NOT a medical device or medical advice. Always consult a healthcare professional for medical concerns.'**
  String get termsDisclaimerBody;

  /// No description provided for @termsLiabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'5. Limitation of Liability'**
  String get termsLiabilityTitle;

  /// No description provided for @termsLiabilityBody.
  ///
  /// In en, this message translates to:
  /// **'We are not liable for any damages arising from the use of this app. The app is provided \"as is\" without warranty of any kind.'**
  String get termsLiabilityBody;

  /// No description provided for @termsChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'6. Changes'**
  String get termsChangesTitle;

  /// No description provided for @termsChangesBody.
  ///
  /// In en, this message translates to:
  /// **'We may update these terms. Continued use of the app after updates constitutes acceptance.'**
  String get termsChangesBody;

  /// No description provided for @termsContactTitle.
  ///
  /// In en, this message translates to:
  /// **'7. Contact'**
  String get termsContactTitle;

  /// No description provided for @termsContactBody.
  ///
  /// In en, this message translates to:
  /// **'For questions contact us at: cartizolzero@gmail.com'**
  String get termsContactBody;

  /// Debug button to fire a test bedtime alarm 1 min from now
  ///
  /// In en, this message translates to:
  /// **'Test alarm in 1 minute'**
  String get testAlarmIn1Min;

  /// Snackbar shown after scheduling test alarm
  ///
  /// In en, this message translates to:
  /// **'Test alarm scheduled for 1 minute from now'**
  String get testAlarmScheduled;

  /// Banner title shown when blocker UI is locked during active blocking
  ///
  /// In en, this message translates to:
  /// **'Settings locked'**
  String get blockerLockedTitle;

  /// Banner body explaining settings are locked, with end time placeholder
  ///
  /// In en, this message translates to:
  /// **'Focus mode is active. You can change settings after blocking ends at {time}.'**
  String blockerLockedBody(String time);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'ko',
        'lt'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ko':
      return AppLocalizationsKo();
    case 'lt':
      return AppLocalizationsLt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
