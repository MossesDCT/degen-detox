// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appName => 'Cortisol Zero';

  @override
  String get appTagline => 'Jūsų kasdieninis streso mažinimo palydovas';

  @override
  String get navHome => 'Pradžia';

  @override
  String get navLearn => 'Mokytis';

  @override
  String get navBreathe => 'Kvėpuoti';

  @override
  String get navSounds => 'Garsai';

  @override
  String get navMore => 'Daugiau';

  @override
  String get greetingMorning => 'Labas rytas';

  @override
  String get greetingAfternoon => 'Laba diena';

  @override
  String get greetingEvening => 'Labas vakaras';

  @override
  String get greetingNight => 'Labos nakties';

  @override
  String get dayStreak => 'dienų iš eilės';

  @override
  String get dailyTip => 'Dienos patarimas';

  @override
  String get quickAccess => 'Greita prieiga';

  @override
  String get moodCheckin => 'Kaip jaučiatės?';

  @override
  String get howAreYouFeeling => 'Kaip šiandien jaučiatės?';

  @override
  String get explore => 'Atrasti';

  @override
  String get learnTitle => 'Mokytis';

  @override
  String get learnSubtitle =>
      'Supraskite kortizolio veikimą ir kaip jį valdyti';

  @override
  String get searchTopics => 'Ieškoti temų...';

  @override
  String get seeAll => 'Žiūrėti viską';

  @override
  String minuteRead(int count) {
    return '$count min skaitymas';
  }

  @override
  String get noResultsFound => 'Rezultatų nerasta';

  @override
  String get nutritionGuide => 'Mitybos vadovas';

  @override
  String get antiStressFoods => 'Stresą mažinantis maistas';

  @override
  String get tapToLearnScience =>
      'Palieskite bet kurį maisto produktą, kad sužinotumėte, kaip jis mažina kortizolio kiekį';

  @override
  String get servingIdea => 'Patiekimo idėja';

  @override
  String get breatheTitle => 'Kvėpuoti';

  @override
  String get breatheSubtitle =>
      'Kvėpavimo pratimai mažina kortizolio kiekį per kelias minutes';

  @override
  String get scienceBackedTechniques => 'Mokslu pagrįstos technikos';

  @override
  String get vagusNerveInfo =>
      'Kiekviena technika aktyvuoja klajoklio nervą, kuris per kelias minutes sumažina kortizolio kiekį';

  @override
  String get beginner => 'Pradedantiesiems';

  @override
  String get intermediate => 'Vidutinis';

  @override
  String get advanced => 'Pažengusiems';

  @override
  String get phaseInhale => 'Įkvėpkite';

  @override
  String get phaseHold => 'Sulaikykite';

  @override
  String get phaseExhale => 'Iškvėpkite';

  @override
  String get sessionComplete => 'Sesija baigta!';

  @override
  String get sessionCompleteMessage =>
      'Jūsų kortizolio lygis mažėja. Atkreipkite dėmesį į savo savijautą.';

  @override
  String get cyclesCompleted => 'Ciklai';

  @override
  String get duration => 'Trukmė';

  @override
  String get done => 'Baigta';

  @override
  String get endSession => 'Baigti sesiją';

  @override
  String cycleOf(int current, int total) {
    return 'Ciklas $current iš $total';
  }

  @override
  String get soundsTitle => 'Garsai';

  @override
  String get soundsSubtitle =>
      'Gamtos garsai, nuraminsiantys jūsų nervų sistemą';

  @override
  String nowPlaying(String name) {
    return 'Groja: $name';
  }

  @override
  String get tapToPlay => 'Palieskite, kad grotų';

  @override
  String get paused => 'Pristabdyta';

  @override
  String get sleepTimer => 'Miego laikmatis';

  @override
  String get audioWillStop => 'Garsas automatiškai sustabdys';

  @override
  String get cancelTimer => 'Atšaukti laikmatį';

  @override
  String sleepTimerSet(int minutes) {
    return 'Laikmatis: $minutes min';
  }

  @override
  String get journalTitle => 'Nuotaikų dienoraštis';

  @override
  String get addEntry => 'Pridėti įrašą';

  @override
  String get saveEntry => 'Išsaugoti įrašą';

  @override
  String get noEntriesThisMonth => 'Šį mėnesį įrašų nėra';

  @override
  String get tapPlusToAdd => 'Palieskite +, kad pridėtumėte pirmąjį įrašą';

  @override
  String weeklyAverage(String mood) {
    return 'Savaitės vidurkis: $mood';
  }

  @override
  String get addNoteOptional =>
      'Pridėkite pastabą apie savo savijautą... (neprivaloma)';

  @override
  String get moodTerrible => 'Baisiai';

  @override
  String get moodBad => 'Prastai';

  @override
  String get moodOkay => 'Normaliai';

  @override
  String get moodGood => 'Gerai';

  @override
  String get moodGreat => 'Puikiai';

  @override
  String get sleepTrackerTitle => 'Miego stebėjimas';

  @override
  String get logSleep => 'Užfiksuoti miegą';

  @override
  String get sleepQuality => 'Miego kokybė';

  @override
  String get bedtimeReminder => 'Miego priminimas';

  @override
  String get avgQuality => 'Vid. kokybė';

  @override
  String get avgDuration => 'Vid. trukmė';

  @override
  String get tracked => 'Sekta';

  @override
  String get bedtime => 'Miego laikas';

  @override
  String get wakeTime => 'Pabudimo laikas';

  @override
  String get last7Days => 'Paskutinės 7 dienos';

  @override
  String get recentEntries => 'Naujausi įrašai';

  @override
  String get settingsTitle => 'Nustatymai';

  @override
  String get appearance => 'Išvaizda';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Sisteminė';

  @override
  String get themeLight => 'Šviesi';

  @override
  String get themeDark => 'Tamsi';

  @override
  String get language => 'Kalba';

  @override
  String get notifications => 'Pranešimai';

  @override
  String get enableNotifications => 'Įjungti pranešimus';

  @override
  String get privacyPolicy => 'Privatumo politika';

  @override
  String get termsOfService => 'Paslaugų teikimo sąlygos';

  @override
  String get rateApp => 'Įvertinti programą';

  @override
  String get version => 'Versija';

  @override
  String get about => 'Apie';

  @override
  String get proTitle => 'PRO';

  @override
  String get proActive => 'PRO — Aktyvus ✓';

  @override
  String get upgradeToProCTA => 'Atnaujinti į PRO';

  @override
  String get upgradeSubtitle =>
      'Atrakinkite pilną streso mažinimo įrankių rinkinį';

  @override
  String get proPrice => 'USD 6.50 vienkartinis mokestis';

  @override
  String get oneTimePayment => 'Vienkartinis mokestis • Amžina prieiga';

  @override
  String get noSubscription => 'Be prenumeratos, be pakartotinių mokesčių';

  @override
  String unlockPro(String price) {
    return 'Atrakinti PRO — $price';
  }

  @override
  String get restorePurchases => 'Atkurti pirkimus';

  @override
  String get proThankYou => 'Ačiū už palaikymą!';

  @override
  String get youHavePro => 'Turite PRO!';

  @override
  String get proFeaturesUnlocked => 'Visos PRO funkcijos atrakintpos.';

  @override
  String get awesome => 'Puiku!';

  @override
  String get checkingPurchases => 'Tikrinami pirkimai...';

  @override
  String get recipeBook => 'Receptų knyga';

  @override
  String get recipes22 => '22 receptai, mažinantys kortizolio kiekį';

  @override
  String get searchRecipes => 'Ieškoti receptų...';

  @override
  String get ingredients => 'Ingredientai';

  @override
  String get instructions => 'Instrukcijos';

  @override
  String get whyItWorks => 'Kodėl tai veikia';

  @override
  String servings(int count) {
    return '$count porcijos';
  }

  @override
  String prepTime(String time) {
    return 'Paruošimas: $time';
  }

  @override
  String totalTime(String time) {
    return 'Viso: $time';
  }

  @override
  String get meditationLibrary => 'Meditacijos biblioteka';

  @override
  String get guidedMeditations => 'Vadovaujamos meditacijos nuo streso';

  @override
  String get appBlocker => 'Programų blokatorius';

  @override
  String get morningFocusMode => 'Ryto fokusavimosi režimas';

  @override
  String get enableAppBlocker => 'Įjungti blokatorių';

  @override
  String get blockDuration => 'Blokavimo trukmė';

  @override
  String get grantPermission => 'Suteikti leidimą';

  @override
  String get unlockWithBreathing =>
      'Atlikite 5 minučių kvėpavimo pratimą, kad atrakintumėte';

  @override
  String get moodInsights => 'DI nuotaikų įžvalgos';

  @override
  String get weeklyPatternAnalysis => 'Savaitinis nuotaikų modelių analizis';

  @override
  String get stressLevel => 'Streso lygis';

  @override
  String get avgMood => 'Vid. nuotaika';

  @override
  String get trend => 'Tendencija';

  @override
  String get weeklyMoodTrend => 'Savaitinė nuotaikų tendencija';

  @override
  String get aiDetectedPatterns => 'DI aptikti modeliai';

  @override
  String get weeklyPersonalizedTip => 'Savaitinis asmeninis patarimas';

  @override
  String get onboarding1Title => 'Sveiki atvykę į\nCortisol Zero';

  @override
  String get onboarding1Subtitle =>
      'Jūsų kasdieninis palydovas streso valdymui ir ramesnio gyvenimo kūrimui.';

  @override
  String get onboarding2Title => 'Supraskite\nSavo Stresą';

  @override
  String get onboarding2Subtitle =>
      'Kortizolio yra jūsų streso hormonas. Kai jis nuolat padidėjęs, tai kenkia jūsų sveikatai.';

  @override
  String get onboarding3Title => 'Jūsų Kelionė\nPrasideda';

  @override
  String get onboarding3Subtitle =>
      'Vos 5 minutės per dieną su Cortisol Zero per kelias savaites gali pastebimai sumažinti jūsų stresą.';

  @override
  String get continueButton => 'Tęsti';

  @override
  String get getStarted => 'Pradėti';

  @override
  String get skip => 'Praleisti';

  @override
  String get moreTitle => 'Daugiau';

  @override
  String get toolsSection => 'Įrankiai';

  @override
  String get proFeaturesSection => 'PRO funkcijos';

  @override
  String get unlockCortisolZeroPro => 'Atrakinti Cortisol Zero PRO';

  @override
  String get unlock => 'Atrakinti';

  @override
  String get save => 'Išsaugoti';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get close => 'Uždaryti';

  @override
  String get change => 'Keisti';

  @override
  String get scienceBacked => 'Mokslu pagrįstas kortizolio mažintojas';

  @override
  String get free => 'NEMOKAMA';

  @override
  String get whatYouGet => 'Ką gausite';

  @override
  String scheduledAt(String time) {
    return 'Suplanuota: $time';
  }

  @override
  String get dailyTipBadge => 'Dienos patarimas';

  @override
  String get journalLabel => 'Dienoraštis';

  @override
  String get featureNutrition => 'Mityba';

  @override
  String get featureNutritionSub => '20 antistresinio maisto';

  @override
  String get featureSleep => 'Miegas';

  @override
  String get featureSleepSub => 'Stebėk ir tobulink';

  @override
  String get nutritionBannerTitle => 'Antistresinis mitybos vadovas';

  @override
  String get nutritionBannerSub => '20+ kortizolį mažinančių maisto produktų';

  @override
  String minRead(int count) {
    return '$count min. skaitymo';
  }

  @override
  String get filterAll => 'Visi';

  @override
  String get filterBasics => 'Pagrindai';

  @override
  String get filterScience => 'Mokslas';

  @override
  String get filterImpact => 'Poveikis';

  @override
  String get filterReduce => 'Mažinimas';

  @override
  String get filterLifestyle => 'Gyvenimas';

  @override
  String get filterNutrition => 'Mityba';

  @override
  String get filterSleep => 'Miegas';

  @override
  String get filterMind => 'Protas';

  @override
  String get catBasics => 'Pagrindai';

  @override
  String get catScience => 'Mokslas';

  @override
  String get catImpact => 'Poveikis sveikatai';

  @override
  String get catReduction => 'Mažinimo patarimai';

  @override
  String get catLifestyle => 'Gyvenimo būdas';

  @override
  String get catNutrition => 'Mityba';

  @override
  String get catSleep => 'Miegas';

  @override
  String get catExercise => 'Fizinis aktyvumas';

  @override
  String get catMindfulness => 'Sąmoningumas';

  @override
  String get dailyTip0 =>
      'Dabar padarykite 5 gilius kvėpavimus. Kiekvienas ilgas iškvėpimas aktyvuoja klajoklio nervą ir sumažina kortizolį per 60 sekundžių.';

  @override
  String get dailyTip1 =>
      'Išgerkite stiklinę šalto vandens. Nedidelis dehidratacijos lygis padidina kortizolį iki 33%. Hidratacija – tai streso valdymas.';

  @override
  String get dailyTip2 =>
      'Išeikite į lauką 10 minučių. Natūrali šviesa ir žaluma pastebimai mažina kortizolį — net trumpas pasivaikščiojimas padeda.';

  @override
  String get dailyTip3 =>
      'Padėkite telefoną 30 minučių. Kiekvienas pranešimas sukelia mikro kortizolio šuolį. Leiskite nervų sistemai pailsėti.';

  @override
  String get dailyTip4 =>
      'Suvalgykite saują migdolų ar juodojo šokolado. Magnis ir flavanoliai tiesiogiai slopina HPA ašį.';

  @override
  String get dailyTip5 =>
      'Užsirašykite 3 dalykus, už kuriuos esate dėkingi. Vos 5 minutės dėkingumo rašymo sumažina kortizolį 23%.';

  @override
  String get dailyTip6 =>
      'Pasiklausykite ramios muzikos. Muzika 432Hz rezonansu mažina kortizolį ir lėtina širdies ritmą.';

  @override
  String get dailyTip7 =>
      'Praleiskite laiko su artimu žmogumi. Oksitocinas iš teigiamo socialinio kontakto tiesiogiai slopina kortizolį.';

  @override
  String get dailyTip8 =>
      'Išbandykite 4-7-8 kvėpavimą prieš stresą keliantį darbą. Įkvėpkite 4, sulaikykite 7, iškvėpkite 8. Natūralus raminamasis.';

  @override
  String get dailyTip9 =>
      'Pusryčiaukite per 90 minučių nuo pabudimo. Pusryčių praleidimas sukelia kortizolio šuolius palaikant cukraus lygį kraujyje.';

  @override
  String get dailyTip10 =>
      'Nustatykite ekranų draudimą 1 valandą prieš miegą. Mėlyna šviesa slopina melatoniną ir laiko kortizolį padidėjusį naktį.';

  @override
  String get dailyTip11 =>
      'Judėkite 20 minučių. Vidutinis fizinis aktyvumas sukuria „kortizolio dividendą“ — lygis krenta žemiau normos valandų valandas.';

  @override
  String get dailyTip12 =>
      'Išgerkite puodelį ramunėlių ar žaliosios arbatos. L-teaninas žaliojoje arbatoje skatina ramų budrumą; ramunėlių apigeninas jungiasi prie GABA receptorių.';

  @override
  String get dailyTip13 =>
      'Praktikuokite progresinį raumenų atpalaidavimą. Įtempkite ir atpalaiduokite kiekvieną raumenų grupę. Tai tiesiogiai aktyvuoja parasimpatinę nervų sistemą.';

  @override
  String get eduTitle000 => 'Kas yra kortizolis?';

  @override
  String get eduTitle001 => 'Kortizolio ritmas';

  @override
  String get eduTitle002 => 'HPA ašis: kaip tai veikia';

  @override
  String get eduTitle003 => 'Kortizolis prieš adrenaline';

  @override
  String get eduTitle004 => 'Kaip padidėjęs kortizolis veikia jūsų kūną';

  @override
  String get eduTitle005 => 'Kortizolis ir jūsų nuotaika';

  @override
  String get eduTitle006 => 'Gilus kvėpavimas: greičiausias būdas';

  @override
  String get eduTitle007 => 'Gamtos galia';

  @override
  String get eduTitle008 => 'Fizinis aktyvumas: laikas svarbu';

  @override
  String get eduTitle009 => 'Socialinis ryšys mažina kortizolį';

  @override
  String get eduTitle010 => 'Miegas ir kortizolis: užburtas ratas';

  @override
  String get eduTitle011 => 'Joga ir streso atsakas';

  @override
  String get eduTitle012 => 'Sąmoningo dėmesio meditacija: įrodyti rezultatai';

  @override
  String get eduTitle013 => 'Maistas, didinantis kortizolį';

  @override
  String get eduTitle014 => 'Žarnyno-smegenų-kortizolio ryšys';

  @override
  String get eduTitle015 => 'Magnis: antistresinis mineralas';

  @override
  String get eduTitle016 => 'Dienoraštis kaip kortizolio vaistas';

  @override
  String get eduContent000 =>
      'Kortizolis yra pagrindinis jūsų kūno streso hormonas, gaminamas antinksčių, esančių virš inkstų. Dažnai vadinamas „streso hormonu\", jis atlieka svarbų vaidmenį jūsų kūno „kovok arba bėk\" reakcijoje.\n\nKai susiduriate su stresine situacija, jūsų smegenų hipotalamas paleidžia signalų kaskadą, kuri veda į kortizolio išsiskyrimą. Tai paruošia jūsų kūną kovoti arba bėgti — padidindama širdies ritmą, kraujospūdį ir cukraus kiekį kraujyje.\n\nSveikais kiekiais kortizolis yra gyvybiškai svarbus. Jis padeda reguliuoti medžiagų apykaitą, mažina uždegimą ir padeda formuoti atminties. Problema kyla, kai kortizolio lygis lieka chroniškai padidėjęs dėl nuolatinio streso.';

  @override
  String get eduContent001 =>
      'Kortizolis laikosi natūralaus kasdienio ritmo, vadinamo paros kortizolio modeliu. Lygis paprastai yra aukščiausias ryte (apie 8 val.), tai padeda jums pabusti ir jaustis budriam. Jis palaipsniui mažėja dienos eigoje, pasiekdamas žemiausią tašką apie vidurnaktį.\n\nTai vadinama kortizolio pabudimo reakcija (CAR). Sveikos CAR metu kortizolis padidėja 50-160% per 30 minučių nuo pabudimo — gamtos pažadintuvas.\n\nŠiuolaikinis gyvenimo būdas sutrikdo šį ritmą per blogą miegą, chroniška stresą, dirbtinę šviesą naktį ir netaisyklingus valgymo laikus. Kai ritmas sutrikdomas, galite jaustis išsekę ryte ir sužadinti naktį.';

  @override
  String get eduContent002 =>
      'Hipotalamo-hipofizės-antinksčių (HPA) ašis yra jūsų kūno centrinė streso reakcijos sistema. Štai kaip ji veikia:\n\n1. **Hipotalamas** aptinka stresą ir išskiria CRH (kortikotropiną atpalaiduojantį hormoną)\n2. **Hipofizė** gauna CRH ir išskiria ACTH (adrenokortikotropinį hormoną)\n3. **Antinksčiai** gauna ACTH ir gamina kortizolį\n4. **Neigiamo grįžtamojo ryšio kilpa**: kai kortizolio lygis pakankamai aukštas, jis signalizuoja hipotalamui sulėtinti gamybą\n\nChroniškas stresas gali sutrikdyti šią grįžtamojo ryšio kilpą, sukeldamas nuolat padidėjusį kortizolį, kurio kūnas nebegali tinkamai slopinti.';

  @override
  String get eduContent003 =>
      'Daugelis žmonių painioja kortizolį su adrenalinu (epinefrinu). Nors abu yra streso hormonai, jie veikia skirtingai:\n\n**Adrenalinas** yra greitas — jis pradeda veikti per kelias sekundes ūminio streso metu, sukeldamas širdies dažnio padidėjimą ir delnų prakaitavimą. Jo poveikis greitai praeina.\n\n**Kortizolis** yra lėtas — jam reikia minučių, kad suaktyvėtų, bet jo poveikis trunka valandas ar dienas. Jis skirtas ilgalaikėms grėsmėms, ne staigus.\n\nŠiuolaikinė problema yra tai, kad mūsų psichologiniai stresoriai (terminai, eismas, socialiniai tinklai) nuolat aktyvuoja kortizolio kelią — laikydami jį padidėjusį tarsi nuolat susidurtume su plėšrūnu.';

  @override
  String get eduContent004 =>
      'Chroniškai padidėjęs kortizolis turi toli siekiančias pasekmes:\n\n🩺 **Imuninė sistema**: slopina imuninį atsaką, darydama jus jautresnius ligoms\n⚖️ **Svoris**: skatina riebalų kaupimą, ypač visceralinį pilvo riebalą\n💤 **Miegas**: sutrikdo miego ciklus, sukeldamas nemigą\n🧠 **Smegenys**: pablogina atmintį ir koncentraciją; laikui bėgant gali sumažinti hipokampą\n❤️ **Širdis**: didina kraujospūdį ir kardiovaskulinę riziką\n🦴 **Kaulai**: mažina kaulų tankį\n🩸 **Cukrus kraujyje**: sukelia atsparumą insulinui\n\nGera žinia? Šie poveikiai yra daugiausia atšaukiami tinkamai valdant stresą.';

  @override
  String get eduContent005 =>
      'Kortizolio ir psichikos sveikatos ryšys yra gilus. Didelis kortizolis siejamas su:\n\n**Nerimu**: kortizolis sustiprina migdolinio kūno grėsmių aptikimą, viską verčia jaustis pavojingiau.\n\n**Depresija**: chroniškai padidėjęs kortizolis mažina serotoniną ir dopaminą — „geros savijautos\" neurotransmiterius.\n\n**Smegenų rūkas**: kortizolis konkuruoja su gliukoze prefrontalinėje žievėje, pablogindamas aiškų mąstymą, sprendimų priėmimą ir dėmesį.\n\n**Emocinė reaktyvumas**: jūs tampate lengviau suerzinami dėl smulkių nusivylimų.\n\nĮdomu tai, kad labai žemas kortizolis (antinksčių nuovargis) taip pat gali sukelti depresiją ir ypatingą nuovargį — pusiausvyra yra svarbiausia.';

  @override
  String get eduContent006 =>
      'Gilus, diafragminis kvėpavimas yra vienas galingiausių ir greičiausių būdų sumažinti kortizolį. Štai mokslas:\n\nKai kvėpuojate lėtai ir giliai, jūs aktyvuojate parasimpatinę nervų sistemą — „poilsio ir virškinimo\" atsaką, kuris tiesiogiai priešinasi streso reakcijai.\n\nKlajoklio nervas, einantis nuo jūsų smegenų iki žarnyno, yra stimuliuojamas gilaus kvėpavimo. Tai siunčia „saugumo\" signalą per visą jūsų kūną, sumažindamas kortizolio lygį per kelias minutes.\n\n**4-7-8 technika**: įkvėpkite 4 sekundes, sulaikykite 7, iškvėpkite 8. Ilgas iškvėpimas yra svarbiausias — jis aktyvuoja vagalinį stabdį jūsų streso reakcijai.';

  @override
  String get eduContent007 =>
      'Moksliškai įrodyta, kad laikas gamtoje mažina kortizolį. Japoniška praktika „Shinrin-yoku\" (miško maudynės) buvo plačiai ištirta:\n\n🌿 Vos 20 minučių miške sumažina kortizolį 15,8%\n🌳 Žaliosios erdvės mažina ir seilių kortizolį, ir širdies ritmą\n🌊 Mėlynosios erdvės (vandens aplinkos) turi panašų poveikį\n🌸 Net gamtos vaizdų žiūrėjimas mažina streso žymenis\n\nJums nereikia miško. Net 10 minučių pasivaikščiojimas vietiniame parke, augalų priežiūra ar sėdėjimas prie lango su sodo vaizdu aktyvuoja gamtos raminamąjį poveikį jūsų HPA ašiai.';

  @override
  String get eduContent008 =>
      'Fizinis aktyvumas yra dviašmenis kardas kortizolio atžvilgiu. Tai supratus, galite optimizuoti savo treniruotes:\n\n**Treniruotės metu**: kortizolis didėja, kad mobilizuotų energiją — tai sveika ir normalu.\n\n**Po vidutinio fizinio aktyvumo**: kortizolis nukrenta žemiau normos valandų valandas, suteikdamas „kortizolio dividendą\".\n\n**Perteklinis treniravimasis**: pernelyg intensyvus fizinis aktyvumas laiko kortizolį chroniškai padidėjusį. Daugiau ne visada geriau.\n\n**Geriausios praktikos kortizolio pusiausvyrai**:\n• Rytinis vidutinis kardio (30-45 min) yra optimalus\n• Venkite intensyvių treniruočių vėlai vakare\n• Įtraukite poilsio dienas — jose vyksta adaptacija\n• Joga ir tai či ypač efektyviai mažina kortizolį';

  @override
  String get eduContent009 =>
      'Žmogiškas ryšys yra galingas kortizolio buferis. Tyrimai rodo:\n\n• **Oksitocinas** („ryšio hormonas\") tiesiogiai slopina kortizolio išsiskyrimą\n• Žmonės su stipria socialine parama turi 25% mažesnį kortizolio atsaką į stresą\n• Net trumpos teigiamos socialinės sąveikos mažina kortizolį\n• Augintinių turėjimas reikšmingai mažina kortizolį — šuns glostymas 10 minučių pastebimai sumažina kortizolį\n• Vienatvė, priešingai, didina kortizolį — ji suvokiama kaip išlikimo grėsmė\n\nTodėl izoliacija yra tiek fiziškai žalinga. Jūsų kūnui tikrai reikia socialinio kontakto streso reakcijai reguliuoti.';

  @override
  String get eduContent010 =>
      'Didelis kortizolis ir blogas miegas sudaro pavojingą grįžtamojo ryšio kilpą:\n\n**Didelis kortizolis → blogas miegas**: kortizolis yra stimuliuojantis. Kai jis padidėjęs naktį, jis neleidžia smegenims pasiekti gilaus, atkuriamojo miego fazių.\n\n**Blogas miegas → didelis kortizolis**: net viena blogai pramiegota naktis padidina kortizolį 37% kitą dieną.\n\n**Kaip nutraukti ciklą**:\n✓ Laikykitės nuoseklaus miego/pabudimo grafiko (net savaitgaliais)\n✓ Venkite ekranų 1 valandą prieš miegą — mėlyna šviesa slopina melatoniną\n✓ Palaikykite vėsią miegamojo temperatūrą (18-20°C yra optimalus)\n✓ Venkite kofeino po 14 val.\n✓ Praktikuokite atsipalaidavimo rutiną (skaitymas, švelnūs tempimo pratimai, kvėpavimo pratimai)';

  @override
  String get eduContent011 =>
      'Joga yra viena geriausiai ištirtų intervencijų kortizolio mažinimui:\n\n**Tyrimai rodo**, kad 8 savaičių reguliari jogos praktika mažina rytinį kortizolį iki 30%.\n\n**Kodėl joga veikia**:\n• Derina kvėpavimą, judėjimą ir sąmoningumą — trigubas kortizolio mažinimo efektas\n• Aktyvuoja parasimpatinę nervų sistemą per sąmoningą kvėpavimą\n• Mažina migdolinio kūno reaktyvumą (padaro jus mažiau lengvai suerzinamu)\n• Gerina GABA lygį — smegenų raminantį neurotransmiterį\n\n**Geriausi stiliai kortizoliui**: Hatha, Yin, Atkuriamoji ir Joga Nidra (joginis miegas) yra ypač efektyvūs. Net 10 minučių švelnios jogos prieš miegą gali pakeisti miego kokybę.';

  @override
  String get eduContent012 =>
      'Sąmoningo dėmesio streso mažinimas (MBSR) buvo griežtai tiriamas nuo 1970-ųjų. Rezultatai įtikinami:\n\n🧪 **8 savaitės** MBSR mažina kortizolį 20-25%\n🧠 **Keičia smegenų struktūrą**: augina prefrontalinę žievę (racionalus mąstymas) ir mažina migdolinį kūną (baimės centras)\n💊 **Lygiavertis vaistams** nuo lengvo-vidutinio nerimo keliuose tyrimuose\n❤️ **Mažina uždegimo** žymenis (CRP, IL-6), kurie susiję su kortizoliu\n\nJums nereikia valandų. Tyrimai rodo, kad **10 minučių kasdien** sąmoningo dėmesio praktikos sukuria išmatuojamą kortizolio sumažėjimą per 4 savaites.';

  @override
  String get eduContent013 =>
      'Jūsų mityba tiesiogiai veikia kortizolį. Šie maisto produktai gali padidinti streso hormonus:\n\n☕ **Kofeinas**: padidina kortizolį 30% net įpratusiems kavos gėrėjams. Palaukite 90 minučių po pabudimo prieš pirmą puodelį.\n\n🍬 **Cukraus šuoliai**: greiti gliukozės svyravimai sukelia kortizolio išsiskyrimą. Rinkitės žemo glikeminio indekso maistą.\n\n🥃 **Alkoholis**: iš pradžių raminantis, alkoholis sutrikdo miego struktūrą ir padidina kortizolį kitą dieną.\n\n🔥 **Uždegimą sukeliantis maistas**: transriebalai, perdirbtieji augaliniai aliejai ir ultra perdirbtas maistas didina sisteminį uždegimą, kuris kelia kortizolį.\n\n🧂 **Per didelis natrio kiekis**: didelio natrio kiekio dieta siejama su padidėjusiu kortizolio lygiu keliuose tyrimuose.';

  @override
  String get eduContent014 =>
      'Jūsų žarnyno mikrobiomas turi tiesioginį ryšį su jūsų streso reakcija — žarnyno-smegenų ašis:\n\n🦠 **Žarnyno bakterijos gamina neurotransmiterius**: 90% serotonino pagaminama žarnyne. Nesubalansuota žarnyno flora reiškia mažiau serotonino, didesnį jautrumą stresui.\n\n🔗 **Klajoklio nervas** jungia žarnyną su smegenimis — žarnyno uždegimas tiesiogiai aktyvuoja HPA ašį.\n\n🥛 **Probiotikai mažina kortizolį**: tyrimai rodo, kad Lactobacillus rhamnosus papildai mažina nerimą ir kortizolio atsaką į stresą.\n\n**Maistas sveikam žarnyno mikrobiomui**:\n• Fermentuoti maisto produktai (kefyras, jogurtas, kimchi, raugintas kopūstas)\n• Prebiotinės skaidulos (česnakas, svogūnai, avižos, bananai)\n• Polifenoliais turtingi maisto produktai (uogos, juodasis šokoladas, žalioji arbata)';

  @override
  String get eduContent015 =>
      'Magnis dažnai vadinamas „gamtos trankvilizatoriumi\" — ir ne be reikalo:\n\n**Kortizolio ryšys**: magnis reguliuoja HPA ašį. Trūkumas leidžia kortizoliui veikti nekontroliuojamai, o pakankamas magnis stabdo per didelį kortizolio išsiskyrimą.\n\n**Trūkumo epidemija**: iki 68% amerikiečių turi magnio trūkumą. Pats chroniškas stresas sekina magnį — sukurdamas užburtą ratą.\n\n**Trūkumo požymiai**: nerimas, raumenų įtampa, blogas miegas, dirglumas, galvos skausmai, potraukis saldumynams.\n\n**Geriausio maisto šaltiniai**: tamsiai žali lapiniai daržovės (špinatai, kale), moliūgų sėklos, migdolai, avokadai, juodasis šokoladas, ankštiniai augalai, pilno grūdo produktai.\n\n**Papildai**: magnio glicinatas ir magnio treonatas turi geriausią absorbciją ir smegenų pralaidumą.';

  @override
  String get eduContent016 =>
      'Rašymas apie savo emocijas kliniškai įrodyta mažina kortizolį:\n\n📝 **Ekspresyvus rašymas** (rašymas apie stresines patirtis) mažina kortizolio atsaką vėlesnėse stresinėse situacijose\n\n🧠 **Kodėl tai veikia**: rašymas aktyvuoja prefrontalinę žievę (racionalios smegenys), kuri gali reguliuoti migdolinį kūną (emocinės smegenys) — mažindama kortizolio „čiaupą\"\n\n💙 **Dėkingumo dienoraštis** yra ypač galingas: net trumpas kasdienis dėkingumo rašymas mažina kortizolį 23% (UCDavis tyrimas)\n\n**Kaip pradėti**: tik 15 minučių, 3 dienas per savaitę. Neredaguokite, tiesiog rašykite. Sutelkite dėmesį ir į tai, kas įvyko, ir kaip jūs dėl to jautėtės.\n\nŠios programos dienoraščio funkcija sukurta būtent šiam tikslui — jūsų kasdieniai įrašai kaupiasi į galingą savimonės praktiką.';

  @override
  String get nutFilterAll => 'Visi';

  @override
  String get nutFilterFruits => 'Vaisiai';

  @override
  String get nutFilterVegetables => 'Daržovės';

  @override
  String get nutFilterProteins => 'Baltymai';

  @override
  String get nutFilterBeverages => 'Gėrimai';

  @override
  String get nutFilterNutsSeeds => 'Riešutai ir sėklos';

  @override
  String get nutFilterGrains => 'Grūdai';

  @override
  String get nutFilterDairy => 'Pieno produktai';

  @override
  String get nutFilterSpices => 'Prieskoniai';

  @override
  String get nutCatFruits => 'Vaisiai';

  @override
  String get nutCatVegetables => 'Daržovės';

  @override
  String get nutCatProteins => 'Baltymai';

  @override
  String get nutCatBeverages => 'Gėrimai';

  @override
  String get nutCatNutsSeeds => 'Riešutai ir sėklos';

  @override
  String get nutCatGrains => 'Grūdai';

  @override
  String get nutCatDairy => 'Pieno produktai';

  @override
  String get nutCatSpices => 'Prieskoniai';

  @override
  String get foodName000 => 'Mėlynės';

  @override
  String get foodBenefit000 =>
      'Galingi antioksidantai mažina oksidacinį stresą';

  @override
  String get foodMechanism000 =>
      'Turtingos antocianinais, kurie prasiskverbia pro hematoencefalinį barjerą, mažinant neurouždegimą ir kortizolio sukeltą oksidacinį pažeidimą. Tyrimai rodo, kad mėlynių ekstraktas mažina kortizolio atsaką po ūminio streso.';

  @override
  String get foodServing000 =>
      'Įdėkite saujelę į avižas, mirkytas per naktį, arba sumaišykite į smūtį';

  @override
  String get foodNutrients000 => 'Vitamin C, Anthocyanins, Fiber, Vitamin K';

  @override
  String get foodName001 => 'Bananai';

  @override
  String get foodBenefit001 =>
      'Kalis mažina kraujospūdį; triptofanas didina serotonino kiekį';

  @override
  String get foodMechanism001 =>
      'Bananai turi triptofano — serotonino pirmtako, kuris yra raminantis neurotransmiteris, moduliuojantis kortizolį. Kalis neutralizuoja kortizolio poveikį kraujospūdžiui. Natūralūs cukrūs suteikia greitą energiją be kortizolio šuolio.';

  @override
  String get foodServing001 =>
      'Supjaustykite ant migdolų sviesto skrebučio — puikus stresą malšinantis užkandis';

  @override
  String get foodNutrients001 => 'Potassium, Tryptophan, Vitamin B6, Magnesium';

  @override
  String get foodName002 => 'Apelsinai';

  @override
  String get foodBenefit002 =>
      'Didelis vitamino C kiekis tiesiogiai mažina kortizolį';

  @override
  String get foodMechanism002 =>
      'Vitaminas C greitai sunaudojamas antinksčių liaukų kortizolio gamybos metu. Vitamino C papildymas mažina kortizolio atsaką į psichologinius stresorius. 2001 m. Vokietijos tyrimas nustatė, kad 1000 mg vitamino C sumažino kortizolį ir kraujospūdį per viešojo kalbėjimo testus.';

  @override
  String get foodServing002 =>
      'Valgykite visą vaisių (ne sultis) dėl skaidulų; vartokite prieš stresines situacijas';

  @override
  String get foodNutrients002 => 'Vitamin C, Folate, Potassium, Flavonoids';

  @override
  String get foodName003 => 'Avokadai';

  @override
  String get foodBenefit003 => 'Sveiki riebalai mažina streso sukeltą uždegimą';

  @override
  String get foodMechanism003 =>
      'Avokadai turtingi mononesočiaisiais riebalais, kurie palaiko antinksčių sveikatą ir mažina uždegiminius citokinus, susijusius su HPA ašies aktyvacija. B vitaminai (B5, B6) palaiko antinksčių hormonų gamybą. Magnis tiesiogiai moduliuoja HPA ašį.';

  @override
  String get foodServing003 =>
      'Uždėkite pjaustytų avokadų ant lašišos ar kiaušinių; dėkite į smūčius kremingumo suteikimui';

  @override
  String get foodNutrients003 =>
      'Magnesium, B5 (Pantothenic Acid), B6, Monounsaturated Fats, Potassium';

  @override
  String get foodName004 => 'Špinatai';

  @override
  String get foodBenefit004 => 'Turtingi magniu — gamtos raminamasis';

  @override
  String get foodMechanism004 =>
      'Špinatai yra vienas turtingiausių maisto produktų magniu, kuris reguliuoja HPA ašį ir slopina per didelį kortizolio išsiskyrimą. Magnio trūkumas tiesiogiai susijęs su padidėjusiu kortizoliu. Folatai špinatuose taip pat palaiko GABA gamybą — smegenų raminantį neurotransmiterį.';

  @override
  String get foodServing004 =>
      'Troškinkite su česnaku kaip garnyras arba sumaišykite žalius į rytinius smūčius (skonis maskuojamas)';

  @override
  String get foodNutrients004 =>
      'Magnesium, Folate, Iron, Vitamin K, Vitamin C';

  @override
  String get foodName005 => 'Batatai';

  @override
  String get foodBenefit005 =>
      'Ilgalaikė energija apsaugo nuo kortizolio šuolių dėl cukraus kiekio kraujyje kritimo';

  @override
  String get foodMechanism005 =>
      'Batatai teikia lėtai atpalaiduojamus kompleksinius angliavandenius, kurie apsaugo nuo cukraus kiekio kraujyje kritimo, sukeliančio kortizolio išsiskyrimą. Purpurinės veislės ypač turtingos antocianinais. Didelis kalio kiekis padeda neutralizuoti kortizolio poveikį kraujospūdžiui.';

  @override
  String get foodServing005 =>
      'Kepkite su alyvuogių aliejumi ir cinamonu; trinkite kaip garnyrą arba Budos dubenėlių pagrindą';

  @override
  String get foodNutrients005 =>
      'Potassium, Vitamin A, Fiber, Vitamin C, Manganese';

  @override
  String get foodName006 => 'Brokoliai';

  @override
  String get foodBenefit006 =>
      'Sulforafanas apsaugo nuo streso sukeltų smegenų pažeidimų';

  @override
  String get foodMechanism006 =>
      'Sulforafanas brokoliuose aktyvuoja Nrf2 — organizmo pagrindinį antioksidantinį jungiklį — apsaugodamas neuronus nuo kortizolio sukeltų oksidacinių pažeidimų. Brokoliai taip pat turtingi vitaminu C, magniu ir folatais — tiesioginiais kortizolio moduliatoriais.';

  @override
  String get foodServing006 =>
      'Lengvai garuokite sulforafanui išsaugoti; pabarstykite citrinos sultimis ir alyvuogių aliejumi';

  @override
  String get foodNutrients006 =>
      'Sulforaphane, Vitamin C, Folate, Calcium, Fiber';

  @override
  String get foodName007 => 'Lašiša';

  @override
  String get foodBenefit007 =>
      'Omega-3 riebalai tiesiogiai slopina kortizolio gamybą';

  @override
  String get foodMechanism007 =>
      'EPA ir DHA (omega-3 riebalų rūgštys) lašišoje mažina kortizolį dviem būdais: sumažina hipotalaminį CRH išsiskyrimą ir mažina neurouždegimą, kuris sustiprina streso reakcijas. Tyrimai rodo, kad reguliarus omega-3 vartojimas sumažina kortizolio reaktyvumą iki 22%.';

  @override
  String get foodServing007 =>
      'Kepkite su citrinos sultimis ir žolelėmis 2–3 kartus per savaitę; patiekite su lapinėmis daržovėmis ir avokadu';

  @override
  String get foodNutrients007 =>
      'EPA/DHA Omega-3, Vitamin D, B12, Selenium, Protein';

  @override
  String get foodName008 => 'Kalakutiena';

  @override
  String get foodBenefit008 =>
      'Triptofanas didina serotoniną, saugodamas nuo streso';

  @override
  String get foodMechanism008 =>
      'Kalakutiena išskirtinai turtinga triptofanu, kurį organizmas paverčia serotoninu ir melatoninu. Serotoninas moduliuoja kortizolio išsiskyrimą ir skatina emocinį reguliavimą. B vitaminai kalakutienoje taip pat palaiko antinksčių funkciją.';

  @override
  String get foodServing008 =>
      'Pjaustykite į vyniotinukus su avokadu ir špinatais; dėkite į salotas kaip liesas baltymas';

  @override
  String get foodNutrients008 => 'Tryptophan, B3 (Niacin), B6, Selenium, Zinc';

  @override
  String get foodName009 => 'Kiaušiniai';

  @override
  String get foodBenefit009 =>
      'Visavertis baltymas su cholinu palaiko smegenų streso atsaką';

  @override
  String get foodMechanism009 =>
      'Kiaušiniuose yra cholino, būtino acetilcholino gamybai — neurotransmiteriui, reguliuojančiam parasimpatinę (poilsio) nervų sistemą. Įrodyta, kad kiaušinių trynių fosfatidilserinas sumažina kortizolio atsaką į fizinį krūvį iki 30%.';

  @override
  String get foodServing009 =>
      'Sumaišykite su špinatais ir ciberžole; virkite kietai virtus kaip nešiojamus užkandžius';

  @override
  String get foodNutrients009 =>
      'Choline, Phosphatidylserine, B12, Vitamin D, Tryptophan';

  @override
  String get foodName010 => 'Žalioji arbata';

  @override
  String get foodBenefit010 =>
      'L-teaninas skatina ramų budrumą be kortizolio šuolio';

  @override
  String get foodMechanism010 =>
      'L-teaninas, būdingas tik arbatos lapams, didina alfa smegenų bangas (susijusias su atsipalaidavusiu dėmesio sutelkimu) ir skatina GABA gamybą. Jis neutralizuoja kofeino kortizolį didinantį poveikį, mažindamas streso atsaką ir išlaikydamas psichinį aiškumą.';

  @override
  String get foodServing010 =>
      'Gerkite 2–3 puodelius per dieną; ruoškite 80°C temperatūroje (ne verdančiame vandenyje), kad išsaugotumėte L-teaniną';

  @override
  String get foodNutrients010 =>
      'L-theanine, EGCG (catechins), Caffeine (low), Antioxidants';

  @override
  String get foodName011 => 'Ramunėlių arbata';

  @override
  String get foodBenefit011 =>
      'Apigeninas jungiasi prie GABA receptorių, mažindamas nerimą';

  @override
  String get foodMechanism011 =>
      'Ramunėlėse yra apigenino — flavonoido, kuris jungiasi prie smegenų GABA receptorių, tų pačių, į kuriuos nukreipti nerimo vaistai, tačiau su švelniu, natūraliu poveikiu. Reguliarus vartojimas mažina kortizolio lygį ir gerina miego kokybę.';

  @override
  String get foodServing011 =>
      'Gerkite 1–2 puodelius prieš miegą kaip atsipalaidavimo ritualo dalį';

  @override
  String get foodNutrients011 =>
      'Apigenin, Bisabolol, Chamazulene, Antioxidants';

  @override
  String get foodName012 => 'Migdolai';

  @override
  String get foodBenefit012 =>
      'Magnis ir vitaminas E apsaugo nuo streso sukeltų pažeidimų';

  @override
  String get foodMechanism012 =>
      'Migdolai suteikia 20% dienos magnio normos viename uncijoje — tiesiogiai slopindami per didelį HPA ašies aktyvumą. Vitaminas E yra antioksidantas, apsaugantis antinksčių ląsteles nuo laisvųjų radikalų pažeidimo, kurį sukelia lėtinė kortizolio gamyba.';

  @override
  String get foodServing012 =>
      'Maža saujelė (23 migdolai) kaip vidurdienio užkandis; dėkite į avižų košę';

  @override
  String get foodNutrients012 =>
      'Magnesium, Vitamin E, Monounsaturated Fats, Protein, Fiber';

  @override
  String get foodName013 => 'Moliūgų sėklos';

  @override
  String get foodBenefit013 =>
      'Cinko trūkumas susijęs su aukštu kortizoliu — moliūgų sėklos yra turtingiausias šaltinis';

  @override
  String get foodMechanism013 =>
      'Cinkas yra svarbus kofaktorius neigiamojo grįžtamojo ryšio kilpoje, kuri stabdo kortizolio gamybą. Cinko trūkumas sukelia lėtinį kortizolio padidėjimą. Moliūgų sėklos yra turtingiausias augalinis cinko šaltinis, be to, jose yra triptofano ir magnio.';

  @override
  String get foodServing013 =>
      'Skrudintas dėkite į salotas, sriubas ar traiškanučius; maišykite į avižų košę';

  @override
  String get foodNutrients013 =>
      'Zinc, Tryptophan, Magnesium, Phosphorus, Manganese';

  @override
  String get foodName014 => 'Avižos';

  @override
  String get foodBenefit014 =>
      'Kompleksiniai angliavandeniai stabilizuoja cukraus kiekį kraujyje ir didina serotonino kiekį';

  @override
  String get foodMechanism014 =>
      'Avižos teikia kompleksinius angliavandenilius, kurie skatina serotonino gamybą (angliavandeniai didina triptofano įsisavinimą smegenyse). Beta-gliukano skaidulos skatina sveiką žarnyno mikrobiotą, kuri palaiko žarnyno ir smegenų ašį kortizolio reguliavimui. Jos apsaugo nuo cukraus kiekio kraujyje kritimo, kuris sukelia kortizolį.';

  @override
  String get foodServing014 =>
      'Vakare paruoškite avižas, mirkytas per naktį, su mėlynėmis, graikiniais riešutais ir medumi';

  @override
  String get foodNutrients014 =>
      'Beta-glucan, B1 (Thiamine), Magnesium, Zinc, Fiber';

  @override
  String get foodName015 => 'Bolivinė balanda';

  @override
  String get foodBenefit015 =>
      'Visavertis baltymas su visomis esminėmis aminorūgštimis neurotransmiterių gamybai';

  @override
  String get foodMechanism015 =>
      'Bolivinė balanda yra visavertis baltymas, turintis visas 9 esmines aminorūgštis, įskaitant triptofaną ir tirozino — atitinkamai serotonino ir dopamino pirmtakus. Jos žemas glikeminis indeksas apsaugo nuo cukraus kiekio svyravimų, kurie sukelia kortizolio išsiskyrimą.';

  @override
  String get foodServing015 =>
      'Naudokite kaip Budos dubenėlių ar Viduržemio jūros salotų pagrindą';

  @override
  String get foodNutrients015 =>
      'Complete Protein, Magnesium, Iron, Fiber, Riboflavin';

  @override
  String get foodName016 => 'Graikiškas jogurtas';

  @override
  String get foodBenefit016 =>
      'Probiotikai palaiko žarnyno ir smegenų ašį kortizolio reguliavimui';

  @override
  String get foodMechanism016 =>
      'Graikiškame jogurte gausu Lactobacillus ir Bifidobacterium padermių, kurios tiesiogiai žarnyne gamina GABA. Tyrimai rodo, kad probiotikų papildai sumažina kortizolį ir nerimą klinikiniuose tyrimuose. Didelis baltymų kiekis palaiko sotumo jausmą ir stabilų cukraus kiekį kraujyje.';

  @override
  String get foodServing016 =>
      'Uždėkite mėlynių ir moliūgų sėklų — visiškas stresą malšinantis pusryčių patiekalas';

  @override
  String get foodNutrients016 =>
      'Probiotics, Protein, Calcium, B12, Tryptophan';

  @override
  String get foodName017 => 'Kefyras';

  @override
  String get foodBenefit017 =>
      'Maistas, turtingiausias probiotikais — tiesiogiai mažina kortizolį per žarnyno ašį';

  @override
  String get foodMechanism017 =>
      'Kefyre yra iki 61 naudingų bakterijų padermės — daug daugiau nei jogurte. Tyrimai rodo, kad kefyro vartojimas mažina kortizolį, moduliuodamas žarnyno mikrobiomo ir smegenų ryšį. Triptofano kiekis taip pat didina serotoniną.';

  @override
  String get foodServing017 =>
      'Gerkite grynai arba maišykite į smūčius; naudokite kaip smūtinių dubenėlių pagrindą';

  @override
  String get foodNutrients017 =>
      'Probiotics (61 strains), Tryptophan, Calcium, B12, K2';

  @override
  String get foodName018 => 'Ciberžolė';

  @override
  String get foodBenefit018 =>
      'Kurkuminas daugelyje tyrimų toks pat efektyvus kaip antidepresantai';

  @override
  String get foodMechanism018 =>
      'Ciberžolės kurkuminas slopina uždegiminius citokinus (IL-6, TNF-alfa), kurie aktyvuoja HPA ašį. Jis taip pat didina BDNF (smegenų kilmės neurotrofinį faktorių), apsaugodamas neuronus nuo kortizolio pažeidimo. Daugybė tyrimų rodo, kad kurkuminas mažina kortizolį ir depresiją taip pat efektyviai kaip kai kurie vaistai.';

  @override
  String get foodServing018 =>
      'Auksinis pienas prieš miegą: šiltas pienas + ciberžolė + juodieji pipirai + medus';

  @override
  String get foodNutrients018 =>
      'Curcumin, Iron, Manganese, Anti-inflammatory compounds';

  @override
  String get foodName019 => 'Juodasis šokoladas (70%+)';

  @override
  String get foodBenefit019 =>
      'Tiesiogiai mažina kortizolį ir adrenaliną — įrodyta klinikiniais tyrimais';

  @override
  String get foodMechanism019 =>
      'Reikšmingas 2009 m. tyrimas nustatė, kad kasdien valgant 40 g juodojo šokolado 2 savaites, kortizolis ir katecholaminai sumažėjo žymiai. Magnio kiekis moduliuoja HPA ašį; flavanoliai didina BDNF ir apsaugo nuo streso sukeltų neuronų pažeidimų. Teobromininas suteikia ramią energiją.';

  @override
  String get foodServing019 =>
      '1–2 plytelės (40 g) po pietų; rinkitės 70%+ kakavos kiekio šokoladą';

  @override
  String get foodNutrients019 =>
      'Magnesium, Flavanols, Theobromine, Iron, Zinc';

  @override
  String get breathTechBelly => 'Pilvo kvėpavimas';

  @override
  String get breathTechBox => 'Kvadratinis kvėpavimas';

  @override
  String get breathTech478 => '4-7-8 kvėpavimas';

  @override
  String get breathDescBelly =>
      'Visų kvėpavimo pratimų pagrindas. Dar vadinamas diafragminiu kvėpavimu – jis iš karto aktyvuoja parasimpatinę nervų sistemą. Puikiai tinka pradedantiesiems arba bet kam, norinčiam greitai nuraminti stresą.';

  @override
  String get breathDescBox =>
      'Naudojamas JAV karinio jūrų pėstininkų ir elitinių sportininkų ramybei išlaikyti esant dideliam spaudimui. Vienodos trukmės fazės sukuria kvadrato modelį, kuris greitai atstato nervų sistemą. Puikiai tinka susikaupimui.';

  @override
  String get breathDesc478 =>
      'Sukurta dr. Andrew Weil pagal jogos pranajamos tradicijas. Pailgintas iškvėpimas (8 sekundės) aktyvuoja klajoklio nervo stabdį streso atsakui. Dr. Weil tai vadina natūraliu nervų sistemos raminamuoju.';

  @override
  String get breathInstrBellyInhale =>
      'Lėtai įkvėpkite per nosį, pripildydami pilvą';

  @override
  String get breathInstrBellyExhale =>
      'Lėtai iškvėpkite per burną, ištuštindami pilvą';

  @override
  String get breathInstrBoxInhale =>
      'Lėtai įkvėpkite per nosį, skaičiuodami iki 4';

  @override
  String get breathInstrBoxHoldFull =>
      'Švelniai sulaikykite — plaučiai pilni, kūnas atsipalaidavęs';

  @override
  String get breathInstrBoxExhale =>
      'Visiškai iškvėpkite per burną, skaičiuodami iki 4';

  @override
  String get breathInstrBoxHoldEmpty =>
      'Švelniai sulaikykite — plaučiai tušti, kūnas atsipalaidavęs';

  @override
  String get breathInstr478Inhale => 'Tyliai įkvėpkite per nosį 4 sekundes';

  @override
  String get breathInstr478Hold => 'Visiškai sulaikykite kvėpavimą 7 sekundes';

  @override
  String get breathInstr478Exhale =>
      'Visiškai iškvėpkite per burną su švilpimo garsu 8 sekundes';

  @override
  String get breathBenefitBelly1 => 'Aktyvuoja parasimpatinę nervų sistemą';

  @override
  String get breathBenefitBelly2 => 'Sumažina kortizolį per kelias minutes';

  @override
  String get breathBenefitBelly3 => 'Mažina širdies ritmą ir kraujospūdį';

  @override
  String get breathBenefitBelly4 => 'Gerina deguonies apykaitą';

  @override
  String get breathBenefitBox1 => 'Greitas streso ir nerimo mažinimas';

  @override
  String get breathBenefitBox2 => 'Gerina susikaupimą ir koncentraciją';

  @override
  String get breathBenefitBox3 =>
      'Naudojamas karinio jūrų pėstininkų ir elito sportininkų';

  @override
  String get breathBenefitBox4 => 'Subalansuoja CO2 ir O2 lygius';

  @override
  String get breathBenefitBox5 => 'Mažina kortizolio atsaką';

  @override
  String get breathBenefit4781 => 'Natūralus raminamasis poveikis';

  @override
  String get breathBenefit4782 => 'Sumažina ūminį nerimą per kelias minutes';

  @override
  String get breathBenefit4783 => 'Aktyvuoja klajoklio nervą';

  @override
  String get breathBenefit4784 => 'Padeda nuo nemigos — darykite prieš miegą';

  @override
  String get breathBenefit4785 => 'Valdo streso sukeltą potraukį maistui';

  @override
  String get breathBenefit4786 => 'Paremtas senovės jogos pranajama';

  @override
  String get durationMin => 'min';

  @override
  String get durationSec => 'sek';

  @override
  String get appBlockerSubtitle =>
      'Blokuokite stresą keliančias programas ryto metu';

  @override
  String get compEducation => 'Mokymosi modulis';

  @override
  String get compBreathing => 'Kvėpavimo pratimai (3)';

  @override
  String get compSoundscapes => 'Garsų peizažai (5)';

  @override
  String get compNutrition => 'Mitybos gidas';

  @override
  String get compJournal => 'Nuotaikų dienoraštis';

  @override
  String get compSleep => 'Miego stebėjimas';

  @override
  String get compMeditation => 'Meditacijų biblioteka';

  @override
  String get compRecipes => 'Receptų knyga (22 receptai)';

  @override
  String get compAppBlocker => 'Programų blokatorius';

  @override
  String get compAiInsights => 'DI nuotaikų įžvalgos';

  @override
  String get compWeeklyAnalysis => 'Savaitinė modelių analizė';

  @override
  String get blockerHeroText =>
      'Pirmos 2 valandos po pabudimo turi aukščiausią kortizolio lygį. Vengiant stresą keliančių programų (socialinių tinklų, naujienų) šiuo metu, jūsų diena gerokai pagerėja.';

  @override
  String blockerActiveStatus(Object hours) {
    return 'Aktyvus — $hours val. po pabudimo';
  }

  @override
  String get blockerInactive => 'Neaktyvus';

  @override
  String blockerDurationLabel(Object hours) {
    return 'Blokavimo trukmė: $hours val.';
  }

  @override
  String get thisWeek => 'Šią savaitę';

  @override
  String get sevenDayAverage => '7 dienų vidurkis';

  @override
  String get vsLastWeek => 'palyginus su praėjusia savaite';

  @override
  String get stressLow => 'Žemas';

  @override
  String get stressModerate => 'Vidutinis';

  @override
  String get stressHigh => 'Aukštas';

  @override
  String get dayMon => 'Pr';

  @override
  String get dayTue => 'An';

  @override
  String get dayWed => 'Tr';

  @override
  String get dayThu => 'Kt';

  @override
  String get dayFri => 'Pn';

  @override
  String get daySat => 'Št';

  @override
  String get daySun => 'Sk';

  @override
  String get moodPattern1obs => 'Jūsų nuotaika linkusi kristi trečiadieniais';

  @override
  String get moodPattern1tip =>
      'Pabandykite suplanuoti 5 minučių kvėpavimo sesiją trečiadienio rytais, kad išvengtumėte savaitės vidurio streso.';

  @override
  String get moodPattern2obs =>
      'Jūs nuolat jaučiatės geriau penktadieniais ir savaitgaliais';

  @override
  String get moodPattern2tip =>
      'Tai rodo, kad darbo stresas yra pagrindinis veiksnys. Programų blokatorius ir rytinis kvėpavimo pratimas gali padėti darbo dienų rytais.';

  @override
  String get moodPattern3obs =>
      'Prastesnė nuotaika susijusi su naktimis, kai miegate mažiau nei 7 valandas';

  @override
  String get moodPattern3tip =>
      'Nuoseklus ėjimas miegoti 22:30 ir ramunėlių latte receptas galėtų pagerinti jūsų bazinę nuotaiką.';

  @override
  String get weeklyTipText =>
      'Remiantis jūsų nuotaikų tendencijomis, kortizolio lygis greičiausiai aukščiausias antradienio ir trečiadienio rytais. Pabandykite 4-7-8 kvėpavimo pratimą prieš pirmą užduotį tomis dienomis. Jūsų dienoraščio įrašai rodo geresnę nuotaiką, kai sportuojate — apsvarstykite 20 minučių vidutinio intensyvumo judėjimo prieš 10 val.';

  @override
  String playingMeditation(Object title) {
    return 'Grojama: $title';
  }

  @override
  String get medTitle1 => 'Ryto kortizolio atstatymas';

  @override
  String get medDesc1 =>
      'Pradėkite dieną reguliuodami kortizolio pabudimo atsaką.';

  @override
  String get medCat1 => 'Rytas';

  @override
  String get medTitle2 => 'Pasiruošimas miegui';

  @override
  String get medDesc2 =>
      'Nuraminkite savo nervų sistemą giliam, atkuriamajam miegui.';

  @override
  String get medCat2 => 'Miegas';

  @override
  String get medTitle3 => 'Nerimo malšinimas';

  @override
  String get medDesc3 => 'Nutraukite streso reakcijos ciklą MBSR technikomis.';

  @override
  String get medCat3 => 'Nerimas';

  @override
  String get medTitle4 => 'Gilus susikaupimas';

  @override
  String get medDesc4 =>
      'Sumažinkite kortizolį įeidami į ramaus produktyvumo būseną.';

  @override
  String get medCat4 => 'Dėmesys';

  @override
  String get medTitle5 => 'Kūno skenavimas';

  @override
  String get medDesc5 =>
      'Atpalaiduokite fizinę įtampą, sukauptą dėl lėtinio streso.';

  @override
  String get medCat5 => 'Kūnas';

  @override
  String get filterBreakfast => 'Pusryčiai';

  @override
  String get filterSmoothies => 'Kokteiliai';

  @override
  String get filterSalads => 'Salotos';

  @override
  String get filterMains => 'Pagrindinis';

  @override
  String get filterSnacks => 'Užkandžiai';

  @override
  String get filterDrinks => 'Gėrimai';

  @override
  String get filterDesserts => 'Desertai';

  @override
  String get moreJournalSub => 'Sekite savo kasdienę nuotaiką';

  @override
  String get moreSleepSub => 'Stebėkite savo miego kokybę';

  @override
  String get moreSettingsSub => 'Tema, kalba, pranešimai';

  @override
  String unlockProButton(Object price) {
    return 'Atrakinti PRO — $price';
  }

  @override
  String get paymentDisclaimer =>
      'Mokėjimą apdoroja Google Play. Vienkartinis mokestis. Be prenumeratos.';

  @override
  String get proThankYouSnackbar =>
      'Ačiū! Visos PRO funkcijos dabar atrakinta.';

  @override
  String get cortisolZeroPro => 'Cortisol Zero PRO';

  @override
  String get proBannerDescription =>
      'Receptai, meditacija, programų blokatorius, DI įžvalgos — \$6.50 vienkartinis';

  @override
  String get aiDemoDataNotice =>
      'Tai demonstracinė peržiūra. Pradėkite registruoti kasdienę nuotaiką, kad matytumėte personalizuotas DI įžvalgas pagal jūsų duomenis.';

  @override
  String get aiDemoLabel => 'Demonstracija';

  @override
  String get recipeWhyItWorks => 'Kodėl tai veikia';

  @override
  String get recipeIngredients => 'Ingredientai';

  @override
  String get recipeInstructions => 'Gaminimo eiga';

  @override
  String recipeServings(int count) {
    return '$count porcijos';
  }

  @override
  String get blockedAppsTitle => 'Blokuojamos programos';

  @override
  String get blockerAddApps => 'Pridėti';

  @override
  String get blockerNoAppsSelected =>
      'Nepasirinktos programos. Spauskite Pridėti, kad pasirinktumėte kokias programas blokuoti ryto metu.';

  @override
  String get blockerSelectApps => 'Pasirinkite programas blokavimui';

  @override
  String get blockerSearchApps => 'Ieškoti programų...';

  @override
  String get blockerLoadingApps => 'Kraunamos įdiegtos programos...';

  @override
  String get blockerStartButton => 'Pradėti blokavimą';

  @override
  String get blockerStopButton => 'Sustabdyti blokavimą';

  @override
  String get blockerPermUsageStats => 'Naudojimo duomenų prieiga';

  @override
  String get blockerPermOverlay => 'Rodyti virš kitų programų';

  @override
  String get blockerRefreshPerms => 'Atnaujinti leidimus';

  @override
  String get proActivatedMessage =>
      'Visos PRO funkcijos atrakintos, pradės veikti po kelių sekundžių.';

  @override
  String get permOnboardingTitle => 'Leidimų nustatymas';

  @override
  String get permStepUsageTitle => 'Naudojimo duomenų prieiga';

  @override
  String get permStepUsageDesc =>
      'Leisk mums matyti, kada atidarai streso šaltinį. Tai būtina blokavimo aktyvavimui.';

  @override
  String get permStepUsageButton => 'Atidaryti naudojimo nustatymus';

  @override
  String get permStepOverlayTitle => 'Rodymas virš programų';

  @override
  String get permStepOverlayDesc =>
      'Leisk mums uždengti streso šaltinį. Tai leis parodyti ramybės ekraną vietoj užblokuotos programėlės.';

  @override
  String get permStepOverlayButton => 'Atidaryti overlay nustatymus';

  @override
  String get permStepGranted => 'Leidimas suteiktas';

  @override
  String get permNextStep => 'Kitas žingsnis';

  @override
  String get permAllDone => 'Viskas paruošta — pirmyn!';

  @override
  String get permBackToStep1 => 'Grįžti į 1 žingsnį';

  @override
  String get permStepUsageLottieHint =>
      'Raskite Cortisol Zero sąraše ir įjunkite prieigą';

  @override
  String get permStepOverlayLottieHint =>
      'Perjunkite jungiklį, kad leistumėte rodyti perdangą';

  @override
  String get permSetupRequired => 'Reikia nustatyti leidimus';

  @override
  String get permSetupRequiredDesc =>
      'Norint blokuoti programėles, reikia trijų leidimų. Paspauskite žemiau, kad juos nustatytumėte.';

  @override
  String get permStepAccessibilityTitle => 'Prieinamumo paslauga';

  @override
  String get permStepAccessibilityDesc =>
      'Cortisol Zero naudoja Android pritaikymo neįgaliesiems paslaugą tik tam, kad aptiktų, kuri programėlė šiuo metu rodoma ekrane (pagal paketo pavadinimą). Ji NEPRIEINA prie žinučių, slaptažodžių, finansinių duomenų ar jokios asmeninės informacijos. Visas aptikimas vyksta tik jūsų įrenginyje ir niekada nėra saugomas ar perduodamas.';

  @override
  String get permStepAccessibilityButton => 'Atidaryti prieinamumo nustatymus';

  @override
  String get permStepAccessibilityLottieHint =>
      'Raskite Cortisol Zero įdiegtų programų sąraše ir įjunkite';

  @override
  String get blockerPermAccessibility => 'Prieinamumo paslauga';

  @override
  String get permBackToStep2 => 'Grįžti į 2 žingsnį';

  @override
  String get permDisclosureAccesses => 'Ką pasiekia';

  @override
  String get permDisclosureAccessesDesc =>
      'Kuri programa šiuo metu rodoma ekrane (tik paketo pavadinimas)';

  @override
  String get permDisclosureNotAccesses => 'Ko NEPASIEKIA';

  @override
  String get permDisclosureNotAccessesDesc =>
      'Žinutės, slaptažodžiai, finansiniai duomenys, asmeninė informacija, naršymo istorija, kontaktai';

  @override
  String get permDisclosureDataUsage => 'Kaip naudojami duomenys';

  @override
  String get permDisclosureDataUsageDesc =>
      'Visas aptikimas vyksta lokaliai jūsų įrenginyje. Niekas nesaugoma ir neperduodama.';

  @override
  String get permUnderstandContinue => 'Suprantu ir tęsiu';

  @override
  String get moodInsights3DayTitle => '3 dienų greitos įžvalgos';

  @override
  String get moodInsightsWeeklyTitle => 'Savaitinė nuotaikų modelio analizė';

  @override
  String get moodInsightsRetry => 'Bandyti dar kartą';

  @override
  String get moodInsightsError => 'Analizė nepavyko. Bandykite dar kartą.';

  @override
  String get moodInsightsNotEnoughData =>
      'Pridėkite bent 2 nuotaikų įrašus, kad pamatytumėte įžvalgas';

  @override
  String get privacyOverviewTitle => 'Kaip tvarkome jūsų duomenis';

  @override
  String get privacyOverviewBody =>
      'Cortisol Zero reikalingi 3 leidimai, kad blokuotų streso programėles. Visas apdorojimas vyksta jūsų įrenginyje. Mes NERENKAME, NESAUGOME ir NESIUNTINĖJAME jokių duomenų į serverius. Neturime vartotojų paskyrų ar analitikos.';

  @override
  String get privacyOverviewAccept => 'Sutinku ir tęsti';

  @override
  String get privacyOverviewLearnMore => 'Privatumo politika';

  @override
  String get privacyOverviewTerms => 'Naudojimo sąlygos';

  @override
  String get permTutorialButton => 'Žiūrėti video pamoką';

  @override
  String get permTapToGrant => 'SUTEIKTI LEIDIMĄ';

  @override
  String get permFindAppText => 'Raskite Cortisol Zero kitame ekrane';

  @override
  String get permTapAndToggle => 'Paspauskite ir įjunkite jungiklį';

  @override
  String get permWhatItDoes => 'Ką leidimas daro';

  @override
  String get permWhatItDoesNot => 'Ko leidimas NEDARO';

  @override
  String get legalSectionTitle => 'Teisinė informacija';

  @override
  String get legalPrivacyPolicy => 'Privatumo politika';

  @override
  String get legalTermsOfService => 'Naudojimo sąlygos';

  @override
  String get todaysMoodRecorded => 'Šiandienos nuotaika: užfiksuota';

  @override
  String blockerScheduleInfo(String time, String hours) {
    return 'Blokavimas suplanuotas nuo $time $hours val. kasdien. Blokavimas baigsis automatiškai.';
  }

  @override
  String get privacyPolicyTitle => 'Privatumo politika';

  @override
  String get privacyPolicyLastUpdated =>
      'Įsigaliojimo data: 2025 m. sausio 1 d.';

  @override
  String get privacyPolicyIntro =>
      'Cortisol Zero (\"mes\", \"mūsų\", \"programa\") įsipareigoja saugoti jūsų privatumą.';

  @override
  String get privacyPolicyDataCollectedTitle => '1. Renkami duomenys';

  @override
  String get privacyPolicyDataCollectedBody =>
      'Cortisol Zero NERENKA jokių asmens duomenų. Visi duomenys (dienoraščio įrašai, miego istorija, kvėpavimo sesijų istorija ir programų blokavimo grafikai) saugomi išimtinai jūsų įrenginyje ir niekada neperduodami į jokį serverį.';

  @override
  String get privacyPolicyPermissionsTitle => '2. Naudojamos teisės';

  @override
  String get privacyPolicyPermissionsBody =>
      '• Pritaikomumo paslauga — nustato, kuri programa šiuo metu rodoma ekrane (tik paketo pavadinimas), kad būtų galima taikyti blokavimo grafiką. Ji NESKAITO jūsų žinučių, slaptažodžių ar asmens duomenų.\n\n• Rodymas virš kitų programų — rodo raminantį perdangos ekraną, kai blokuojama programa atidaroma fokuso valandomis.\n\n• Naudojimo statistika — nuskaito programų naudojimo duomenis blokavimo taisyklėms aktyvuoti. Šie duomenys lieka tik jūsų įrenginyje.\n\n• Priekinio plano paslauga — palaiko blokatorių aktyvų fone jūsų suplanuoto fokuso lango metu.\n\nNė viena iš šių teisių nėra naudojama duomenims rinkti, perduoti ar dalytis su mumis ar trečiosiomis šalimis.';

  @override
  String get privacyPolicyPurchasesTitle => '3. Pirkimai programoje';

  @override
  String get privacyPolicyPurchasesBody =>
      'Pirkimai apdorojami per Google Play. Mes nesaugome mokėjimo informacijos. Gauname tik pirkimo prieigos raktą jūsų PRO statusui patvirtinti.';

  @override
  String get privacyPolicyThirdPartyTitle => '4. Trečiųjų šalių paslaugos';

  @override
  String get privacyPolicyThirdPartyBody =>
      'Mes neintegruojame analizės, reklamos SDK ar gedimų ataskaitų paslaugų, renkančių asmens duomenis. Programoje nėra jokio sekimo kodo.';

  @override
  String get privacyPolicyChildrenTitle => '5. Vaikai';

  @override
  String get privacyPolicyChildrenBody =>
      'Cortisol Zero sąmoningai nerenka informacijos apie vaikus iki 13 metų. Programa skirta bendrajai auditorijai.';

  @override
  String get privacyPolicyContactTitle => '6. Kontaktai';

  @override
  String get privacyPolicyContactBody =>
      'Privatumo klausimais susisiekite su mumis: cartizolzero@gmail.com';

  @override
  String get privacyPolicyChangesTitle => '7. Pakeitimai';

  @override
  String get privacyPolicyChangesBody =>
      'Mes galime atnaujinti šią politiką. Tolesnio programos naudojimas po atnaujinimų reiškia pataisytos politikos priėmimą.';

  @override
  String get termsTitle => 'Naudojimo sąlygos';

  @override
  String get termsLastUpdated => 'Įsigaliojimo data: 2025 m. sausio 1 d.';

  @override
  String get termsIntro =>
      'Naudodamiesi Cortisol Zero, jūs sutinkate su šiomis sąlygomis.';

  @override
  String get termsUseTitle => '1. Programos naudojimas';

  @override
  String get termsUseBody =>
      'Cortisol Zero yra asmeninė sveikatos ir produktyvumo priemonė. Galite ją naudoti savo streso valdymo ir koncentracijos tikslams. Draudžiama atlikti atvirkštinę programos inžineriją, platinti ar perparduoti programą ar jos turinį.';

  @override
  String get termsProTitle => '2. PRO prenumerata';

  @override
  String get termsProBody =>
      'PRO funkcijos atrakinamos atlikus pirkimą programoje per Google Play. Prenumeratos automatiškai atnaujinamos, nebent atšaukiamos likus ne mažiau kaip 24 valandoms iki atnaujinimo datos. Grąžinimai tvarkomi pagal Google Play grąžinimo politiką.';

  @override
  String get termsPermissionsTitle => '3. Teisės';

  @override
  String get termsPermissionsBody =>
      'Programai reikalingos tam tikros Android teisės (pritaikomumo paslauga, rodymas virš kitų programų, naudojimo statistika), kad būtų galima teikti programų blokavimo funkciją. Šios teisės naudojamos išimtinai nurodytam tikslui ir niekada naudojamos asmens duomenims rinkti.';

  @override
  String get termsDisclaimerTitle => '4. Atsakomybės apribojimas';

  @override
  String get termsDisclaimerBody =>
      'Cortisol Zero yra gerovės priemonė ir NĖRA medicininis prietaisas ar medicinos patarimas. Visada pasitarkite su sveikatos priežiūros specialistu dėl medicininių klausimų.';

  @override
  String get termsLiabilityTitle => '5. Atsakomybės ribojimas';

  @override
  String get termsLiabilityBody =>
      'Mes neatsakome už jokią žalą, atsiradusią naudojantis šia programa. Programa teikiama \"tokia, kokia yra\" be jokios garantijos.';

  @override
  String get termsChangesTitle => '6. Pakeitimai';

  @override
  String get termsChangesBody =>
      'Mes galime atnaujinti šias sąlygas. Tolesnio programos naudojimas po atnaujinimų reiškia jų priėmimą.';

  @override
  String get termsContactTitle => '7. Kontaktai';

  @override
  String get termsContactBody =>
      'Klausimais susisiekite su mumis: cartizolzero@gmail.com';

  @override
  String get testAlarmIn1Min => 'Testinis žadintuvas po 1 min.';

  @override
  String get testAlarmScheduled =>
      'Testinis žadintuvas suplanuotas po 1 minutės';

  @override
  String get blockerLockedTitle => 'Nustatymai užrakinti';

  @override
  String blockerLockedBody(String time) {
    return 'Fokuso režimas aktyvus. Nustatymus galėsite keisti po blokavimo pabaigos $time.';
  }
}
