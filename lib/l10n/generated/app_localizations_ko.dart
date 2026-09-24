// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => '코르티솔 제로';

  @override
  String get appTagline => '매일 스트레스를 줄여주는 나만의 동반자';

  @override
  String get navHome => '홈';

  @override
  String get navLearn => '학습';

  @override
  String get navBreathe => '호흡';

  @override
  String get navSounds => '소리';

  @override
  String get navMore => '더보기';

  @override
  String get greetingMorning => '좋은 아침이에요';

  @override
  String get greetingAfternoon => '좋은 오후예요';

  @override
  String get greetingEvening => '좋은 저녁이에요';

  @override
  String get greetingNight => '좋은 밤이에요';

  @override
  String get dayStreak => '일 연속';

  @override
  String get dailyTip => '오늘의 팁';

  @override
  String get quickAccess => '빠른 접근';

  @override
  String get moodCheckin => '기분 체크인';

  @override
  String get howAreYouFeeling => '오늘 기분이 어떠세요?';

  @override
  String get explore => '탐색';

  @override
  String get learnTitle => '학습';

  @override
  String get learnSubtitle => '코르티솔과 관리 방법을 알아보세요';

  @override
  String get searchTopics => '주제 검색...';

  @override
  String get seeAll => '전체 보기';

  @override
  String minuteRead(int count) {
    return '$count분 읽기';
  }

  @override
  String get noResultsFound => '검색 결과가 없어요';

  @override
  String get nutritionGuide => '영양 가이드';

  @override
  String get antiStressFoods => '항스트레스 식품';

  @override
  String get tapToLearnScience => '식품을 탭하면 코르티솔을 낮추는 과학적 원리를 알 수 있어요';

  @override
  String get servingIdea => '섭취 아이디어';

  @override
  String get breatheTitle => '호흡';

  @override
  String get breatheSubtitle => '호흡 운동으로 몇 분 안에 코르티솔을 낮추세요';

  @override
  String get scienceBackedTechniques => '과학적으로 검증된 기법';

  @override
  String get vagusNerveInfo => '각 기법은 미주신경을 활성화하여 수 분 내에 코르티솔을 낮춰줘요';

  @override
  String get beginner => '초급';

  @override
  String get intermediate => '중급';

  @override
  String get advanced => '고급';

  @override
  String get phaseInhale => '들숨';

  @override
  String get phaseHold => '멈춤';

  @override
  String get phaseExhale => '날숨';

  @override
  String get sessionComplete => '세션 완료!';

  @override
  String get sessionCompleteMessage => '코르티솔 수치가 낮아지고 있어요. 잠시 몸의 변화를 느껴보세요.';

  @override
  String get cyclesCompleted => '사이클';

  @override
  String get duration => '시간';

  @override
  String get done => '완료';

  @override
  String get endSession => '세션 종료';

  @override
  String cycleOf(int current, int total) {
    return '$current/$total 사이클';
  }

  @override
  String get soundsTitle => '소리';

  @override
  String get soundsSubtitle => '자연의 소리로 신경계를 안정시키세요';

  @override
  String nowPlaying(String name) {
    return '재생 중: $name';
  }

  @override
  String get tapToPlay => '탭하여 재생';

  @override
  String get paused => '일시정지';

  @override
  String get sleepTimer => '수면 타이머';

  @override
  String get audioWillStop => '오디오가 자동으로 종료됩니다';

  @override
  String get cancelTimer => '타이머 취소';

  @override
  String sleepTimerSet(int minutes) {
    return '수면 타이머: $minutes분';
  }

  @override
  String get journalTitle => '기분 일기';

  @override
  String get addEntry => '기록 추가';

  @override
  String get saveEntry => '기록 저장';

  @override
  String get noEntriesThisMonth => '이번 달 기록이 없어요';

  @override
  String get tapPlusToAdd => '+ 버튼을 탭해서 첫 번째 기분 기록을 추가해보세요';

  @override
  String weeklyAverage(String mood) {
    return '주간 평균: $mood';
  }

  @override
  String get addNoteOptional => '지금 기분을 메모해보세요... (선택 사항)';

  @override
  String get moodTerrible => '최악';

  @override
  String get moodBad => '나쁨';

  @override
  String get moodOkay => '보통';

  @override
  String get moodGood => '좋음';

  @override
  String get moodGreat => '최고';

  @override
  String get sleepTrackerTitle => '수면 트래커';

  @override
  String get logSleep => '수면 기록';

  @override
  String get sleepQuality => '수면 질';

  @override
  String get bedtimeReminder => '취침 알림';

  @override
  String get avgQuality => '평균 수면 질';

  @override
  String get avgDuration => '평균 수면 시간';

  @override
  String get tracked => '기록됨';

  @override
  String get bedtime => '취침 시간';

  @override
  String get wakeTime => '기상 시간';

  @override
  String get last7Days => '최근 7일';

  @override
  String get recentEntries => '최근 기록';

  @override
  String get settingsTitle => '설정';

  @override
  String get appearance => '화면 설정';

  @override
  String get themeLabel => '테마';

  @override
  String get themeSystem => '시스템';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get language => '언어';

  @override
  String get notifications => '알림';

  @override
  String get enableNotifications => '알림 활성화';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get termsOfService => '이용약관';

  @override
  String get rateApp => '앱 평가하기';

  @override
  String get version => '버전';

  @override
  String get about => '앱 정보';

  @override
  String get proTitle => 'PRO';

  @override
  String get proActive => 'PRO — 이용 중 ✓';

  @override
  String get upgradeToProCTA => 'PRO로 업그레이드';

  @override
  String get upgradeSubtitle => '완전한 스트레스 감소 도구 모음을 잠금 해제하세요';

  @override
  String get proPrice => 'USD 6.50 일회결제';

  @override
  String get oneTimePayment => '일회 결제 • 평생 이용';

  @override
  String get noSubscription => '구독 없음, 반복 청구 없음';

  @override
  String unlockPro(String price) {
    return 'PRO 잠금 해제 — $price';
  }

  @override
  String get restorePurchases => '구매 복원';

  @override
  String get proThankYou => '지원해 주셔서 감사합니다!';

  @override
  String get youHavePro => 'PRO를 이용 중이에요!';

  @override
  String get proFeaturesUnlocked => '모든 PRO 기능이 활성화되었어요.';

  @override
  String get awesome => '좋아요!';

  @override
  String get checkingPurchases => '구매 내역 확인 중...';

  @override
  String get recipeBook => '레시피 북';

  @override
  String get recipes22 => '코르티솔 감소 레시피 22가지';

  @override
  String get searchRecipes => '레시피 검색...';

  @override
  String get ingredients => '재료';

  @override
  String get instructions => '만드는 방법';

  @override
  String get whyItWorks => '효과의 원리';

  @override
  String servings(int count) {
    return '$count인분';
  }

  @override
  String prepTime(String time) {
    return '준비: $time';
  }

  @override
  String totalTime(String time) {
    return '총 시간: $time';
  }

  @override
  String get meditationLibrary => '명상 라이브러리';

  @override
  String get guidedMeditations => '스트레스 해소를 위한 가이드 명상';

  @override
  String get appBlocker => '앱 차단기';

  @override
  String get morningFocusMode => '아침 집중 모드';

  @override
  String get enableAppBlocker => '앱 차단기 활성화';

  @override
  String get blockDuration => '차단 시간';

  @override
  String get grantPermission => '권한 허용';

  @override
  String get unlockWithBreathing => '5분 호흡 운동을 완료하면 잠금이 해제돼요';

  @override
  String get moodInsights => 'AI 기분 분석';

  @override
  String get weeklyPatternAnalysis => '주간 기분 패턴 분석';

  @override
  String get stressLevel => '스트레스 수준';

  @override
  String get avgMood => '평균 기분';

  @override
  String get trend => '추세';

  @override
  String get weeklyMoodTrend => '주간 기분 추세';

  @override
  String get aiDetectedPatterns => 'AI 감지 패턴';

  @override
  String get weeklyPersonalizedTip => '주간 맞춤 팁';

  @override
  String get onboarding1Title => '코르티솔 제로에\n오신 것을 환영해요';

  @override
  String get onboarding1Subtitle => '스트레스를 관리하고 더 평온하고 건강한 삶을 만들어가는 일상 동반자예요.';

  @override
  String get onboarding2Title => '나의 스트레스를\n이해해보세요';

  @override
  String get onboarding2Subtitle =>
      '코르티솔은 스트레스 호르몬이에요. 만성적으로 높아지면 건강, 기분, 수면에 영향을 미칩니다.';

  @override
  String get onboarding3Title => '나의 여정이\n지금 시작돼요';

  @override
  String get onboarding3Subtitle =>
      '코르티솔 제로와 함께 하루 단 5분으로 몇 주 안에 스트레스 수준이 눈에 띄게 낮아질 거예요.';

  @override
  String get continueButton => '계속';

  @override
  String get getStarted => '시작하기';

  @override
  String get skip => '건너뛰기';

  @override
  String get moreTitle => '더보기';

  @override
  String get toolsSection => '도구';

  @override
  String get proFeaturesSection => 'PRO 기능';

  @override
  String get unlockCortisolZeroPro => '코르티솔 제로 PRO 잠금 해제';

  @override
  String get unlock => '잠금 해제';

  @override
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get close => '닫기';

  @override
  String get change => '변경';

  @override
  String get scienceBacked => '과학적으로 검증된 코르티솔 감소';

  @override
  String get free => '무료';

  @override
  String get whatYouGet => '제공되는 기능';

  @override
  String scheduledAt(String time) {
    return '예약됨: $time';
  }

  @override
  String get dailyTipBadge => '오늘의 팁';

  @override
  String get journalLabel => '일기';

  @override
  String get featureNutrition => '영양';

  @override
  String get featureNutritionSub => '항스트레스 식품 20가지';

  @override
  String get featureSleep => '수면';

  @override
  String get featureSleepSub => '기록 및 개선';

  @override
  String get nutritionBannerTitle => '항스트레스 영양 가이드';

  @override
  String get nutritionBannerSub => '코르티솔 감소 식품 20가지 이상';

  @override
  String minRead(int count) {
    return '$count분 읽기';
  }

  @override
  String get filterAll => '전체';

  @override
  String get filterBasics => '기초';

  @override
  String get filterScience => '과학';

  @override
  String get filterImpact => '영향';

  @override
  String get filterReduce => '감소';

  @override
  String get filterLifestyle => '라이프스타일';

  @override
  String get filterNutrition => '영양';

  @override
  String get filterSleep => '수면';

  @override
  String get filterMind => '마음';

  @override
  String get catBasics => '기초 지식';

  @override
  String get catScience => '과학적 원리';

  @override
  String get catImpact => '건강에 미치는 영향';

  @override
  String get catReduction => '감소 팁';

  @override
  String get catLifestyle => '라이프스타일';

  @override
  String get catNutrition => '영양';

  @override
  String get catSleep => '수면';

  @override
  String get catExercise => '운동';

  @override
  String get catMindfulness => '마음챙김';

  @override
  String get dailyTip0 =>
      '지금 바로 깊은 호흡을 5번 해보세요. 긴 날숨은 미주신경을 활성화하여 60초 안에 코르티솔을 낮춰줘요.';

  @override
  String get dailyTip1 =>
      '차가운 물 한 잔을 마시세요. 가벼운 탈수만으로도 코르티솔이 최대 33%까지 증가해요. 수분 보충은 스트레스 관리예요.';

  @override
  String get dailyTip2 =>
      '10분 동안 바깥에 나가보세요. 자연광과 녹음은 코르티솔을 눈에 띄게 낮춰줘요 — 짧은 산책으로도 충분해요.';

  @override
  String get dailyTip3 =>
      '30분 동안 휴대폰을 내려놓으세요. 알림이 올 때마다 코르티솔이 미세하게 급등해요. 신경계에 휴식을 주세요.';

  @override
  String get dailyTip4 => '아몬드 한 줌이나 다크 초콜릿을 드세요. 마그네슘과 플라바놀이 HPA 축을 직접 억제해줘요.';

  @override
  String get dailyTip5 => '감사한 것 3가지를 적어보세요. 단 5분의 감사 일기 쓰기가 코르티솔을 23% 낮춰줍니다.';

  @override
  String get dailyTip6 =>
      '잔잔한 음악을 들어보세요. 432Hz 공명의 음악은 코르티솔을 낮추고 심박수를 늦추는 것으로 알려져 있어요.';

  @override
  String get dailyTip7 =>
      '소중한 사람과 시간을 보내세요. 긍정적인 사회적 접촉으로 분비되는 옥시토신이 코르티솔을 직접 억제해요.';

  @override
  String get dailyTip8 =>
      '스트레스받는 일 전에 4-7-8 호흡을 해보세요. 4박자 들숨, 7박자 멈춤, 8박자 날숨. 천연 진정제예요.';

  @override
  String get dailyTip9 =>
      '기상 후 90분 이내에 아침 식사를 하세요. 아침을 거르면 혈당 유지를 위해 코르티솔이 급등해요.';

  @override
  String get dailyTip10 =>
      '잠들기 1시간 전에는 화면을 끄세요. 블루라이트는 멜라토닌을 억제하고 밤에도 코르티솔을 높게 유지시킵니다.';

  @override
  String get dailyTip11 =>
      '20분간 몸을 움직여 보세요. 적당한 운동은 \'코르티솔 배당금\'을 만들어냅니다 — 운동 후 몇 시간 동안 코르티솔이 기준치 이하로 떨어집니다.';

  @override
  String get dailyTip12 =>
      '카모마일이나 녹차 한 잔을 마셔보세요. 녹차의 L-테아닌은 차분한 집중력을 높여주고, 카모마일의 아피제닌은 GABA 수용체에 결합합니다.';

  @override
  String get dailyTip13 =>
      '점진적 근육 이완법을 실천해 보세요. 각 근육 부위를 긴장시켰다가 풀어주는 동작이 부교감신경계를 직접 활성화합니다.';

  @override
  String get eduTitle000 => '코르티솔이란?';

  @override
  String get eduTitle001 => '코르티솔의 일주기 리듬';

  @override
  String get eduTitle002 => 'HPA 축의 작동 원리';

  @override
  String get eduTitle003 => '코르티솔 vs. 아드레날린';

  @override
  String get eduTitle004 => '코르티솔 과잉이 신체에 미치는 영향';

  @override
  String get eduTitle005 => '코르티솔과 기분의 관계';

  @override
  String get eduTitle006 => '심호흡: 가장 빠른 스트레스 해소법';

  @override
  String get eduTitle007 => '자연의 힘';

  @override
  String get eduTitle008 => '운동: 타이밍이 중요합니다';

  @override
  String get eduTitle009 => '사회적 연결이 코르티솔을 낮춥니다';

  @override
  String get eduTitle010 => '수면과 코르티솔: 악순환의 고리';

  @override
  String get eduTitle011 => '요가와 스트레스 반응';

  @override
  String get eduTitle012 => '마음챙김 명상: 입증된 효과';

  @override
  String get eduTitle013 => '코르티솔을 높이는 음식';

  @override
  String get eduTitle014 => '장-뇌-코르티솔 연결고리';

  @override
  String get eduTitle015 => '마그네슘: 천연 항스트레스 미네랄';

  @override
  String get eduTitle016 => '코르티솔 치료제로서의 저널링';

  @override
  String get eduContent000 =>
      '코르티솔은 신장 위에 위치한 부신에서 분비되는 신체의 주요 스트레스 호르몬입니다. \'스트레스 호르몬\'이라고도 불리며, 싸움-도주 반응에서 핵심적인 역할을 합니다.\n\n스트레스 상황에 처하면 뇌의 시상하부가 신호 연쇄 반응을 일으켜 코르티솔이 분비됩니다. 이는 심박수, 혈압, 혈당을 높여 신체가 싸우거나 도망갈 준비를 하도록 합니다.\n\n적정량의 코르티솔은 생명 유지에 필수적입니다. 대사 조절, 염증 감소, 기억 형성을 돕습니다. 문제는 지속적인 스트레스로 코르티솔 수치가 만성적으로 높은 상태가 유지될 때 발생합니다.';

  @override
  String get eduContent001 =>
      '코르티솔은 \'일주기 코르티솔 패턴\'이라는 자연스러운 일일 리듬을 따릅니다. 오전 8시경에 최고치에 달해 기상과 각성을 돕고, 이후 점차 감소하여 자정 무렵 가장 낮아집니다.\n\n이를 코르티솔 각성 반응(CAR)이라고 합니다. 건강한 CAR은 기상 후 30분 이내에 코르티솔이 50~160% 급격히 상승합니다 — 자연의 알람 시계인 셈이죠.\n\n현대적인 생활 방식은 수면 부족, 만성 스트레스, 밤의 인공 조명, 불규칙한 식사 시간 등으로 이 리듬을 교란시킵니다. 리듬이 깨지면 아침에는 극도로 피곤하고 밤에는 오히려 각성 상태가 될 수 있습니다.';

  @override
  String get eduContent002 =>
      '시상하부-뇌하수체-부신(HPA) 축은 신체의 중추적인 스트레스 반응 시스템입니다. 작동 원리는 다음과 같습니다:\n\n1. **시상하부**가 스트레스를 감지하여 CRH(부신피질자극호르몬 방출호르몬)를 분비\n2. **뇌하수체**가 CRH를 받아 ACTH(부신피질자극호르몬)를 분비\n3. **부신**이 ACTH를 받아 코르티솔을 생성\n4. **음성 피드백 루프**: 코르티솔이 충분히 높아지면 시상하부에 신호를 보내 생산을 줄임\n\n만성 스트레스는 이 피드백 루프를 교란시켜 신체가 더 이상 코르티솔을 적절히 억제할 수 없는 지속적인 고코르티솔 상태로 이어질 수 있습니다.';

  @override
  String get eduContent003 =>
      '많은 사람들이 코르티솔과 아드레날린(에피네프린)을 혼동합니다. 둘 다 스트레스 호르몬이지만 작동 방식이 다릅니다:\n\n**아드레날린**은 빠릅니다 — 급성 스트레스 시 몇 초 안에 작동하여 심박수를 높이고 손에 땀이 나게 합니다. 효과는 빠르게 사라집니다.\n\n**코르티솔**은 느립니다 — 동원되는 데 수 분이 걸리지만 효과는 몇 시간 또는 며칠 동안 지속됩니다. 갑작스러운 위협이 아닌 지속적인 위험에 대응하도록 설계되었습니다.\n\n현대의 문제는 심리적 스트레스 요인(마감, 교통, 소셜 미디어)이 마치 항상 포식자를 마주하는 것처럼 코르티솔 경로를 지속적으로 활성화한다는 점입니다.';

  @override
  String get eduContent004 =>
      '만성적으로 높은 코르티솔은 광범위한 영향을 미칩니다:\n\n🩺 **면역계**: 면역 반응을 억제하여 질병에 취약하게 만듦\n⚖️ **체중**: 특히 복부 내장 지방 축적 촉진\n💤 **수면**: 수면 주기를 방해하여 불면증 유발\n🧠 **뇌**: 기억력과 집중력 저하; 시간이 지나면 해마를 축소시킬 수 있음\n❤️ **심장**: 혈압을 높이고 심혈관 위험 증가\n🦴 **뼈**: 골밀도 감소\n🩸 **혈당**: 인슐린 저항성 유발\n\n희소식이 있습니다. 이러한 영향은 적절한 스트레스 관리를 통해 대부분 회복 가능합니다.';

  @override
  String get eduContent005 =>
      '코르티솔과 정신 건강의 연관성은 매우 깊습니다. 높은 코르티솔은 다음과 관련이 있습니다:\n\n**불안**: 코르티솔은 편도체의 위협 감지를 증폭시켜 모든 것이 더 위험하게 느껴지게 합니다.\n\n**우울증**: 만성적으로 높은 코르티솔은 \'행복 신경전달물질\'인 세로토닌과 도파민을 감소시킵니다.\n\n**브레인 포그**: 코르티솔이 전전두엽의 포도당을 빼앗아 명확한 사고, 의사결정, 집중력을 방해합니다.\n\n**감정 과잉 반응**: 사소한 짜증에도 더 쉽게 폭발하게 됩니다.\n\n흥미롭게도 코르티솔이 매우 낮은 경우(부신 피로)도 우울증과 극심한 피로를 유발할 수 있습니다 — 균형이 중요합니다.';

  @override
  String get eduContent006 =>
      '심복식 호흡(횡격막 호흡)은 코르티솔을 낮추는 가장 강력하고 즉각적인 방법 중 하나입니다. 과학적 원리는 다음과 같습니다:\n\n천천히 깊게 호흡하면 부교감신경계 — \'휴식과 소화\' 반응 — 가 활성화되어 스트레스 반응에 직접적으로 대항합니다.\n\n뇌에서 장까지 연결된 미주신경이 심호흡으로 자극을 받습니다. 이는 온몸에 \'안전\' 신호를 보내 수 분 내에 코르티솔 수치를 낮춥니다.\n\n**4-7-8 기법**: 4초 들이쉬기, 7초 멈추기, 8초 내쉬기. 긴 날숨이 핵심입니다 — 스트레스 반응에 미주신경 브레이크를 걸어줍니다.';

  @override
  String get eduContent007 =>
      '자연 속에서 시간을 보내면 코르티솔이 낮아진다는 것이 과학적으로 입증되었습니다. \'신린요쿠(森林浴, 삼림욕)\'라는 일본의 실천법이 광범위하게 연구되었습니다:\n\n🌿 숲속에서 단 20분만 있어도 코르티솔이 15.8% 감소\n🌳 녹지 공간은 타액 코르티솔과 심박수를 모두 낮춤\n🌊 블루 스페이스(수변 환경)도 유사한 효과를 보임\n🌸 자연 이미지를 보는 것만으로도 스트레스 지표가 감소\n\n숲이 필요하지 않습니다. 동네 공원에서 10분 산책, 화분 가꾸기, 혹은 정원이 보이는 창가에 앉는 것만으로도 HPA 축에 자연의 진정 효과가 나타납니다.';

  @override
  String get eduContent008 =>
      '운동은 코르티솔과의 관계에서 양날의 검입니다. 이를 이해하면 운동을 최적화할 수 있습니다:\n\n**운동 중**: 에너지를 동원하기 위해 코르티솔이 상승합니다 — 이는 건강하고 정상적인 반응입니다.\n\n**적당한 운동 후**: 코르티솔이 기준치 이하로 떨어져 \'코르티솔 배당금\'을 제공합니다.\n\n**과훈련**: 지나친 고강도 운동은 코르티솔을 만성적으로 높게 유지시킵니다. 많다고 반드시 좋은 것은 아닙니다.\n\n**코르티솔 균형을 위한 최선의 방법**:\n• 아침 중강도 유산소 운동(30~45분)이 최적\n• 밤 늦은 고강도 훈련은 피할 것\n• 휴식일 포함 — 적응은 쉬는 동안 일어납니다\n• 요가와 태극권이 코르티솔 감소에 특히 효과적';

  @override
  String get eduContent009 =>
      '인간적 유대감은 코르티솔을 완충하는 강력한 요소입니다. 연구에 따르면:\n\n• **옥시토신**(유대 호르몬)이 코르티솔 분비를 직접적으로 억제\n• 강한 사회적 지지를 가진 사람들은 스트레스에 대한 코르티솔 반응이 25% 낮음\n• 짧고 긍정적인 사회적 교류만으로도 코르티솔이 감소\n• 반려동물을 키우면 코르티솔이 크게 낮아짐 — 개를 10분 쓰다듬는 것만으로도 측정 가능한 수준으로 감소\n• 반대로 외로움은 코르티솔을 높입니다 — 생존 위협으로 인식되기 때문\n\n이것이 고립이 신체적으로 해로운 이유입니다. 우리 몸은 스트레스 반응을 조절하기 위해 사회적 접촉을 진정으로 필요로 합니다.';

  @override
  String get eduContent010 =>
      '높은 코르티솔과 수면 부족은 위험한 악순환을 형성합니다:\n\n**높은 코르티솔 → 수면 부족**: 코르티솔은 각성 효과가 있습니다. 밤에 코르티솔이 높으면 뇌가 깊고 회복적인 수면 단계에 도달하지 못합니다.\n\n**수면 부족 → 높은 코르티솔**: 단 하룻밤의 수면 부족만으로도 다음 날 코르티솔이 37% 상승합니다.\n\n**악순환 끊기**:\n✓ 주말에도 일정한 취침/기상 시간 유지\n✓ 잠들기 1시간 전 스크린 피하기 — 블루라이트는 멜라토닌을 억제\n✓ 침실을 서늘하게 유지 (최적 온도: 18~20°C)\n✓ 오후 2시 이후 카페인 섭취 금지\n✓ 취침 전 루틴 실천 (독서, 가벼운 스트레칭, 호흡법)';

  @override
  String get eduContent011 =>
      '요가는 코르티솔 감소를 위한 가장 많이 연구된 중재법 중 하나입니다:\n\n**연구에 따르면** 8주간 규칙적인 요가 실천으로 아침 코르티솔이 최대 30%까지 감소합니다.\n\n**요가가 효과적인 이유**:\n• 호흡, 움직임, 마음챙김을 결합 — 3중 코르티솔 감소 효과\n• 의식적인 호흡을 통해 부교감신경계 활성화\n• 편도체 반응성 감소 (자극에 덜 예민해짐)\n• GABA 수치 향상 — 뇌의 진정 신경전달물질\n\n**코르티솔에 최적인 요가 스타일**: 하타, 인(Yin), 회복 요가, 요가 니드라(요가 수면)가 특히 효과적입니다. 잠들기 전 10분간의 부드러운 요가만으로도 수면의 질을 크게 개선할 수 있습니다.';

  @override
  String get eduContent012 =>
      '마음챙김 기반 스트레스 감소(MBSR)는 1970년대부터 엄격히 연구되어 왔습니다. 그 결과는 놀랍습니다:\n\n🧪 **8주**간의 MBSR로 코르티솔이 20~25% 감소\n🧠 **뇌 구조 변화**: 전전두엽(이성적 사고)을 성장시키고 편도체(공포 중추)를 축소\n💊 **약물과 동등한 효과**: 여러 임상시험에서 경증~중등도 불안에 약물에 버금가는 효과 입증\n❤️ **염증 지표 감소**: 코르티솔과 연관된 CRP, IL-6 감소\n\n오랜 시간이 필요하지 않습니다. 연구에 따르면 **하루 10분**의 집중적인 마음챙김 실천만으로도 4주 내에 측정 가능한 코르티솔 감소 효과가 나타납니다.';

  @override
  String get eduContent013 =>
      '식단은 코르티솔에 직접적인 영향을 미칩니다. 다음 음식들은 스트레스 호르몬을 급격히 높일 수 있습니다:\n\n☕ **카페인**: 커피에 익숙한 사람에게도 코르티솔을 30% 높입니다. 디카페인으로 완전히 해결되지는 않습니다 — 기상 후 90분이 지난 뒤 첫 잔을 마시세요.\n\n🍬 **혈당 급등**: 급격한 혈당 변동은 코르티솔 분비를 자극합니다. 저혈당 지수 식품을 선택하세요.\n\n🥃 **알코올**: 처음에는 진정 효과가 있지만 수면 구조를 방해하고 다음 날 코르티솔을 높입니다.\n\n🔥 **염증 유발 음식**: 트랜스 지방, 가공 식물성 기름, 초가공 식품은 코르티솔을 높이는 전신 염증을 증가시킵니다.\n\n🧂 **과도한 나트륨**: 고나트륨 식단은 여러 연구에서 코르티솔 수치 상승과 연관이 있습니다.';

  @override
  String get eduContent014 =>
      '장내 마이크로바이옴은 장-뇌 축을 통해 스트레스 반응과 직접 연결됩니다:\n\n🦠 **장내 세균이 신경전달물질을 생산**: 세로토닌의 90%가 장에서 만들어집니다. 장내 균형이 무너지면 세로토닌이 줄고 스트레스 취약성이 높아집니다.\n\n🔗 **미주신경**이 장과 뇌를 연결합니다 — 장의 염증이 HPA 축을 직접 활성화합니다.\n\n🥛 **프로바이오틱스가 코르티솔을 낮춥니다**: 연구에 따르면 락토바실러스 람노서스 보충이 불안과 스트레스 코르티솔 반응을 줄입니다.\n\n**건강한 장내 마이크로바이옴을 위한 음식**:\n• 발효 식품 (케피어, 요거트, 김치, 사우어크라우트)\n• 프리바이오틱 섬유 (마늘, 양파, 귀리, 바나나)\n• 폴리페놀이 풍부한 음식 (베리류, 다크 초콜릿, 녹차)';

  @override
  String get eduContent015 =>
      '마그네슘은 흔히 \'천연 신경 안정제\'라고 불립니다 — 그럴 만한 이유가 있습니다:\n\n**코르티솔과의 연결**: 마그네슘은 HPA 축을 조절합니다. 결핍 시 코르티솔이 통제 없이 증가하고, 충분한 마그네슘은 과도한 코르티솔 분비에 브레이크를 걸어줍니다.\n\n**결핍의 만연**: 미국인의 최대 68%가 마그네슘 결핍 상태입니다. 만성 스트레스 자체가 마그네슘을 고갈시켜 악순환이 됩니다.\n\n**결핍 증상**: 불안, 근육 긴장, 수면 장애, 과민성, 두통, 당분 갈망.\n\n**주요 식품 공급원**: 짙은 녹색 채소(시금치, 케일), 호박씨, 아몬드, 아보카도, 다크 초콜릿, 콩류, 통곡물.\n\n**보충제**: 마그네슘 글리시네이트와 마그네슘 트레오네이트는 흡수율이 높고 뇌에 잘 침투합니다.';

  @override
  String get eduContent016 =>
      '감정에 대해 글을 쓰는 것이 코르티솔을 낮춘다는 것이 임상적으로 입증되었습니다:\n\n📝 **표현적 글쓰기**(스트레스 경험에 대해 쓰기)는 이후 스트레스 요인에 대한 코르티솔 반응을 줄입니다.\n\n🧠 **작동 원리**: 글쓰기는 전전두엽(이성적 뇌)을 활성화하여 편도체(감정 뇌)를 조절할 수 있게 합니다 — 코르티솔 분비를 줄여줍니다.\n\n💙 **감사 일기**는 특히 효과적입니다: 짧은 일일 감사 쓰기만으로도 코르티솔이 23% 감소합니다 (UC 데이비스 연구).\n\n**시작 방법**: 주 3회, 15분씩. 수정하지 말고 그냥 쓰세요. 어떤 일이 있었는지, 그것에 대해 어떻게 느꼈는지에 집중하세요.\n\n이 앱의 저널 기능은 바로 이 목적을 위해 설계되었습니다 — 매일의 기록이 쌓여 강력한 자기 인식 훈련이 됩니다.';

  @override
  String get nutFilterAll => '전체';

  @override
  String get nutFilterFruits => '과일';

  @override
  String get nutFilterVegetables => '채소';

  @override
  String get nutFilterProteins => '단백질';

  @override
  String get nutFilterBeverages => '음료';

  @override
  String get nutFilterNutsSeeds => '견과류 & 씨앗';

  @override
  String get nutFilterGrains => '곡물';

  @override
  String get nutFilterDairy => '유제품';

  @override
  String get nutFilterSpices => '향신료';

  @override
  String get nutCatFruits => '과일';

  @override
  String get nutCatVegetables => '채소';

  @override
  String get nutCatProteins => '단백질';

  @override
  String get nutCatBeverages => '음료';

  @override
  String get nutCatNutsSeeds => '견과류 & 씨앗';

  @override
  String get nutCatGrains => '곡물';

  @override
  String get nutCatDairy => '유제품';

  @override
  String get nutCatSpices => '향신료';

  @override
  String get foodName000 => '블루베리';

  @override
  String get foodBenefit000 => '강력한 항산화 성분이 산화 스트레스를 줄여줍니다';

  @override
  String get foodMechanism000 =>
      '혈뇌 장벽을 통과하는 안토시아닌이 풍부하여 신경 염증과 코르티솔로 인한 산화 손상을 줄입니다. 연구에 따르면 블루베리 추출물이 급성 스트레스 후 코르티솔 반응을 낮추는 것으로 나타났습니다.';

  @override
  String get foodServing000 => '오버나이트 오트에 한 줌 넣거나 스무디에 넣어 갈아보세요';

  @override
  String get foodNutrients000 => '비타민 C, 안토시아닌, 식이섬유, 비타민 K';

  @override
  String get foodName001 => '바나나';

  @override
  String get foodBenefit001 => '칼륨이 혈압을 낮추고, 트립토판이 세로토닌을 높여줍니다';

  @override
  String get foodMechanism001 =>
      '바나나에는 세로토닌의 전구체인 트립토판이 함유되어 있어 코르티솔을 조절하는 진정 신경전달물질을 생성합니다. 칼륨은 코르티솔의 혈압 상승 효과를 상쇄합니다. 천연 당분은 코르티솔 급등 없이 빠른 에너지를 제공합니다.';

  @override
  String get foodServing001 => '아몬드 버터 토스트 위에 슬라이스해서 올리면 완벽한 스트레스 해소 간식이 됩니다';

  @override
  String get foodNutrients001 => '칼륨, 트립토판, 비타민 B6, 마그네슘';

  @override
  String get foodName002 => '오렌지';

  @override
  String get foodBenefit002 => '고함량 비타민 C가 코르티솔을 직접 낮춥니다';

  @override
  String get foodMechanism002 =>
      '코르티솔 생성 중 부신에서 비타민 C가 빠르게 소모됩니다. 비타민 C를 보충하면 심리적 스트레스 요인에 대한 코르티솔 반응이 줄어듭니다. 2001년 독일 연구에서 비타민 C 1000mg이 공개 발표 테스트 중 코르티솔과 혈압을 낮추는 것으로 나타났습니다.';

  @override
  String get foodServing002 =>
      '식이섬유를 위해 주스가 아닌 통과일로 드세요. 스트레스가 예상되는 상황 전에 섭취하면 효과적입니다';

  @override
  String get foodNutrients002 => '비타민 C, 엽산, 칼륨, 플라보노이드';

  @override
  String get foodName003 => '아보카도';

  @override
  String get foodBenefit003 => '건강한 지방이 스트레스 염증을 줄입니다';

  @override
  String get foodMechanism003 =>
      '아보카도에는 부신 건강을 지원하고 HPA 축 활성화와 연관된 염증성 사이토카인을 줄이는 단불포화 지방이 풍부합니다. 비타민 B(B5, B6)는 부신 호르몬 생성을 지원합니다. 마그네슘은 HPA 축을 직접 조절합니다.';

  @override
  String get foodServing003 => '연어나 달걀 위에 슬라이스해서 올리거나 스무디에 넣어 크리미한 질감을 더해보세요';

  @override
  String get foodNutrients003 => '마그네슘, 비타민 B5(판토텐산), 비타민 B6, 단불포화 지방, 칼륨';

  @override
  String get foodName004 => '시금치';

  @override
  String get foodBenefit004 => '마그네슘이 풍부한 천연 신경 안정제';

  @override
  String get foodMechanism004 =>
      '시금치는 HPA 축을 조절하고 과도한 코르티솔 분비를 억제하는 마그네슘의 가장 풍부한 식품 공급원 중 하나입니다. 마그네슘 결핍은 코르티솔 상승과 직접 연관됩니다. 시금치의 엽산도 뇌의 진정 신경전달물질인 GABA 생성을 지원합니다.';

  @override
  String get foodServing004 =>
      '마늘과 함께 볶아 사이드 메뉴로 곁들이거나 아침 스무디에 생으로 갈아 넣어보세요 (맛이 거의 느껴지지 않습니다)';

  @override
  String get foodNutrients004 => '마그네슘, 엽산, 철분, 비타민 K, 비타민 C';

  @override
  String get foodName005 => '고구마';

  @override
  String get foodBenefit005 => '지속적인 에너지 공급으로 혈당 급락에 의한 코르티솔 급등을 방지합니다';

  @override
  String get foodMechanism005 =>
      '고구마는 혈당 급락을 방지하는 천천히 흡수되는 복합 탄수화물을 제공합니다. 혈당 급락은 코르티솔 분비를 유발합니다. 자주색 고구마는 안토시아닌 함량이 특히 높습니다. 칼륨이 풍부하여 코르티솔의 혈압 상승 효과를 상쇄합니다.';

  @override
  String get foodServing005 => '올리브 오일과 계피를 뿌려 구워 먹거나 으깨어 부처 보울의 베이스로 활용해보세요';

  @override
  String get foodNutrients005 => '칼륨, 비타민 A, 식이섬유, 비타민 C, 망간';

  @override
  String get foodName006 => '브로콜리';

  @override
  String get foodBenefit006 => '설포라판이 스트레스로 인한 뇌 손상을 보호합니다';

  @override
  String get foodMechanism006 =>
      '브로콜리의 설포라판은 신체의 마스터 항산화 스위치인 Nrf2를 활성화하여 코르티솔로 인한 산화 스트레스로부터 뉴런을 보호합니다. 브로콜리는 코르티솔 직접 조절에 기여하는 비타민 C, 마그네슘, 엽산도 풍부합니다.';

  @override
  String get foodServing006 => '설포라판을 보존하기 위해 살짝 쪄서 레몬과 올리브 오일을 뿌려 드세요';

  @override
  String get foodNutrients006 => '설포라판, 비타민 C, 엽산, 칼슘, 식이섬유';

  @override
  String get foodName007 => '연어';

  @override
  String get foodBenefit007 => '오메가-3 지방이 코르티솔 생성을 직접 억제합니다';

  @override
  String get foodMechanism007 =>
      '연어의 EPA와 DHA(오메가-3 지방산)는 두 가지 방식으로 코르티솔을 줄입니다: 시상하부의 CRH 분비를 감소시키고 스트레스 반응을 증폭시키는 신경 염증을 줄입니다. 연구에 따르면 규칙적인 오메가-3 섭취는 코르티솔 반응성을 최대 22%까지 감소시킵니다.';

  @override
  String get foodServing007 => '레몬과 허브로 양념하여 주 2~3회 구워 먹고, 잎채소와 아보카도와 함께 드세요';

  @override
  String get foodNutrients007 => 'EPA/DHA 오메가-3, 비타민 D, 비타민 B12, 셀레늄, 단백질';

  @override
  String get foodName008 => '칠면조';

  @override
  String get foodBenefit008 => '트립토판이 세로토닌을 높여 스트레스를 완충합니다';

  @override
  String get foodMechanism008 =>
      '칠면조는 트립토판이 특히 풍부하며, 신체는 이를 세로토닌과 멜라토닌으로 전환합니다. 세로토닌은 코르티솔 분비를 조절하고 감정 조절을 촉진합니다. 칠면조의 비타민 B군도 부신 기능을 지원합니다.';

  @override
  String get foodServing008 =>
      '아보카도와 시금치를 넣은 랩에 슬라이스해서 넣거나 샐러드에 담백한 단백질로 추가해보세요';

  @override
  String get foodNutrients008 => '트립토판, 비타민 B3(나이아신), 비타민 B6, 셀레늄, 아연';

  @override
  String get foodName009 => '달걀';

  @override
  String get foodBenefit009 => '콜린이 풍부한 완전 단백질이 뇌의 스트레스 반응을 지원합니다';

  @override
  String get foodMechanism009 =>
      '달걀에는 부교감(휴식) 신경계를 조절하는 신경전달물질인 아세틸콜린 생성에 필수적인 콜린이 함유되어 있습니다. 달걀 노른자의 포스파티딜세린은 운동 후 코르티솔 반응을 최대 30%까지 줄이는 것으로 나타났습니다.';

  @override
  String get foodServing009 => '시금치와 강황을 넣어 스크램블로 드시거나 삶아서 간편한 간식으로 챙겨보세요';

  @override
  String get foodNutrients009 => '콜린, 포스파티딜세린, 비타민 B12, 비타민 D, 트립토판';

  @override
  String get foodName010 => '녹차';

  @override
  String get foodBenefit010 => 'L-테아닌이 코르티솔 급등 없이 차분한 집중력을 높여줍니다';

  @override
  String get foodMechanism010 =>
      '찻잎 고유의 성분인 L-테아닌은 알파 뇌파(편안한 집중 상태와 관련)를 증가시키고 GABA 생성을 촉진합니다. 카페인의 코르티솔 상승 효과를 상쇄하여 정신적 명료함을 유지하면서 스트레스 반응을 줄입니다.';

  @override
  String get foodServing010 =>
      '하루 2~3잔 드세요. L-테아닌을 보존하기 위해 끓는 물이 아닌 80°C에서 우려내세요';

  @override
  String get foodNutrients010 => 'L-테아닌, EGCG(카테킨), 카페인(저함량), 항산화 성분';

  @override
  String get foodName011 => '캐모마일 차';

  @override
  String get foodBenefit011 => '아피제닌이 GABA 수용체에 결합하여 불안을 완화합니다';

  @override
  String get foodMechanism011 =>
      '캐모마일에는 뇌의 GABA 수용체에 결합하는 플라보노이드인 아피제닌이 함유되어 있습니다 — 항불안 약물과 동일한 수용체에 작용하지만 온화하고 자연적인 방식으로 작용합니다. 꾸준히 마시면 코르티솔 수치가 감소하고 수면의 질이 개선됩니다.';

  @override
  String get foodServing011 => '취침 전 취침 전 루틴의 일환으로 1~2잔 마시세요';

  @override
  String get foodNutrients011 => '아피제닌, 비사보롤, 카마줄렌, 항산화 성분';

  @override
  String get foodName012 => '아몬드';

  @override
  String get foodBenefit012 => '마그네슘 + 비타민 E가 스트레스 손상을 방어합니다';

  @override
  String get foodMechanism012 =>
      '아몬드 28g에 하루 마그네슘 권장량의 20%가 들어 있어 HPA 축 과잉 활성을 직접 억제합니다. 비타민 E는 만성 코르티솔 생성으로 인한 자유 라디칼 손상으로부터 부신 세포를 보호하는 항산화 성분입니다.';

  @override
  String get foodServing012 => '오전 간식으로 한 줌(아몬드 23개)씩 드시거나 오트밀에 넣어보세요';

  @override
  String get foodNutrients012 => '마그네슘, 비타민 E, 단불포화 지방, 단백질, 식이섬유';

  @override
  String get foodName013 => '호박씨';

  @override
  String get foodBenefit013 => '코르티솔 과잉과 연관된 아연 결핍 — 호박씨가 가장 풍부한 공급원입니다';

  @override
  String get foodMechanism013 =>
      '아연은 코르티솔 생성을 종료하는 음성 피드백 루프의 핵심 조효소입니다. 아연 결핍은 코르티솔을 만성적으로 높게 유지시킵니다. 호박씨는 식물성 아연의 가장 풍부한 공급원이며, 트립토판과 마그네슘도 함유합니다.';

  @override
  String get foodServing013 => '볶아서 샐러드, 수프, 트레일 믹스에 넣거나 오트밀에 섞어 드세요';

  @override
  String get foodNutrients013 => '아연, 트립토판, 마그네슘, 인, 망간';

  @override
  String get foodName014 => '귀리';

  @override
  String get foodBenefit014 => '복합 탄수화물이 혈당을 안정시키고 세로토닌을 높입니다';

  @override
  String get foodMechanism014 =>
      '귀리는 세로토닌 생성을 촉진하는 복합 탄수화물을 제공합니다(탄수화물이 뇌에서 트립토판 흡수를 증가시킵니다). 베타글루칸 섬유는 코르티솔 조절을 위한 장-뇌 축을 지원하는 건강한 장내 마이크로바이옴을 촉진합니다. 코르티솔을 유발하는 혈당 급락을 방지합니다.';

  @override
  String get foodServing014 => '전날 밤에 블루베리, 호두, 꿀을 넣은 오버나이트 오트를 준비해두세요';

  @override
  String get foodNutrients014 => '베타글루칸, 비타민 B1(티아민), 마그네슘, 아연, 식이섬유';

  @override
  String get foodName015 => '퀴노아';

  @override
  String get foodBenefit015 => '신경전달물질 생성에 필요한 모든 필수 아미노산이 함유된 완전 단백질';

  @override
  String get foodMechanism015 =>
      '퀴노아는 세로토닌과 도파민의 전구체인 트립토판과 티로신을 포함한 9가지 필수 아미노산이 모두 들어있는 완전 단백질입니다. 낮은 혈당 지수로 코르티솔 분비를 유발하는 혈당 변동을 방지합니다.';

  @override
  String get foodServing015 => '부처 보울이나 지중해식 샐러드의 베이스로 활용해보세요';

  @override
  String get foodNutrients015 => '완전 단백질, 마그네슘, 철분, 식이섬유, 리보플라빈';

  @override
  String get foodName016 => '그릭 요거트';

  @override
  String get foodBenefit016 => '프로바이오틱스가 장-뇌 축을 지원하여 코르티솔을 조절합니다';

  @override
  String get foodMechanism016 =>
      '그릭 요거트에는 장에서 GABA를 직접 생성하는 락토바실러스와 비피도박테리움 균주가 풍부합니다. 연구에 따르면 프로바이오틱스 보충이 임상 연구에서 코르티솔과 불안을 줄이는 것으로 나타났습니다. 높은 단백질 함량은 포만감과 안정적인 혈당을 지원합니다.';

  @override
  String get foodServing016 => '블루베리와 호박씨를 얹어 완벽한 스트레스 해소 아침 식사로 즐겨보세요';

  @override
  String get foodNutrients016 => '프로바이오틱스, 단백질, 칼슘, 비타민 B12, 트립토판';

  @override
  String get foodName017 => '케피어';

  @override
  String get foodBenefit017 => '가장 프로바이오틱스가 풍부한 식품 — 장 축을 통해 코르티솔을 직접 낮춥니다';

  @override
  String get foodMechanism017 =>
      '케피어에는 요거트보다 훨씬 많은 최대 61종의 유익한 세균이 함유되어 있습니다. 연구에 따르면 케피어 섭취가 장내 마이크로바이옴-뇌 연결을 조절하여 코르티솔을 줄이는 것으로 나타났습니다. 트립토판 함량도 세로토닌을 높입니다.';

  @override
  String get foodServing017 =>
      '그냥 마시거나 스무디에 넣어 갈아드세요. 스무디 보울의 베이스로도 활용할 수 있습니다';

  @override
  String get foodNutrients017 => '프로바이오틱스(61종), 트립토판, 칼슘, 비타민 B12, 비타민 K2';

  @override
  String get foodName018 => '강황';

  @override
  String get foodBenefit018 => '여러 임상시험에서 커큐민이 항우울제에 버금가는 효과를 보입니다';

  @override
  String get foodMechanism018 =>
      '강황의 커큐민은 HPA 축을 활성화하는 염증성 사이토카인(IL-6, TNF-알파)을 억제합니다. 또한 코르티솔로 인한 뉴런 손상을 보호하는 BDNF(뇌유래신경영양인자)를 높입니다. 여러 임상시험에서 커큐민이 일부 의약품만큼 효과적으로 코르티솔과 우울증을 줄이는 것으로 나타났습니다.';

  @override
  String get foodServing018 => '취침 전 골든 밀크: 따뜻한 우유 + 강황 + 후추 + 꿀';

  @override
  String get foodNutrients018 => '커큐민, 철분, 망간, 항염 성분';

  @override
  String get foodName019 => '다크 초콜릿 (70% 이상)';

  @override
  String get foodBenefit019 => '임상시험에서 입증된 코르티솔과 아드레날린 직접 감소 효과';

  @override
  String get foodMechanism019 =>
      '2009년 주요 연구에 따르면 2주간 하루 40g의 다크 초콜릿을 섭취하면 코르티솔과 카테콜아민이 유의미하게 감소했습니다. 마그네슘은 HPA 축을 조절하고, 플라바놀은 BDNF를 높이며 스트레스로 인한 신경 손상을 보호합니다. 테오브로민은 차분한 에너지를 제공합니다.';

  @override
  String get foodServing019 => '점심 후 1~2조각(40g)씩 드세요. 카카오 함량 70% 이상을 선택하세요';

  @override
  String get foodNutrients019 => '마그네슘, 플라바놀, 테오브로민, 철분, 아연';

  @override
  String get breathTechBelly => '복식 호흡';

  @override
  String get breathTechBox => '박스 호흡';

  @override
  String get breathTech478 => '4-7-8 호흡';

  @override
  String get breathDescBelly =>
      '모든 호흡법의 기본입니다. 횡격막 호흡이라고도 하며, 부교감신경계를 즉시 활성화합니다. 처음 시작하는 분이나 빠른 스트레스 해소가 필요한 분에게 완벽한 방법입니다.';

  @override
  String get breathDescBox =>
      '극한의 압박 속에서 침착함을 유지하기 위해 네이비 씰과 엘리트 운동선수들이 사용하는 기법입니다. 동일한 시간 단위의 4단계가 \'박스\' 패턴을 만들어 신경계를 빠르게 리셋합니다. 집중력 향상과 발표 전 불안 해소에 탁월합니다.';

  @override
  String get breathDesc478 =>
      '요가의 프라나야마 전통에 기반하여 앤드류 웨일 박사가 개발했습니다. 긴 날숨(8박자)이 스트레스 반응에 미주신경 브레이크를 걸어줍니다. 웨일 박사는 이를 \'신경계의 천연 신경 안정제\'라고 부릅니다.';

  @override
  String get breathInstrBellyInhale => '코로 천천히 숨을 들이쉬며 배를 부풀려 주세요';

  @override
  String get breathInstrBellyExhale => '입으로 천천히 숨을 내쉬며 배를 비워주세요';

  @override
  String get breathInstrBoxInhale => '코로 천천히 숨을 들이쉬며 4까지 세어보세요';

  @override
  String get breathInstrBoxHoldFull => '부드럽게 멈추세요 — 폐 가득, 몸은 편안하게';

  @override
  String get breathInstrBoxExhale => '입으로 완전히 숨을 내쉬며 4까지 세어보세요';

  @override
  String get breathInstrBoxHoldEmpty => '부드럽게 멈추세요 — 폐를 비운 채, 몸은 편안하게';

  @override
  String get breathInstr478Inhale => '코로 조용히 4박자 동안 숨을 들이쉬세요';

  @override
  String get breathInstr478Hold => '7박자 동안 완전히 숨을 멈추세요';

  @override
  String get breathInstr478Exhale => '입으로 \'후\' 소리를 내며 8박자 동안 완전히 숨을 내쉬세요';

  @override
  String get breathBenefitBelly1 => '부교감신경계를 활성화합니다';

  @override
  String get breathBenefitBelly2 => '수분 내에 코르티솔을 낮춥니다';

  @override
  String get breathBenefitBelly3 => '심박수와 혈압을 낮춥니다';

  @override
  String get breathBenefitBelly4 => '산소 교환을 개선합니다';

  @override
  String get breathBenefitBox1 => '스트레스와 불안을 빠르게 줄여줍니다';

  @override
  String get breathBenefitBox2 => '집중력과 주의력을 향상시킵니다';

  @override
  String get breathBenefitBox3 => '네이비 씰과 엘리트 선수들이 활용합니다';

  @override
  String get breathBenefitBox4 => '이산화탄소와 산소 균형을 맞춥니다';

  @override
  String get breathBenefitBox5 => '코르티솔 반응을 줄여줍니다';

  @override
  String get breathBenefit4781 => '천연 신경 안정 효과';

  @override
  String get breathBenefit4782 => '수분 내에 급성 불안을 완화합니다';

  @override
  String get breathBenefit4783 => '미주신경을 활성화합니다';

  @override
  String get breathBenefit4784 => '불면증에 도움이 됩니다 — 취침 전에 실천하세요';

  @override
  String get breathBenefit4785 => '스트레스로 인한 식욕 충동을 조절합니다';

  @override
  String get breathBenefit4786 => '고대 요가 프라나야마에 기반합니다';

  @override
  String get durationMin => '분';

  @override
  String get durationSec => '초';

  @override
  String get appBlockerSubtitle => '아침 루틴 중 스트레스를 유발하는 앱을 차단하세요';

  @override
  String get compEducation => '교육 모듈';

  @override
  String get compBreathing => '호흡 운동 (3)';

  @override
  String get compSoundscapes => '사운드스케이프 (5)';

  @override
  String get compNutrition => '영양 가이드';

  @override
  String get compJournal => '기분 일기';

  @override
  String get compSleep => '수면 추적기';

  @override
  String get compMeditation => '명상 라이브러리';

  @override
  String get compRecipes => '레시피북 (22개 레시피)';

  @override
  String get compAppBlocker => '앱 차단 / 집중 모드';

  @override
  String get compAiInsights => 'AI 기분 인사이트';

  @override
  String get compWeeklyAnalysis => '주간 패턴 분석';

  @override
  String get blockerHeroText =>
      '기상 후 첫 2시간은 코르티솔 수치가 가장 높습니다. 이 시간 동안 스트레스를 유발하는 앱(SNS, 뉴스)을 피하면 하루가 크게 개선됩니다.';

  @override
  String blockerActiveStatus(Object hours) {
    return '활성 — 기상 후 $hours시간';
  }

  @override
  String get blockerInactive => '비활성';

  @override
  String blockerDurationLabel(Object hours) {
    return '차단 시간: $hours시간';
  }

  @override
  String get thisWeek => '이번 주';

  @override
  String get sevenDayAverage => '7일 평균';

  @override
  String get vsLastWeek => '지난 주 대비';

  @override
  String get stressLow => '낮음';

  @override
  String get stressModerate => '보통';

  @override
  String get stressHigh => '높음';

  @override
  String get dayMon => '월';

  @override
  String get dayTue => '화';

  @override
  String get dayWed => '수';

  @override
  String get dayThu => '목';

  @override
  String get dayFri => '금';

  @override
  String get daySat => '토';

  @override
  String get daySun => '일';

  @override
  String get moodPattern1obs => '수요일에 기분이 떨어지는 경향이 있습니다';

  @override
  String get moodPattern1tip => '수요일 아침에 5분간 호흡 세션을 예약하여 주중 스트레스 피크를 예방해 보세요.';

  @override
  String get moodPattern2obs => '금요일과 주말에 기분이 일관되게 좋아집니다';

  @override
  String get moodPattern2tip =>
      '이는 업무 스트레스가 주요 원인임을 시사합니다. 앱 차단과 아침 호흡 루틴이 평일 아침에 도움이 될 수 있습니다.';

  @override
  String get moodPattern3obs => '기분 저하는 7시간 미만 수면과 상관관계가 있습니다';

  @override
  String get moodPattern3tip =>
      '오후 10시 30분 취침 습관과 캐모마일 라떼 레시피가 기본 기분을 개선할 수 있습니다.';

  @override
  String get weeklyTipText =>
      '기분 패턴에 따르면 화요일과 수요일 아침에 코르티솔이 가장 높을 것입니다. 그날 첫 업무 전에 4-7-8 호흡법을 시도해 보세요. 일기에 따르면 운동할 때 기분이 더 좋아집니다 — 오전 10시 전 20분간 가벼운 운동을 고려해 보세요.';

  @override
  String playingMeditation(Object title) {
    return '재생 중: $title';
  }

  @override
  String get medTitle1 => '아침 코르티솔 리셋';

  @override
  String get medDesc1 => '코르티솔 기상 반응을 조절하며 하루를 시작하세요.';

  @override
  String get medCat1 => '아침';

  @override
  String get medTitle2 => '수면 준비';

  @override
  String get medDesc2 => '깊고 회복적인 수면을 위해 신경계를 안정시키세요.';

  @override
  String get medCat2 => '수면';

  @override
  String get medTitle3 => '불안 해소';

  @override
  String get medDesc3 => 'MBSR 기법으로 스트레스 반응 주기를 차단하세요.';

  @override
  String get medCat3 => '불안';

  @override
  String get medTitle4 => '깊은 집중';

  @override
  String get medDesc4 => '차분한 생산성 상태에 들어가며 코르티솔을 낮추세요.';

  @override
  String get medCat4 => '집중';

  @override
  String get medTitle5 => '바디 스캔';

  @override
  String get medDesc5 => '만성 스트레스로 축적된 신체 긴장을 풀어보세요.';

  @override
  String get medCat5 => '신체';

  @override
  String get filterBreakfast => '아침식사';

  @override
  String get filterSmoothies => '스무디';

  @override
  String get filterSalads => '샐러드';

  @override
  String get filterMains => '메인';

  @override
  String get filterSnacks => '간식';

  @override
  String get filterDrinks => '음료';

  @override
  String get filterDesserts => '디저트';

  @override
  String get moreJournalSub => '매일 기분을 기록하세요';

  @override
  String get moreSleepSub => '수면 품질을 모니터링하세요';

  @override
  String get moreSettingsSub => '테마, 언어, 알림';

  @override
  String unlockProButton(Object price) {
    return 'PRO 잠금 해제 — $price';
  }

  @override
  String get paymentDisclaimer => 'Google Play에서 결제 처리. 일회성 구매. 구독 없음.';

  @override
  String get proThankYouSnackbar => '감사합니다! 모든 PRO 기능이 잠금 해제되었습니다.';

  @override
  String get cortisolZeroPro => 'Cortisol Zero PRO';

  @override
  String get proBannerDescription => '레시피, 명상, 앱 차단, AI 인사이트 — \$6.50 일회성';

  @override
  String get aiDemoDataNotice =>
      '데모 미리보기입니다. 매일 기분을 기록하면 실제 데이터 기반 맞춤 AI 인사이트를 확인할 수 있습니다.';

  @override
  String get aiDemoLabel => '데모 데이터';

  @override
  String get recipeWhyItWorks => '효과가 있는 이유';

  @override
  String get recipeIngredients => '재료';

  @override
  String get recipeInstructions => '조리법';

  @override
  String recipeServings(int count) {
    return '$count인분';
  }

  @override
  String get blockedAppsTitle => '차단된 앱';

  @override
  String get blockerAddApps => '추가';

  @override
  String get blockerNoAppsSelected =>
      '선택된 앱이 없습니다. 추가를 눌러 아침 집중 시간에 차단할 앱을 선택하세요.';

  @override
  String get blockerSelectApps => '차단할 앱 선택';

  @override
  String get blockerSearchApps => '앱 검색...';

  @override
  String get blockerLoadingApps => '설치된 앱 불러오는 중...';

  @override
  String get blockerStartButton => '차단 시작';

  @override
  String get blockerStopButton => '차단 중지';

  @override
  String get blockerPermUsageStats => '사용 데이터 접근';

  @override
  String get blockerPermOverlay => '다른 앱 위에 표시';

  @override
  String get blockerRefreshPerms => '권한 새로고침';

  @override
  String get proActivatedMessage => '모든 PRO 기능이 잠금 해제되었으며 몇 초 후에 활성화됩니다.';

  @override
  String get permOnboardingTitle => '권한 설정';

  @override
  String get permStepUsageTitle => '사용 데이터 접근';

  @override
  String get permStepUsageDesc =>
      '스트레스 원인 앱을 열 때 감지할 수 있도록 허용해 주세요. 차단기 활성화에 필요합니다.';

  @override
  String get permStepUsageButton => '사용 설정 열기';

  @override
  String get permStepOverlayTitle => '다른 앱 위에 표시';

  @override
  String get permStepOverlayDesc =>
      '스트레스 원인을 가릴 수 있도록 허용해 주세요. 차단된 앱 대신 평온한 화면을 표시합니다.';

  @override
  String get permStepOverlayButton => '오버레이 설정 열기';

  @override
  String get permStepGranted => '권한이 부여됨';

  @override
  String get permNextStep => '다음 단계';

  @override
  String get permAllDone => '모든 준비 완료 — 시작합시다!';

  @override
  String get permBackToStep1 => '1단계로 돌아가기';

  @override
  String get permStepUsageLottieHint => '목록에서 Cortisol Zero를 찾아 접근을 활성화하세요';

  @override
  String get permStepOverlayLottieHint => '스위치를 전환하여 오버레이 표시를 허용하세요';

  @override
  String get permSetupRequired => '설정이 필요합니다';

  @override
  String get permSetupRequiredDesc => '앱을 차단하려면 세 가지 권한이 필요합니다. 아래를 눌러 설정하세요.';

  @override
  String get permStepAccessibilityTitle => '접근성 서비스';

  @override
  String get permStepAccessibilityDesc =>
      'Cortisol Zero는 현재 화면에 표시된 앱을 감지하기 위해서만 Android 접근성 서비스를 사용합니다(패키지 이름 기준). 메시지, 비밀번호, 금융 정보 또는 개인 정보에는 접근하지 않습니다. 모든 처리는 기기에서만 로컬로 이루어지며, 저장되거나 전송되지 않습니다.';

  @override
  String get permStepAccessibilityButton => '접근성 설정 열기';

  @override
  String get permStepAccessibilityLottieHint =>
      '설치된 앱 목록에서 Cortisol Zero를 찾아 활성화하세요';

  @override
  String get blockerPermAccessibility => '접근성 서비스';

  @override
  String get permBackToStep2 => '2단계로 돌아가기';

  @override
  String get permDisclosureAccesses => '액세스하는 것';

  @override
  String get permDisclosureAccessesDesc => '현재 화면에 있는 앱 (패키지 이름만)';

  @override
  String get permDisclosureNotAccesses => '액세스하지 않는 것';

  @override
  String get permDisclosureNotAccessesDesc =>
      '메시지, 비밀번호, 금융 데이터, 개인 정보, 더이상 연동되지 않음, 연락처';

  @override
  String get permDisclosureDataUsage => '데이터 사용 방식';

  @override
  String get permDisclosureDataUsageDesc =>
      '모든 감지는 디바이스에서 로컈로 수행됩니다. 저장되거나 전송되지 않습니다.';

  @override
  String get permUnderstandContinue => '이해하고 계속합니다';

  @override
  String get moodInsights3DayTitle => '3일 빠른 인사이트';

  @override
  String get moodInsightsWeeklyTitle => '주간 패턴 분석';

  @override
  String get moodInsightsRetry => '분석 재시도';

  @override
  String get moodInsightsError => '분석에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get moodInsightsNotEnoughData => '인사이트를 보려면 최소 2개의 기분 기록을 추가하세요';

  @override
  String get privacyOverviewTitle => '데이터 처리 방식';

  @override
  String get privacyOverviewBody =>
      'Cortisol Zero는 스트레스 앱을 차단하기 위해 3개의 권한이 필요합니다. 모든 처리는 기기에서 로컬로 이루어집니다. 저희는 서버에 데이터를 수집, 저장 또는 전송하지 않습니다. 사용자 계정이나 분석이 없습니다.';

  @override
  String get privacyOverviewAccept => '동의하고 계속하기';

  @override
  String get privacyOverviewLearnMore => '개인정보 보호정책';

  @override
  String get privacyOverviewTerms => '서비스 이용약관';

  @override
  String get permTutorialButton => '비디오 튜토리얼 보기';

  @override
  String get permTapToGrant => '탭하여 권한 부여';

  @override
  String get permFindAppText => '다음 화면에서 Cortisol Zero를 찾으세요';

  @override
  String get permTapAndToggle => '키고 스위치를 켜세요';

  @override
  String get permWhatItDoes => '이 권한이 하는 것';

  @override
  String get permWhatItDoesNot => '이 권한이 하지 않는 것';

  @override
  String get legalSectionTitle => '법률 정보';

  @override
  String get legalPrivacyPolicy => '개인정보 보호정책';

  @override
  String get legalTermsOfService => '서비스 이용약관';

  @override
  String get todaysMoodRecorded => '오늘 기분: 기록됨';

  @override
  String blockerScheduleInfo(String time, String hours) {
    return '$time부터 매일 $hours시간 차단 예약. 차단은 자동으로 종료됩니다.';
  }

  @override
  String get privacyPolicyTitle => '개인정보 보호정책';

  @override
  String get privacyPolicyLastUpdated => '시행일: 2025년 1월 1일';

  @override
  String get privacyPolicyIntro =>
      'Cortisol Zero(\"당사\", \"저희\", \"앱\")는 귀하의 개인정보 보호에 최선을 다하고 있습니다.';

  @override
  String get privacyPolicyDataCollectedTitle => '1. 수집하는 데이터';

  @override
  String get privacyPolicyDataCollectedBody =>
      'Cortisol Zero는 어떠한 개인 데이터도 수집하지 않습니다. 모든 데이터(일기 항목, 수면 기록, 호흡 세션 이력, 앱 차단 일정)는 규하의 기기에만 저장되며 어떠한 서버에도 전송되지 않습니다.';

  @override
  String get privacyPolicyPermissionsTitle => '2. 사용되는 권한';

  @override
  String get privacyPolicyPermissionsBody =>
      '• 접근성 서비스 — 차단 일정을 적용하기 위해 현재 화면에 표시된 앱(패키지 이름만)을 감지합니다. 메시지, 비밀번호 또는 개인 데이터는 읽지 않습니다.\n\n• 다른 앱 위에 표시 — 집중 시간 동안 차단된 앱이 열렸을 때 평온한 오버레이 화면을 표시합니다.\n\n• 사용현황 통계 — 차단 규칙을 활성화하기 위해 앱 사용 데이터를 읽습니다. 해당 데이터는 기기에만 저장됩니다.\n\n• 포그라운드 서비스 — 예약된 집중 시간 동안 백그라운드에서 차단기를 활성 상태로 유지합니다.\n\n이러한 권한은 당사 또는 제3자와 데이터를 수집, 전송 또는 공유하는 데 사용되지 않습니다.';

  @override
  String get privacyPolicyPurchasesTitle => '3. 앱 내 구매';

  @override
  String get privacyPolicyPurchasesBody =>
      '구매는 Google Play를 통해 처리됩니다. 당사는 결제 정보를 저장하지 않습니다. PRO 상태 확인을 위한 구매 토큰만 수신합니다.';

  @override
  String get privacyPolicyThirdPartyTitle => '4. 제3자 서비스';

  @override
  String get privacyPolicyThirdPartyBody =>
      '당사는 개인 데이터를 수집하는 분석, 광고 SDK 또는 충돌 보고 서비스를 통합하지 않습니다. 앱에는 추적 코드가 없습니다.';

  @override
  String get privacyPolicyChildrenTitle => '5. 아동';

  @override
  String get privacyPolicyChildrenBody =>
      'Cortisol Zero는 13세 미만 아동의 정보를 의도적으로 수집하지 않습니다. 앱은 일반 대중을 위해 등급 분류되어 있습니다.';

  @override
  String get privacyPolicyContactTitle => '6. 문의';

  @override
  String get privacyPolicyContactBody =>
      '개인정보 관련 문의는 cartizolzero@gmail.com으로 연락해 주시기 바랍니다.';

  @override
  String get privacyPolicyChangesTitle => '7. 변경사항';

  @override
  String get privacyPolicyChangesBody =>
      '당사는 본 정책을 업데이트할 수 있습니다. 변경 후 앱을 계속 사용하면 개정된 정책에 동의하는 것으로 간주됩니다.';

  @override
  String get termsTitle => '서비스 이용약관';

  @override
  String get termsLastUpdated => '시행일: 2025년 1월 1일';

  @override
  String get termsIntro => 'Cortisol Zero를 사용함으로써 귀하는 본 약관에 동의하는 것으로 간주됩니다.';

  @override
  String get termsUseTitle => '1. 앱 사용';

  @override
  String get termsUseBody =>
      'Cortisol Zero는 개인 건강 및 생산성 도구입니다. 본인의 스트레스 관리 및 집중력 향상 목적으로 사용할 수 있습니다. 앱 또는 거 콘텐츠를 역개조하거나 배포하거나 재판매할 수 없습니다.';

  @override
  String get termsProTitle => '2. PRO 구독';

  @override
  String get termsProBody =>
      'PRO 기능은 Google Play를 통한 앱 내 구매로 활성화됩니다. 구독은 갱신일 최소 24시간 전에 취소하지 않는 한 자동으로 재갱신됩니다. 환불은 Google Play 환불 정책에 따라 처리됩니다.';

  @override
  String get termsPermissionsTitle => '3. 권한';

  @override
  String get termsPermissionsBody =>
      '앱은 앱 차단 기능을 제공하기 위해 특정 Android 권한(접근성 서비스, 다른 앱 위에 표시, 사용현황 통계)이 필요합니다. 이러한 권한은 명시된 목적에만 사용되며 개인 데이터 수집에는 거단히 사용되지 않습니다.';

  @override
  String get termsDisclaimerTitle => '4. 면유사항';

  @override
  String get termsDisclaimerBody =>
      'Cortisol Zero는 건강 웰보 도구이며 의료기기 또는 의료 조언이 아닙니다. 의료 문제에 대해서는 반드시 의료 전문가와 상담하시기 바랍니다.';

  @override
  String get termsLiabilityTitle => '5. 책임 제한';

  @override
  String get termsLiabilityBody =>
      '당사는 본 앱 사용으로 인한 어떠한 손해에 대해서도 책임을 지지 않습니다. 앱은 어떠한 보증도 없이 \"현재 상태 그대로\" 제공됩니다.';

  @override
  String get termsChangesTitle => '6. 변경사항';

  @override
  String get termsChangesBody =>
      '당사는 본 약관을 업데이트할 수 있습니다. 변경 후 앱을 계속 사용하면 개정된 약관에 동의하는 것으로 간주됩니다.';

  @override
  String get termsContactTitle => '7. 문의';

  @override
  String get termsContactBody => '문의사항은 cartizolzero@gmail.com로 연락해 주시기 바랍니다.';

  @override
  String get testAlarmIn1Min => '1분 후 알람 테스트';

  @override
  String get testAlarmScheduled => '1분 후 테스트 알람이 예약됨';

  @override
  String get blockerLockedTitle => '설정 잠김';

  @override
  String blockerLockedBody(String time) {
    return '포커스 모드가 활성화되어 있습니다. $time에 차단이 끝난 후 설정을 변경할 수 있습니다.';
  }
}
