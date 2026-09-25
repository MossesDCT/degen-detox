import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'strings.dart';
import 'luxury.dart';

String localized(List<String> values, String locale) {
  final index = languages.indexOf(locale);
  return values[index < 0 ? 0 : index];
}

String eduText(String key, String locale) =>
    localized(educationWords[key]!, locale);

const educationWords = <String, List<String>>{
  'read': [
    'Read & practise',
    'Skaityti ir pritaikyti',
    'Leer y practicar',
    'Lire et pratiquer',
    'Lesen & anwenden',
    '읽고 실천하기'
  ],
  'action': [
    'One step today',
    'Vienas žingsnis šiandien',
    'Un paso hoy',
    'Un pas aujourd’hui',
    'Ein Schritt heute',
    '오늘의 한 걸음'
  ],
  'disclaimer': [
    'Free, evidence-informed guidance. This app does not measure cortisol, diagnose or treat illness, or make trading safe. Seek professional help when symptoms persist or affect daily life.',
    'Nemokamos, moksliniais šaltiniais paremtos gairės. Programėlė nematuoja kortizolio, nediagnozuoja ir negydo ligų bei nepaverčia prekybos saugia. Jei simptomai užsitęsia ar trukdo kasdienybei, kreipkis į specialistą.',
    'Orientación gratuita basada en evidencia. La app no mide cortisol, diagnostica ni trata enfermedades, ni hace seguro el trading. Busca ayuda profesional si los síntomas persisten o afectan tu vida.',
    'Conseils gratuits fondés sur des sources scientifiques. L’app ne mesure pas le cortisol, ne diagnostique ni ne traite de maladie et ne rend pas le trading sûr. Consulte si les symptômes persistent ou perturbent ta vie.',
    'Kostenlose, evidenzbasierte Orientierung. Die App misst kein Cortisol, diagnostiziert oder behandelt keine Erkrankungen und macht Trading nicht sicher. Bei anhaltenden oder belastenden Symptomen professionelle Hilfe suchen.',
    '근거 자료를 바탕으로 한 무료 안내입니다. 코르티솔을 측정하거나 질병을 진단·치료하지 않으며 거래를 안전하게 만들지 않습니다. 증상이 지속되거나 일상에 영향을 주면 전문가에게 상담하세요.',
  ],
};

class EducationArticle {
  const EducationArticle(
      {required this.id,
      required this.icon,
      required this.titles,
      required this.intros,
      required this.bodies,
      required this.actions,
      required this.sources});
  final String id;
  final IconData icon;
  final List<String> titles, intros, bodies, actions;
  final Map<String, String> sources;
  String title(String l) => localized(titles, l);
  String intro(String l) => localized(intros, l);
  String body(String l) => localized(bodies, l);
  String action(String l) => localized(actions, l);
}

const who = 'https://www.who.int/news-room/questions-and-answers/item/stress';
const nccih = 'https://www.nccih.nih.gov/health/stress';
const nhsGambling =
    'https://www.nhs.uk/live-well/addiction-support/gambling-addiction/';
const tradingReview = 'https://pmc.ncbi.nlm.nih.gov/articles/PMC11815345/';
const screenReview = 'https://pmc.ncbi.nlm.nih.gov/articles/PMC12754674/';

const educationArticles = <EducationArticle>[
  EducationArticle(
      id: 'stress-body',
      icon: Icons.monitor_heart_outlined,
      titles: [
        'Stress is an alarm, not an enemy',
        'Stresas: signalas, ne priešas',
        'El estrés es una alarma',
        'Le stress est un signal',
        'Stress ist ein Alarmsignal',
        '스트레스는 경고 신호입니다'
      ],
      intros: [
        'A short stress response can be useful. Staying on alert for too long can become exhausting.',
        'Trumpa streso reakcija gali būti naudinga. Nuolatinė parengtis ilgainiui išsekina.',
        'Una respuesta breve puede ayudar. La alerta constante puede agotarte.',
        'Une réaction brève peut être utile. Une alerte permanente peut épuiser.',
        'Eine kurze Stressreaktion kann helfen. Dauernde Alarmbereitschaft kann erschöpfen.',
        '짧은 스트레스 반응은 도움이 될 수 있지만 지속적인 긴장은 지치게 합니다.',
      ],
      bodies: [
        'When a threat is perceived, the body prepares to act: heart rate and breathing rise and muscles tense. Cortisol is part of normal physiology, not a toxin to eliminate. The goal is recovery and flexible responses, not “zero cortisol”.\n\nPersistent stress can worsen sleep, headaches and digestive problems and is linked with anxiety and depression. Symptoms have many possible causes; the app cannot tell whether your hormone levels are high. New or severe symptoms need medical assessment, not just a breathing timer.',
        'Pajutęs grėsmę kūnas ruošiasi veikti: padažnėja pulsas ir kvėpavimas, įsitempia raumenys. Kortizolis yra normali organizmo veiklos dalis, ne toksinas, kurį reikia pašalinti. Tikslas yra atsigavimas, o ne „nulinis kortizolis“.\n\nUžsitęsęs stresas gali bloginti miegą, stiprinti galvos skausmus ir virškinimo sutrikimus, siejamas su nerimu ir depresija. Simptomai gali turėti įvairių priežasčių; programėlė nenustato hormonų lygio. Naujiems ar stipriems simptomams reikia mediko įvertinimo, ne vien kvėpavimo laikmačio.',
        'Ante una amenaza, aumentan el pulso y la respiración y se tensan los músculos. El cortisol es parte normal del organismo, no una toxina que eliminar. El objetivo es recuperarse, no lograr “cortisol cero”.\n\nEl estrés persistente puede empeorar sueño, cefaleas y problemas digestivos y se relaciona con ansiedad y depresión. Los síntomas tienen distintas causas; la app no determina tus niveles hormonales. Los síntomas nuevos o intensos requieren evaluación médica.',
        'Face à une menace, le rythme cardiaque et la respiration augmentent, les muscles se tendent. Le cortisol fait partie du fonctionnement normal du corps : ce n’est pas une toxine à éliminer. L’objectif est la récupération, pas un « cortisol zéro ».\n\nLe stress durable peut aggraver sommeil, maux de tête et troubles digestifs ; il est associé à l’anxiété et à la dépression. Ces symptômes ont plusieurs causes possibles. L’app ne mesure pas les hormones. Des symptômes nouveaux ou sévères nécessitent un avis médical.',
        'Bei wahrgenommener Gefahr steigen Puls und Atemfrequenz, Muskeln spannen sich an. Cortisol gehört zur normalen Körperfunktion und ist kein Gift, das beseitigt werden muss. Ziel ist Erholung, nicht „null Cortisol“.\n\nAnhaltender Stress kann Schlaf, Kopfschmerzen und Verdauungsprobleme verschlechtern und hängt mit Angst und Depression zusammen. Symptome haben unterschiedliche Ursachen; die App bestimmt keinen Hormonspiegel. Neue oder starke Beschwerden ärztlich abklären lassen.',
        '위협을 느끼면 심박수와 호흡이 빨라지고 근육이 긴장합니다. 코르티솔은 정상적인 생리 기능의 일부이지 제거해야 할 독소가 아닙니다. 목표는 “코르티솔 제로”가 아니라 회복입니다.\n\n지속적인 스트레스는 수면, 두통, 소화 문제를 악화시킬 수 있으며 불안·우울과 관련됩니다. 증상에는 여러 원인이 있습니다. 앱은 호르몬 수치를 판단하지 않습니다. 새롭거나 심한 증상은 호흡 타이머만으로 해결하려 하지 말고 진료를 받으세요.',
      ],
      actions: [
        'Notice one body signal without judging it. Relax your shoulders, step away from prices and take a comfortable pause.',
        'Pastebėk vieną kūno signalą jo nevertindamas. Atpalaiduok pečius, atsitrauk nuo kainų ir trumpam sustok.',
        'Observa una señal corporal sin juzgarla. Relaja los hombros y aléjate de los precios un momento.',
        'Remarque un signal corporel sans jugement. Relâche les épaules et éloigne-toi des cours.',
        'Ein Körpersignal ohne Wertung bemerken. Schultern lockern und eine Pause von Kursen machen.',
        '몸의 신호 하나를 판단 없이 알아차리세요. 어깨를 풀고 시세 화면에서 잠시 벗어나세요.',
      ],
      sources: {
        'WHO · Stress': who,
        'NCCIH · Stress': nccih
      }),
  EducationArticle(id: 'mind', icon: Icons.psychology_outlined, titles: [
    'An overloaded mind',
    'Kai protui per daug',
    'Una mente sobrecargada',
    'Un esprit surchargé',
    'Wenn der Kopf überlastet ist',
    '마음이 과부하될 때'
  ], intros: [
    'Stress may make concentration harder and emotions feel more intense.',
    'Patiriant stresą sunkiau susikaupti, o emocijos gali tapti stipresnės.',
    'El estrés puede dificultar concentrarse e intensificar emociones.',
    'Le stress peut gêner la concentration et intensifier les émotions.',
    'Stress kann Konzentration erschweren und Gefühle verstärken.',
    '스트레스는 집중을 어렵게 하고 감정을 더 강하게 느끼게 할 수 있습니다.',
  ], bodies: [
    'Feeling irritable, worried or unable to concentrate is not proof that your brain is damaged. Stress and poor sleep can make everyday tasks harder. A stream of alerts leaves little room to recover, particularly if each price move feels personally urgent.\n\nSeparate the event from the impulse: “The price fell” is an observation; “I must win it back now” is a thought, not an instruction. Pausing does not guarantee a better trade. It creates space to choose whether to act at all. Persistent distress deserves professional support.',
    'Dirglumas, nerimas ar sunkumai susikaupti nereiškia, kad smegenys pažeistos. Stresas ir prastas miegas apsunkina kasdienes užduotis. Pranešimų srautas palieka mažai laiko atsigauti, ypač kai kiekvienas kainos pokytis atrodo skubus.\n\nAtskirk įvykį nuo impulso: „Kaina nukrito“ yra pastebėjimas, o „Privalau tuoj pat atsilošti“ yra mintis, ne nurodymas. Pauzė negarantuoja geresnio sandorio. Ji suteikia erdvės nuspręsti, ar apskritai veikti. Užsitęsus sunkumams verta kreiptis profesionalios pagalbos.',
    'La irritabilidad, preocupación o falta de concentración no prueban daño cerebral. El estrés y dormir mal pueden dificultar las tareas diarias. Las alertas continuas dejan poco espacio para recuperarse.\n\nSepara hecho e impulso: “El precio cayó” es una observación; “Debo recuperarlo ahora” es un pensamiento, no una orden. Pausar no garantiza una mejor operación, pero permite decidir si actuar. El malestar persistente merece apoyo profesional.',
    'Irritabilité, inquiétude ou difficulté à se concentrer ne prouvent pas une lésion cérébrale. Stress et mauvais sommeil peuvent compliquer le quotidien. Les alertes constantes laissent peu de place à la récupération.\n\nDistingue le fait de l’impulsion : « Le prix a baissé » est une observation ; « Je dois me refaire maintenant » est une pensée, pas un ordre. Une pause ne garantit pas un meilleur trade. Elle laisse le choix de ne pas agir. Une détresse persistante mérite un soutien professionnel.',
    'Reizbarkeit, Sorgen oder Konzentrationsprobleme beweisen keinen Hirnschaden. Stress und schlechter Schlaf können den Alltag erschweren. Ständige Meldungen lassen wenig Raum für Erholung.\n\nEreignis und Impuls trennen: „Der Kurs ist gefallen“ ist eine Beobachtung. „Ich muss es sofort zurückgewinnen“ ist ein Gedanke, kein Befehl. Eine Pause garantiert keinen besseren Trade, schafft aber eine Wahl. Bei anhaltender Belastung professionelle Unterstützung suchen.',
    '짜증, 걱정, 집중 곤란이 뇌 손상을 의미하지는 않습니다. 스트레스와 수면 부족은 일상을 어렵게 할 수 있습니다. 끊임없는 알림은 회복할 틈을 줄입니다.\n\n사건과 충동을 구분하세요. “가격이 떨어졌다”는 관찰이고, “지금 만회해야 한다”는 명령이 아닌 생각입니다. 멈춘다고 더 좋은 거래가 보장되지는 않지만 행동하지 않을 선택지가 생깁니다. 고통이 지속되면 전문적인 도움을 받으세요.',
  ], actions: [
    'Before opening a trading app, name the feeling and write the action you would choose if there were no urgency.',
    'Prieš atidarydamas prekybos programėlę įvardyk jausmą ir parašyk, ką rinktumeisi, jei nereikėtų skubėti.',
    'Antes de abrir la app, nombra la emoción y qué elegirías sin urgencia.',
    'Avant d’ouvrir l’app, nomme l’émotion et ton choix sans sentiment d’urgence.',
    'Vor dem Öffnen Gefühl benennen und notieren, was du ohne Zeitdruck wählen würdest.',
    '거래 앱을 열기 전에 감정과 서두르지 않아도 된다면 선택할 행동을 적어보세요.',
  ], sources: {
    'WHO · Stress': who,
    'Problematic trading · review': tradingReview
  }),
  EducationArticle(id: 'screens', icon: Icons.bedtime_outlined, titles: [
    'Screens, sleep and recovery',
    'Ekranai, miegas ir atsigavimas',
    'Pantallas, sueño y descanso',
    'Écrans, sommeil et récupération',
    'Bildschirme, Schlaf und Erholung',
    '화면, 수면, 회복'
  ], intros: [
    'Time matters, but so do content, timing and what screen use replaces.',
    'Svarbu ne tik trukmė, bet ir turinys, paros laikas bei tai, ką ekranai išstumia.',
    'Importan el tiempo, el contenido, el horario y lo que dejas de hacer.',
    'La durée compte, mais aussi le contenu, le moment et les activités remplacées.',
    'Nicht nur die Dauer zählt, sondern auch Inhalt, Zeitpunkt und verdrängte Aktivitäten.',
    '시간뿐 아니라 내용, 사용 시점, 화면 때문에 놓치는 활동도 중요합니다.',
  ], bodies: [
    'Research links greater screen use with poorer sleep in studied populations, but an association does not prove that screens alone caused the problem. Evidence varies by age and type of use; there is no single hour limit that diagnoses harm for every adult.\n\nAsk practical questions: am I delaying sleep, missing meals or replacing movement and time with people? Late price checking can keep emotionally charged decisions close to bedtime. Protect a wind-down period, reduce nonessential alerts and keep market checks out of bed. Screens are tools, not automatically harmful.',
    'Tyrimai sieja ilgesnį ekranų naudojimą su prastesniu miegu tirtose grupėse, bet ryšys neįrodo, kad vien ekranai sukėlė problemą. Duomenys skiriasi pagal amžių ir veiklą; nėra vienos valandų ribos, kuri visiems suaugusiesiems reikštų žalą.\n\nPaklausk: ar atidedu miegą, praleidžiu valgymus, mažiau judu ir bendrauju? Kainų tikrinimas vakare perkelia emociškai įtemptus sprendimus prie pat miego. Skirk laiko nurimti, išjunk nebūtinus pranešimus ir lovoje netikrink rinkų. Ekranai yra įrankiai, ne savaiminė žala.',
    'Los estudios relacionan mayor uso de pantallas con peor sueño, pero una asociación no demuestra causalidad. La evidencia varía por edad y actividad; no existe una cifra horaria que diagnostique daño en todos los adultos.\n\n¿Retrasas el sueño, saltas comidas o sustituyes movimiento y relaciones? Consultar precios de noche puede llevar decisiones intensas a la cama. Reserva tiempo para desconectar, reduce alertas innecesarias y evita revisar mercados en la cama. Las pantallas son herramientas, no un daño automático.',
    'Des études associent davantage d’écrans à un sommeil moins bon, sans prouver que les écrans seuls en sont la cause. Les résultats varient selon l’âge et l’usage ; aucun seuil horaire unique ne diagnostique un problème chez tous les adultes.\n\nRetardes-tu le sommeil, les repas, le mouvement ou les relations ? Les cours consultés tard peuvent rapprocher des décisions chargées d’émotion du coucher. Préserve une transition calme, coupe les alertes inutiles et évite les marchés au lit. Les écrans sont des outils, pas un danger automatique.',
    'Studien verbinden mehr Bildschirmnutzung mit schlechterem Schlaf. Ein Zusammenhang beweist aber keine alleinige Ursache. Ergebnisse unterscheiden sich nach Alter und Nutzung; es gibt keine Stundengrenze, die bei jedem Erwachsenen Schäden diagnostiziert.\n\nVerschiebst du Schlaf, Mahlzeiten, Bewegung oder Kontakte? Späte Kurskontrollen können aufwühlende Entscheidungen ins Bett bringen. Eine ruhige Abendphase schützen, unnötige Meldungen reduzieren und Märkte nicht im Bett prüfen. Bildschirme sind Werkzeuge, nicht automatisch schädlich.',
    '연구에서는 화면 사용 증가와 수면 저하의 관련성이 관찰되지만 화면만이 원인이라는 뜻은 아닙니다. 근거는 나이와 사용 방식에 따라 다르며 모든 성인에게 해를 진단하는 단일 시간 기준은 없습니다.\n\n잠이나 식사를 미루고 운동·관계를 대신하고 있나요? 늦은 시세 확인은 감정적인 결정을 취침 시간까지 끌고 올 수 있습니다. 진정할 시간을 확보하고 불필요한 알림을 줄이며 침대에서는 시장을 확인하지 마세요. 화면은 도구이지 그 자체로 해로운 것은 아닙니다.',
  ], actions: [
    'Choose a realistic screen-free wind-down period tonight. Move price alerts away from your sleeping space.',
    'Šį vakarą pasirink realistišką laiką be ekranų prieš miegą. Kainų pranešimams ne vieta tavo miego erdvėje.',
    'Elige un periodo realista sin pantallas antes de dormir y aparta las alertas de precios.',
    'Choisis ce soir un temps réaliste sans écran avant le coucher et éloigne les alertes.',
    'Heute eine realistische bildschirmfreie Abendphase wählen und Kursmeldungen fernhalten.',
    '오늘 밤 실천 가능한 취침 전 화면 없는 시간을 정하고 시세 알림을 수면 공간에서 치우세요.',
  ], sources: {
    'Screen use & sleep · review': screenReview,
    'WHO · Stress': who
  }),
  EducationArticle(id: 'calm-now', icon: Icons.air, titles: [
    'When stress spikes',
    'Kai stresas staiga pakyla',
    'Cuando sube el estrés',
    'Quand le stress monte',
    'Wenn Stress plötzlich steigt',
    '스트레스가 치솟을 때'
  ], intros: [
    'Calm does not need to be forced. Start with a small, comfortable pause.',
    'Ramybės nereikia išspausti. Pradėk nuo nedidelės, patogios pauzės.',
    'No fuerces la calma. Empieza con una pausa cómoda.',
    'Ne force pas le calme. Commence par une pause confortable.',
    'Ruhe nicht erzwingen. Mit einer angenehmen Pause beginnen.',
    '억지로 진정하려 하지 말고 편안한 짧은 멈춤부터 시작하세요.'
  ], bodies: [
    'Put both feet on the ground and let your shoulders soften. Breathe gently, without forcing a deep breath. Use the free breathing exercise only at a comfortable pace; stop if dizzy or uncomfortable. Breath holds are optional, not an achievement.\n\nLook around and notice what you can see and feel. Step outside or talk with someone you trust. These are coping options, not a way to erase risk, reverse losses or treat a medical emergency. Do not use a calming exercise to push yourself back into a harmful trading session.',
    'Padėk abi pėdas ant žemės ir atpalaiduok pečius. Kvėpuok švelniai, neversk savęs įkvėpti labai giliai. Nemokamą kvėpavimo pratimą atlik tik patogiu tempu; jei svaigsta galva ar nemalonu, sustok. Kvėpavimo sulaikymas neprivalomas ir nėra pasiekimas.\n\nApsidairyk, pastebėk tai, ką matai ir jauti. Išeik į lauką arba pasikalbėk su žmogumi, kuriuo pasitiki. Tai pagalbiniai būdai, ne rizikos panaikinimas, nuostolių atstatymas ar skubios medicinos pakaitalas. Nenaudok pratimo vien tam, kad grįžtum į žalingą prekybos sesiją.',
    'Apoya los pies y relaja los hombros. Respira suavemente, sin forzar profundidad. Usa el ejercicio gratuito a un ritmo cómodo y para si te mareas. Retener el aire es opcional, no un logro.\n\nObserva lo que ves y sientes. Sal o habla con alguien de confianza. Son opciones para afrontar el momento, no para eliminar riesgo, recuperar pérdidas ni tratar una urgencia. No uses la calma solo para volver a una sesión perjudicial.',
    'Pose les pieds au sol et relâche les épaules. Respire doucement, sans forcer. Utilise l’exercice gratuit à un rythme confortable ; arrête en cas de vertige ou d’inconfort. Retenir sa respiration est facultatif.\n\nObserve ce que tu vois et ressens. Sors ou parle à une personne de confiance. Ce sont des outils pour faire face, pas pour effacer le risque, récupérer des pertes ou traiter une urgence. Ne les utilise pas pour te forcer à reprendre une session nocive.',
    'Füße auf den Boden stellen, Schultern lockern. Sanft atmen, keine tiefen Atemzüge erzwingen. Die kostenlose Übung nur angenehm ausführen; bei Schwindel oder Unwohlsein stoppen. Atempausen sind freiwillig, keine Leistung.\n\nUmgebung wahrnehmen, hinausgehen oder mit einer vertrauten Person sprechen. Das sind Bewältigungshilfen, keine Risikobeseitigung, Verlustaufholung oder Notfallbehandlung. Beruhigung nicht nutzen, um dich zurück in eine schädliche Handelssitzung zu drängen.',
    '두 발을 바닥에 두고 어깨를 이완하세요. 깊게 들이쉬려고 힘주지 말고 부드럽게 호흡하세요. 무료 호흡 운동은 편안한 속도로 하고 어지럽거나 불편하면 멈추세요. 숨 참기는 선택이며 성취 목표가 아닙니다.\n\n주변에서 보이고 느껴지는 것을 알아차리세요. 밖으로 나가거나 믿는 사람과 대화하세요. 이는 대처 방법이지 위험 제거, 손실 회복, 응급 치료가 아닙니다. 해로운 거래로 돌아가기 위해 진정 운동을 이용하지 마세요.',
  ], actions: [
    'Pause the trading session before starting the breathing timer.',
    'Prieš paleisdamas kvėpavimo laikmatį sustabdyk prekybos sesiją.',
    'Pausa la sesión antes del ejercicio de respiración.',
    'Interromps la session avant l’exercice respiratoire.',
    'Handelssitzung vor der Atemübung unterbrechen.',
    '호흡 타이머를 시작하기 전에 거래를 멈추세요.'
  ], sources: {
    'NHS · Breathing for stress':
        'https://www.nhs.uk/mental-health/self-help/guides-tools-and-activities/breathing-exercises-for-stress/',
    'WHO · Stress': who
  }),
  EducationArticle(id: 'chronic', icon: Icons.spa_outlined, titles: [
    'A plan for persistent stress',
    'Planas užsitęsusiam stresui',
    'Un plan para el estrés persistente',
    'Face au stress durable',
    'Ein Plan bei Dauerstress',
    '지속되는 스트레스에 대한 계획'
  ], intros: [
    'Recovery is a routine, not a perfect streak.',
    'Atsigavimas yra rutina, ne tobula pasiekimų serija.',
    'Recuperarse es una rutina, no una racha perfecta.',
    'Récupérer est une routine, pas une série parfaite.',
    'Erholung ist eine Routine, keine perfekte Serie.',
    '회복은 완벽한 연속 기록이 아니라 일상의 과정입니다.'
  ], bodies: [
    'Start with regular sleep and meals, manageable movement, time outdoors and contact with people you trust. Reduce news or market checking when it worsens stress. Choose one small change you can repeat rather than a demanding “detox”. Balanced meals support general health; no recipe here is proven to lower your blood cortisol.\n\nRelaxation or mindfulness may help some people, but they do not replace treatment. If stress persists, sleep or functioning deteriorates, or alcohol and other substances become coping tools, contact a health professional. You do not have to wait until a crisis.',
    'Pradėk nuo pastovaus miego ir valgymo ritmo, įveikiamo judėjimo, laiko lauke ir ryšio su artimaisiais. Mažink naujienų ar rinkų tikrinimą, jei tai didina įtampą. Rinkis vieną pakartojamą pokytį, ne griežtą „detoksą“. Subalansuotas maistas padeda bendrai sveikatai; nė vienas mūsų receptas nėra įrodytas būdas mažinti tavo kraujo kortizolį.\n\nAtsipalaidavimas ar dėmesingumas kai kam padeda, bet nepakeičia gydymo. Jei stresas užsitęsia, prastėja miegas ar kasdienė veikla, arba alkoholį naudoji įtampai slopinti, kreipkis į sveikatos specialistą. Krizės laukti nereikia.',
    'Empieza con sueño y comidas regulares, movimiento manejable, aire libre y contacto social. Reduce noticias o mercados si aumentan tu estrés. Elige un cambio repetible, no un “detox” exigente. Comer equilibrado apoya la salud general; ninguna receta aquí ha demostrado reducir tu cortisol sanguíneo.\n\nLa relajación o atención plena pueden ayudar, pero no sustituyen tratamiento. Si persiste el estrés, empeoran el sueño o la vida diaria, o recurres a sustancias, consulta a un profesional. No necesitas esperar una crisis.',
    'Commence par des horaires réguliers de sommeil et de repas, du mouvement accessible, du temps dehors et des liens sociaux. Réduis les nouvelles ou marchés s’ils aggravent le stress. Choisis un petit changement répétable, pas une « détox » exigeante. Une alimentation équilibrée soutient la santé ; aucune recette ici ne prouve une baisse de ton cortisol sanguin.\n\nRelaxation et pleine conscience peuvent aider, sans remplacer les soins. Si stress, sommeil ou fonctionnement se dégradent, ou si tu utilises des substances pour tenir, consulte sans attendre la crise.',
    'Regelmäßiger Schlaf und Mahlzeiten, machbare Bewegung, Zeit draußen und soziale Kontakte sind ein Anfang. Nachrichten oder Kurse reduzieren, wenn sie belasten. Eine kleine wiederholbare Änderung statt einer strengen „Detox-Kur“ wählen. Ausgewogenes Essen unterstützt die Gesundheit; kein Rezept hier senkt nachweislich deinen Blut-Cortisolwert.\n\nEntspannung oder Achtsamkeit können helfen, ersetzen aber keine Behandlung. Bei anhaltendem Stress, schlechterem Schlaf, Alltagsschwierigkeiten oder Substanzen als Bewältigungshilfe Fachpersonal ansprechen. Nicht auf eine Krise warten.',
    '규칙적인 수면과 식사, 감당할 수 있는 움직임, 야외 활동, 믿는 사람과의 관계부터 시작하세요. 뉴스나 시세 확인이 긴장을 키우면 줄이세요. 엄격한 “디톡스”보다 반복 가능한 작은 변화를 선택하세요. 균형 잡힌 식사는 건강을 돕지만 여기의 레시피가 혈중 코르티솔을 낮춘다고 입증된 것은 아닙니다.\n\n이완이나 마음챙김은 도움이 될 수 있지만 치료를 대신하지 않습니다. 스트레스가 지속되고 수면·일상이 나빠지거나 술 등으로 버티게 되면 위기까지 기다리지 말고 전문가에게 상담하세요.',
  ], actions: [
    'Write one small recovery habit and when you will do it. If symptoms persist, arrange a consultation.',
    'Užrašyk vieną mažą atsigavimo įprotį ir kada jį atliksi. Jei simptomai užsitęsia, susitark dėl konsultacijos.',
    'Anota un hábito pequeño y cuándo hacerlo. Si persisten síntomas, pide consulta.',
    'Note une petite habitude et son horaire. Si les symptômes persistent, prends rendez-vous.',
    'Eine kleine Erholungsgewohnheit mit Zeitpunkt notieren. Bei anhaltenden Beschwerden Termin vereinbaren.',
    '작은 회복 습관 하나와 실천할 시간을 적고 증상이 지속되면 상담을 예약하세요.'
  ], sources: {
    'WHO · Stress': who,
    'NCCIH · Stress': nccih
  }),
  EducationArticle(id: 'boundaries', icon: Icons.shield_outlined, titles: [
    'Healthier boundaries around trading',
    'Sveikesnės ribos prekiaujant',
    'Límites más saludables al operar',
    'Des limites plus saines au trading',
    'Gesündere Grenzen beim Trading',
    '거래 주변에 건강한 경계 세우기'
  ], intros: [
    'Protect sleep, essential money and the right not to trade.',
    'Saugok miegą, būtinoms išlaidoms skirtus pinigus ir teisę neprekiauti.',
    'Protege sueño, dinero esencial y el derecho a no operar.',
    'Protège sommeil, argent essentiel et droit de ne pas trader.',
    'Schlaf, notwendiges Geld und das Recht auf Nicht-Handeln schützen.',
    '수면, 필수 생활비, 거래하지 않을 권리를 지키세요.'
  ], bodies: [
    'A market open all day does not require you to be available all day. Set a start and finish time before opening an app. Avoid decisions when exhausted, distressed or intoxicated. Do not borrow to recover losses or use money needed for essentials.\n\nDecide in advance what ends a session: your planned time, rising agitation or an urge to chase losses. A price alert is not a command. These are harm-reduction boundaries, not investment advice or a guarantee of safe or profitable trading. Taking a longer break, or not trading at all, is a valid choice.',
    'Visą parą veikianti rinka nereikalauja tavo dėmesio visą parą. Dar prieš atidarydamas programėlę nusistatyk pradžią ir pabaigą. Venk sprendimų būdamas išsekęs, stipriai susijaudinęs ar apsvaigęs. Nesiskolink nuostoliams atgauti ir nerizikuok būtinoms išlaidoms skirtais pinigais.\n\nIš anksto nuspręsk, kas užbaigs sesiją: nustatytas laikas, stiprėjanti įtampa ar noras atsilošti. Kainos pranešimas nėra komanda. Tai žalos mažinimo ribos, ne investavimo rekomendacijos ir ne saugaus ar pelningo treidingo garantija. Ilgesnė pertrauka arba visiškas atsisakymas prekiauti yra tinkamas pasirinkimas.',
    'Que el mercado abra todo el día no exige tu presencia constante. Define inicio y fin antes de abrir la app. Evita decisiones agotado, alterado o intoxicado. No pidas préstamos para recuperar pérdidas ni uses dinero esencial.\n\nDecide qué termina la sesión: la hora prevista, tensión creciente o ganas de perseguir pérdidas. Una alerta no es una orden. Son límites para reducir daños, no asesoramiento financiero ni garantía de seguridad o beneficio. Descansar más tiempo o no operar también es válido.',
    'Un marché ouvert en permanence n’exige pas ta présence permanente. Fixe début et fin avant d’ouvrir l’app. Évite les décisions épuisé, bouleversé ou sous substances. N’emprunte pas pour récupérer des pertes et protège l’argent essentiel.\n\nDécide ce qui termine la session : horaire prévu, agitation ou envie de te refaire. Une alerte n’est pas un ordre. Ces limites réduisent les risques de dommages, sans conseil financier ni garantie de sécurité ou profit. Une longue pause ou ne pas trader est un choix valable.',
    'Ein ständig geöffneter Markt verlangt keine ständige Verfügbarkeit. Anfang und Ende vor dem Öffnen festlegen. Erschöpft, aufgewühlt oder berauscht keine Entscheidungen treffen. Nicht zur Verlustaufholung leihen oder notwendiges Geld riskieren.\n\nVorher bestimmen, was die Sitzung beendet: Zeitlimit, steigende Unruhe oder Verlustjagd. Kursmeldungen sind keine Befehle. Diese Grenzen dienen der Schadensminderung, sind keine Anlageberatung und garantieren weder Sicherheit noch Gewinn. Längere Pausen oder gar kein Trading sind legitime Entscheidungen.',
    '시장이 하루 종일 열려 있어도 늘 참여할 필요는 없습니다. 앱을 열기 전에 시작과 종료 시간을 정하세요. 지쳤거나 괴롭거나 술에 취한 상태에서 결정하지 마세요. 손실을 만회하려고 빌리거나 생활비를 위험에 노출하지 마세요.\n\n예정 시간, 커지는 초조함, 손실 추격 충동 등 세션을 끝낼 조건을 미리 정하세요. 가격 알림은 명령이 아닙니다. 이는 피해를 줄이기 위한 경계이며 투자 조언이나 안전·수익 보장이 아닙니다. 오래 쉬거나 거래하지 않는 것도 유효한 선택입니다.',
  ], actions: [
    'Write a finish time and one reason to stop before your next session. Honour stopping even if the market keeps moving.',
    'Prieš kitą sesiją užrašyk pabaigos laiką ir vieną sustojimo priežastį. Sustok net jei rinka juda toliau.',
    'Anota hora de cierre y un motivo para parar antes de tu próxima sesión.',
    'Note l’heure de fin et une raison d’arrêter avant la prochaine session.',
    'Vor der nächsten Sitzung Endzeit und einen Stoppgrund notieren.',
    '다음 세션 전에 종료 시간과 중단 이유 하나를 적고 시장이 움직여도 멈추세요.'
  ], sources: {
    'Problematic trading · review': tradingReview,
    'NHS · Gambling-related harm': nhsGambling
  }),
  EducationArticle(id: 'warning-signs', icon: Icons.flag_outlined, titles: [
    'When trading becomes hard to stop',
    'Kai sustoti tampa sunku',
    'Cuando cuesta dejar de operar',
    'Quand s’arrêter devient difficile',
    'Wenn Aufhören schwerfällt',
    '거래를 멈추기 어려워질 때'
  ], intros: [
    'Look at the effect on your life, not the label “degen”.',
    'Vertink poveikį gyvenimui, ne „degeno“ etiketę.',
    'Mira el efecto en tu vida, no la etiqueta “degen”.',
    'Regarde l’impact sur ta vie, pas l’étiquette « degen ».',
    'Auf die Folgen im Leben schauen, nicht auf das Label „Degen“.',
    '“디젠”이라는 이름보다 삶에 미치는 영향을 보세요.'
  ], bodies: [
    'Warning signs include chasing losses, hiding spending, borrowing, repeatedly breaking your own limits and neglecting sleep, work or relationships. Feeling compelled to check prices despite harm also deserves attention. Crypto trading can share gambling-like patterns, but not every trader has an addiction; research definitions are still developing.\n\nYou do not need a diagnosis or a large loss to ask for help. Pause access, protect essential money and tell someone you trust. Where available, use platform restrictions or self-exclusion. An app blocker alone is not treatment and can be disabled. Support and practical financial safeguards matter.',
    'Įspėjamieji ženklai: bandymas atsilošti, išlaidų slėpimas, skolinimasis, nuolatinis savo ribų laužymas, miego, darbo ar santykių apleidimas. Dėmesio vertas ir nenugalimas noras tikrinti kainas, nors tai jau kenkia. Kripto prekyba gali turėti į lošimus panašių bruožų, tačiau ne kiekvienas prekiautojas yra priklausomas; mokslinės sąvokos dar plėtojamos.\n\nPagalbai nereikia diagnozės ar didelio nuostolio. Sustabdyk prieigą, apsaugok būtinus pinigus, pasakyk žmogui, kuriuo pasitiki. Kur prieinama, rinkis platformos apribojimus ar savanorišką pašalinimą. Vien blokatorius nėra gydymas ir gali būti išjungtas. Svarbi ir pagalba, ir finansinės apsaugos.',
    'Señales: perseguir pérdidas, ocultar gastos, endeudarte, romper límites y descuidar sueño, trabajo o relaciones. Revisar precios compulsivamente pese al daño merece atención. El trading cripto puede compartir patrones del juego, pero no todo trader tiene adicción; las definiciones siguen evolucionando.\n\nNo necesitas diagnóstico ni grandes pérdidas para pedir ayuda. Pausa el acceso, protege dinero esencial y habla con alguien. Usa restricciones o autoexclusión donde existan. Un bloqueador no es tratamiento y puede desactivarse. Importan apoyo y protección financiera.',
    'Signaux d’alerte : chercher à se refaire, cacher les dépenses, emprunter, dépasser ses limites, négliger sommeil, travail ou relations. Vérifier compulsivement les cours malgré les dommages mérite aussi attention. Le trading crypto peut ressembler aux jeux d’argent, sans que tous les traders soient dépendants ; les définitions évoluent.\n\nPas besoin de diagnostic ni de lourdes pertes pour demander de l’aide. Fais une pause, protège l’argent essentiel, parle à un proche. Utilise restrictions ou auto-exclusion si disponibles. Un bloqueur désactivable n’est pas un traitement. Soutien et protections financières comptent.',
    'Warnzeichen sind Verlustjagd, verheimlichte Ausgaben, Schulden, wiederholte Grenzverletzungen und Vernachlässigung von Schlaf, Arbeit oder Beziehungen. Zwanghafte Kurskontrolle trotz Schäden verdient Beachtung. Kryptotrading kann Glücksspielmustern ähneln, doch nicht jeder Trader ist abhängig; Definitionen entwickeln sich weiter.\n\nFür Hilfe braucht es weder Diagnose noch großen Verlust. Zugang pausieren, notwendiges Geld schützen und eine Vertrauensperson einbeziehen. Verfügbare Plattformlimits oder Selbstsperren nutzen. Ein deaktivierbarer App-Blocker ist keine Behandlung. Unterstützung und finanzielle Schutzmaßnahmen zählen.',
    '손실 추격, 지출 숨기기, 빚내기, 반복적인 한도 위반, 수면·일·관계 소홀은 경고 신호입니다. 해를 겪으면서도 가격을 강박적으로 확인하는 것도 주의할 점입니다. 암호화폐 거래는 도박과 비슷한 양상을 보일 수 있지만 모든 거래자가 중독인 것은 아니며 연구 정의도 발전 중입니다.\n\n도움을 요청하는 데 진단이나 큰 손실이 필요하지 않습니다. 접근을 멈추고 생활비를 보호하며 신뢰하는 사람에게 말하세요. 제공되는 플랫폼 제한이나 자기 배제를 이용하세요. 끌 수 있는 앱 차단기는 치료가 아닙니다. 지원과 재정 보호가 중요합니다.',
  ], actions: [
    'If one warning sign feels familiar, share it with a trusted person and choose one protective step today.',
    'Jei bent vienas ženklas pažįstamas, pasidalyk tuo su patikimu žmogumi ir šiandien pasirink vieną apsaugos veiksmą.',
    'Si reconoces una señal, compártela con alguien de confianza y toma una medida hoy.',
    'Si un signe te parle, partage-le avec un proche et choisis une protection aujourd’hui.',
    'Bei einem vertrauten Warnzeichen mit jemandem sprechen und heute einen Schutzschritt wählen.',
    '익숙한 경고 신호가 하나라도 있다면 믿는 사람에게 말하고 오늘 보호 조치 하나를 선택하세요.'
  ], sources: {
    'NHS · Gambling-related harm': nhsGambling,
    'Problematic trading · review': tradingReview
  }),
  EducationArticle(id: 'support', icon: Icons.favorite_border, titles: [
    'Getting help is a strong move',
    'Kreiptis pagalbos yra stiprybė',
    'Pedir ayuda es un paso firme',
    'Demander de l’aide est une force',
    'Hilfe suchen ist ein starker Schritt',
    '도움을 요청하는 것은 강한 선택입니다'
  ], intros: [
    'You deserve support before things become unbearable.',
    'Tu vertas pagalbos dar prieš situacijai tampant nepakeliamai.',
    'Mereces apoyo antes de llegar al límite.',
    'Tu mérites du soutien avant que tout devienne insupportable.',
    'Du verdienst Unterstützung, bevor alles unerträglich wird.',
    '견딜 수 없는 상황이 되기 전에도 도움을 받을 자격이 있습니다.'
  ], bodies: [
    'A primary-care clinician, mental-health professional or gambling-support service can help you understand what is happening and plan care. Tell them about sleep, mood, trading time, debt and any substances used to cope. A trusted person can help you make the first call. Independent debt advice may help with financial harm.\n\nIf you might hurt yourself, cannot stay safe or face a medical emergency, contact your local emergency service now or go to the nearest emergency department. This app does not monitor you or provide crisis support. The NHS link below is a UK resource; use appropriate local services where you live.',
    'Šeimos gydytojas, psichikos sveikatos specialistas ar pagalbos dėl lošimo problemų tarnyba gali padėti suprasti situaciją ir suplanuoti pagalbą. Papasakok apie miegą, nuotaiką, prekybai skirtą laiką, skolas ir medžiagas, kuriomis bandai nusiraminti. Patikimas žmogus gali padėti pirmą kartą paskambinti. Nepriklausoma skolų konsultacija gali padėti spręsti finansinę žalą.\n\nJei gali sau pakenkti, negali užtikrinti savo saugumo ar patiri skubią medicininę būklę, dabar kreipkis į vietinę skubiąją pagalbą arba artimiausią priėmimo skyrių. Programėlė tavęs nestebi ir neteikia krizių pagalbos. NHS nuoroda yra JK šaltinis; rinkis savo šalies paslaugas.',
    'Un médico, profesional de salud mental o servicio de apoyo al juego puede ayudarte a entender la situación y planificar atención. Habla de sueño, ánimo, tiempo operando, deuda y sustancias. Alguien de confianza puede acompañarte en la primera llamada. El asesoramiento independiente sobre deudas también puede ayudar.\n\nSi puedes hacerte daño, no puedes mantenerte a salvo o hay una urgencia médica, contacta ahora los servicios de emergencia locales. Esta app no te monitoriza ni ofrece atención de crisis. El enlace NHS es del Reino Unido; busca servicios de tu país.',
    'Un médecin, professionnel de santé mentale ou service d’aide au jeu peut t’aider à comprendre et préparer les soins. Parle de sommeil, humeur, temps de trading, dettes et substances. Un proche peut accompagner le premier appel. Des conseils indépendants sur les dettes peuvent aussi aider.\n\nSi tu risques de te faire du mal, ne peux rester en sécurité ou as une urgence médicale, contacte immédiatement les secours locaux ou les urgences. L’app ne te surveille pas et n’assure pas de soutien de crise. Le NHS concerne le Royaume-Uni ; utilise les services de ton pays.',
    'Hausarzt, psychotherapeutisches Fachpersonal oder eine Glücksspielberatungsstelle können helfen, die Situation zu verstehen und Versorgung zu planen. Schlaf, Stimmung, Tradingzeit, Schulden und Substanzen offen ansprechen. Eine Vertrauensperson kann beim ersten Anruf helfen. Unabhängige Schuldnerberatung kann finanzielle Schäden angehen.\n\nBei möglicher Selbstverletzung, fehlender Sicherheit oder medizinischem Notfall sofort örtlichen Notruf oder Notaufnahme kontaktieren. Die App überwacht dich nicht und bietet keine Krisenhilfe. Der NHS-Link ist für Großbritannien; passende Dienste vor Ort nutzen.',
    '일차 진료 의사, 정신건강 전문가, 도박 문제 지원 기관은 상황을 이해하고 도움을 계획할 수 있습니다. 수면, 기분, 거래 시간, 빚, 버티기 위해 사용하는 물질에 대해 말하세요. 믿는 사람이 첫 연락을 도울 수 있습니다. 독립적인 채무 상담도 도움이 될 수 있습니다.\n\n자해할 위험이 있거나 안전을 유지할 수 없거나 응급 상황이면 즉시 지역 응급 서비스나 가까운 응급실에 연락하세요. 이 앱은 사용자를 감시하거나 위기 지원을 제공하지 않습니다. 아래 NHS는 영국 자료이므로 거주 국가의 적절한 서비스를 이용하세요.',
  ], actions: [
    'Save the contact of a local support service and tell one trusted person how they can help.',
    'Išsisaugok vietinės pagalbos kontaktą ir pasakyk vienam patikimam žmogui, kaip jis gali padėti.',
    'Guarda un contacto de apoyo local y explica a alguien cómo puede ayudarte.',
    'Enregistre un contact d’aide local et dis à un proche comment t’aider.',
    'Kontakt einer örtlichen Hilfsstelle speichern und einer Vertrauensperson sagen, was hilft.',
    '지역 지원 기관 연락처를 저장하고 믿는 사람에게 어떻게 도울 수 있는지 알려주세요.'
  ], sources: {
    'WHO · Stress': who,
    'NHS · Gambling support (UK)': nhsGambling
  }),
];

class ArticleBody extends StatelessWidget {
  const ArticleBody({super.key, required this.article, required this.locale});
  final EducationArticle article;
  final String locale;
  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(article.intro(locale),
            style: const TextStyle(
                fontSize: 19, height: 1.6, fontWeight: FontWeight.w600)),
        const SizedBox(height: 24),
        Text(article.body(locale),
            style: const TextStyle(fontSize: 16, height: 1.85)),
        const SizedBox(height: 24),
        LuxuryPanel(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(eduText('action', locale),
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
          const SizedBox(height: 12),
          Text(article.action(locale), style: const TextStyle(height: 1.7)),
        ])),
        const SizedBox(height: 24),
        Text(tr('sources', locale),
            style: const TextStyle(fontWeight: FontWeight.w700)),
        for (final source in article.sources.entries)
          TextButton.icon(
              onPressed: () => launchUrl(Uri.parse(source.value),
                  mode: LaunchMode.externalApplication),
              icon: const Icon(Icons.open_in_new, size: 16),
              label: Text(source.key)),
        const SizedBox(height: 16),
        Text(eduText('disclaimer', locale),
            style: const TextStyle(fontSize: 12, height: 1.7)),
      ]);
}
