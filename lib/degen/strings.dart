import 'purchase_strings.dart';

const languages = ['en', 'lt', 'es', 'fr', 'de', 'ko'];
const languageNames = [
  'English',
  'Lietuvių',
  'Español',
  'Français',
  'Deutsch',
  '한국어'
];

String tr(String key, String locale) {
  final index = languages.indexOf(locale);
  final values = words[key] ?? purchaseWords[key];
  return values == null ? key : values[index < 0 ? 0 : index];
}

// New product copy. Existing recipe ingredients and breathing phase translations
// are reused separately from the disclosed Cortisol Zero v61 baseline.
const words = <String, List<String>>{
  'home': ['Today', 'Šiandien', 'Hoy', 'Aujourd’hui', 'Heute', '오늘'],
  'rituals': ['Rituals', 'Ritualai', 'Rituales', 'Rituels', 'Rituale', '루틴'],
  'learn': ['Learn', 'Žinios', 'Aprender', 'Comprendre', 'Wissen', '배우기'],
  'settings': [
    'Settings',
    'Nustatymai',
    'Ajustes',
    'Réglages',
    'Einstellungen',
    '설정'
  ],
  'headline': [
    'Less bad news, fewer charts, less stress. More life. More you.',
    'Mažiau blogų žinių, grafikų ir streso. Daugiau gyvenimo. Daugiau tavęs.',
    'Menos malas noticias, gráficos y estrés. Más vida. Más tú.',
    'Moins de mauvaises nouvelles, de graphiques et de stress. Plus de vie. Plus de vous.',
    'Weniger schlechte Nachrichten, Charts und Stress. Mehr Leben. Mehr du.',
    '나쁜 뉴스와 차트, 스트레스는 줄이고. 삶은 더 풍요롭게. 나에게 더 집중.'
  ],
  'morning': [
    'Morning Shield',
    'Ryto apsauga',
    'Escudo matinal',
    'Bouclier du matin',
    'Morgenschutz',
    '아침 보호'
  ],
  'morningDesc': [
    'Block selected apps for 1–4 hours after your wake-up time.',
    'Blokuok pasirinktas programėles 1–4 val. nuo pabudimo laiko.',
    'Bloquea apps durante 1–4 horas desde tu hora de despertar.',
    'Bloquez les apps choisies pendant 1 à 4 h après votre réveil.',
    'Ausgewählte Apps ab der Aufwachzeit für 1–4 Stunden sperren.',
    '기상 시간부터 선택한 앱을 1~4시간 차단합니다.'
  ],
  'configure': [
    'Set up blocking',
    'Nustatyti blokavimą',
    'Configurar bloqueo',
    'Configurer le blocage',
    'Sperre einrichten',
    '차단 설정'
  ],
  'wake': [
    'Wake-up time',
    'Pabudimo laikas',
    'Hora de despertar',
    'Heure du réveil',
    'Aufwachzeit',
    '기상 시간'
  ],
  'duration': [
    'Protected hours',
    'Apsaugotos valandos',
    'Horas protegidas',
    'Heures protégées',
    'Geschützte Stunden',
    '보호 시간'
  ],
  'apps': [
    'Apps to pause',
    'Ribojamos programėlės',
    'Apps que pausar',
    'Applications à mettre en pause',
    'Apps pausieren',
    '잠시 멈출 앱'
  ],
  'selectApps': [
    'Choose apps',
    'Pasirink programėles',
    'Elegir apps',
    'Choisir les applications',
    'Apps auswählen',
    '앱 선택'
  ],
  'save': ['Save', 'Išsaugoti', 'Guardar', 'Enregistrer', 'Speichern', '저장'],
  'saved': [
    'Saved',
    'Išsaugota',
    'Guardado',
    'Enregistré',
    'Gespeichert',
    '저장됨'
  ],
  'cancel': ['Cancel', 'Atšaukti', 'Cancelar', 'Annuler', 'Abbrechen', '취소'],
  'close': ['Close', 'Uždaryti', 'Cerrar', 'Fermer', 'Schließen', '닫기'],
  'start': [
    'Start session',
    'Pradėti sesiją',
    'Iniciar sesión',
    'Commencer',
    'Starten',
    '시작'
  ],
  'stop': [
    'End session',
    'Baigti sesiją',
    'Finalizar',
    'Terminer',
    'Beenden',
    '종료'
  ],
  'resume': ['Resume', 'Tęsti', 'Continuar', 'Reprendre', 'Fortsetzen', '계속'],
  'pause': ['Pause', 'Pristabdyti', 'Pausar', 'Pause', 'Pause', '일시 정지'],
  'breathe': [
    'Breathing exercises',
    'Kvėpavimo pratimai',
    'Ejercicios de respiración',
    'Exercices de respiration',
    'Atemübungen',
    '호흡 운동'
  ],
  'breatheDesc': [
    'Guided sessions with a breathing timer.',
    'Pratimai su kvėpavimo ritmo laikmačiu.',
    'Sesiones guiadas con temporizador de respiración.',
    'Séances guidées avec minuteur de respiration.',
    'Angeleitete Übungen mit Atemtimer.',
    '호흡 타이머가 있는 안내 세션.'
  ],
  'free': ['FREE', 'NEMOKAMAI', 'GRATIS', 'GRATUIT', 'KOSTENLOS', '무료'],
  'pro': ['PRO', 'PRO', 'PRO', 'PRO', 'PRO', 'PRO'],
  'skr': [
    'SKR EXCLUSIVE',
    'TIK SU SKR',
    'EXCLUSIVO SKR',
    'EXCLUSIF SKR',
    'SKR-EXKLUSIV',
    'SKR 전용'
  ],
  'grassDesc': [
    'A screen-break reminder every 1–8 hours.',
    'Priminimas atsitraukti nuo ekranų kas 1–8 val.',
    'Un recordatorio para descansar de pantallas cada 1–8 horas.',
    'Un rappel de pause des écrans toutes les 1 à 8 h.',
    'Erinnerung an Bildschirmpausen alle 1–8 Stunden.',
    '1~8시간마다 화면에서 벗어나도록 알림.'
  ],
  'grassBody': [
    'Walk. Notice the light. Meditate, pray, or simply be here. Nothing to chase.',
    'Pasivaikščiok. Pastebėk šviesą. Pamedituok, pasimelsk arba tiesiog pabūk. Nieko vytis nereikia.',
    'Camina. Observa la luz. Medita, reza o simplemente descansa. Nada que perseguir.',
    'Marchez. Observez la lumière. Méditez, priez ou soyez simplement là. Rien à poursuivre.',
    'Geh spazieren. Sieh das Licht. Meditiere, bete oder sei einfach da. Nichts zu jagen.',
    '걸으며 빛을 느껴보세요. 명상하거나 기도하거나 그저 쉬어도 좋아요. 쫓을 것은 없어요.'
  ],
  'interval': [
    'Remind me every',
    'Priminimo intervalas',
    'Recordarme cada',
    'Me rappeler toutes les',
    'Erinnerung alle',
    '알림 간격'
  ],
  'hours': ['hours', 'val.', 'horas', 'heures', 'Std.', '시간'],
  'hour': ['hour', 'val.', 'hora', 'heure', 'Std.', '시간'],
  'preview': [
    'Preview reminder',
    'Peržiūrėti priminimą',
    'Vista previa',
    'Voir le rappel',
    'Vorschau',
    '알림 미리보기'
  ],
  'enable': [
    'Enable reminders',
    'Įjungti priminimus',
    'Activar recordatorios',
    'Activer les rappels',
    'Erinnerungen aktivieren',
    '알림 켜기'
  ],
  'disable': [
    'Disable reminders',
    'Išjungti priminimus',
    'Desactivar recordatorios',
    'Désactiver les rappels',
    'Erinnerungen deaktivieren',
    '알림 끄기'
  ],
  'recipes': ['Recipes', 'Receptai', 'Recetas', 'Recettes', 'Rezepte', '레시피'],
  'recipesDesc': [
    '20 recipes with ingredients and preparation steps.',
    '20 receptų su ingredientais ir gaminimo eiga.',
    '20 recetas con ingredientes y preparación.',
    '20 recettes avec ingrédients et étapes.',
    '20 Rezepte mit Zutaten und Zubereitung.',
    '재료와 조리 과정이 포함된 레시피 20개.'
  ],
  'foodNote': [
    'Balanced meals support general wellbeing. No individual recipe is proven to lower your blood cortisol. Check ingredients for allergies; adapt to your medical needs.',
    'Subalansuota mityba palaiko bendrą savijautą. Neįrodyta, kad konkretus receptas mažina tavo kraujo kortizolį. Patikrink alergenus ir atsižvelk į sveikatos poreikius.',
    'Una dieta equilibrada favorece el bienestar. Ninguna receta garantiza reducir el cortisol en sangre. Revisa alérgenos y necesidades médicas.',
    'Une alimentation équilibrée soutient le bien-être. Aucune recette ne garantit une baisse du cortisol sanguin. Vérifiez les allergènes et vos besoins médicaux.',
    'Ausgewogene Ernährung unterstützt das Wohlbefinden. Kein Rezept senkt nachweislich deinen Blutkortisolwert. Beachte Allergien und medizinische Bedürfnisse.',
    '균형 잡힌 식사는 전반적인 건강을 돕습니다. 특정 레시피가 혈중 코르티솔을 낮춘다는 보장은 없습니다. 알레르기와 건강 상태를 확인하세요.'
  ],
  'ingredients': [
    'Ingredients',
    'Ingredientai',
    'Ingredientes',
    'Ingrédients',
    'Zutaten',
    '재료'
  ],
  'method': [
    'Method',
    'Gaminimas',
    'Preparación',
    'Préparation',
    'Zubereitung',
    '만드는 법'
  ],
  'servings': [
    'Servings',
    'Porcijos',
    'Raciones',
    'Portions',
    'Portionen',
    '인분'
  ],
  'impulse': [
    'Impulse Check',
    'Impulso patikra',
    'Pausa al impulso',
    'Pause avant l’impulsion',
    'Impuls-Check',
    '충동 점검'
  ],
  'impulseDesc': [
    'Record your mood and urge to trade.',
    'Užrašyk savijautą ir norą prekiauti.',
    'Registra tu estado de ánimo y ganas de operar.',
    'Notez votre humeur et votre envie de trader.',
    'Stimmung und Handelsdrang festhalten.',
    '기분과 거래 충동을 기록하세요.'
  ],
  'urge': [
    'How strong is the urge to check the market?',
    'Koks stiprus noras tikrinti rinką?',
    '¿Qué intensidad tiene el impulso de mirar el mercado?',
    'Quelle est votre envie de consulter le marché ?',
    'Wie stark ist der Drang, den Markt zu prüfen?',
    '시장을 확인하고 싶은 충동은 얼마나 강한가요?'
  ],
  'low': ['Low', 'Silpnas', 'Bajo', 'Faible', 'Gering', '약함'],
  'high': ['Strong', 'Stiprus', 'Fuerte', 'Forte', 'Stark', '강함'],
  'note': [
    'What triggered it? (optional)',
    'Kas tai sukėlė? (nebūtina)',
    '¿Qué lo provocó? (opcional)',
    'Quel déclencheur ? (facultatif)',
    'Was war der Auslöser? (optional)',
    '계기가 무엇인가요? (선택)'
  ],
  'logged': [
    'Check-in saved on this device. This is reflection, not a diagnosis.',
    'Savistaba išsaugota šiame įrenginyje. Tai nėra diagnozė.',
    'Registro guardado en este dispositivo. No es un diagnóstico.',
    'Note enregistrée sur cet appareil. Ce n’est pas un diagnostic.',
    'Auf diesem Gerät gespeichert. Keine Diagnose.',
    '이 기기에 기록했습니다. 진단이 아닌 자기 성찰입니다.'
  ],
  'checkins': [
    'Check-ins',
    'Savistabos',
    'Registros',
    'Bilans',
    'Check-ins',
    '마음 기록'
  ],
  'wind': [
    'Trading Wind-down',
    'Vakaro atsitraukimas',
    'Cierre del día',
    'Déconnexion du soir',
    'Trading-Feierabend',
    '트레이딩 마무리'
  ],
  'windDesc': [
    'Finish your trading session with three steps and an optional fourth of your own.',
    'Užbaik prekybos sesiją trimis žingsniais ir, jei nori, pridėk savo ketvirtą.',
    'Termina tu sesión con tres pasos y un cuarto opcional creado por ti.',
    'Termine ta séance en trois étapes et ajoute, si tu le souhaites, une quatrième personnelle.',
    'Beende deine Sitzung mit drei Schritten und optional einem eigenen vierten.',
    '세 단계로 거래 세션을 마치고, 원하면 나만의 네 번째 단계를 추가하세요.'
  ],
  'wind1': [
    'Review your own risk plan before stepping away.',
    'Prieš atsitraukdamas peržiūrėk savo rizikos planą.',
    'Revisa tu plan de riesgo antes de desconectar.',
    'Relisez votre plan de risque avant de partir.',
    'Prüfe deinen eigenen Risikoplan vor der Pause.',
    '쉬기 전에 자신의 위험 관리 계획을 확인하세요.'
  ],
  'wind2': [
    'Choose tomorrow’s first market-check time.',
    'Pasirink rytojaus pirmą rinkos tikrinimo laiką.',
    'Elige cuándo mirarás el mercado mañana.',
    'Choisissez l’heure de consultation de demain.',
    'Lege den ersten Marktcheck für morgen fest.',
    '내일 처음 시장을 확인할 시간을 정하세요.'
  ],
  'wind3': [
    'Put the phone aside. Take five easy breaths.',
    'Padėk telefoną. Penkis kartus ramiai įkvėpk.',
    'Aparta el móvil. Respira cinco veces con calma.',
    'Posez le téléphone. Respirez calmement cinq fois.',
    'Leg das Handy weg. Atme fünfmal ruhig.',
    '휴대폰을 내려놓고 편하게 다섯 번 호흡하세요.'
  ],
  'complete': [
    'Ritual complete',
    'Ritualas baigtas',
    'Ritual completado',
    'Rituel terminé',
    'Ritual abgeschlossen',
    '루틴 완료'
  ],
  'proTitle': [
    'Lifetime Pro',
    'Pro visam laikui',
    'Pro de por vida',
    'Pro à vie',
    'Pro auf Lebenszeit',
    '평생 Pro'
  ],
  'paySol': [
    'Pro with SOL',
    'Pro su SOL',
    'Pro con SOL',
    'Pro avec SOL',
    'Pro mit SOL',
    'SOL로 Pro'
  ],
  'paySkr': [
    'Pro with SKR',
    'Pro su SKR',
    'Pro con SKR',
    'Pro avec SKR',
    'Pro mit SKR',
    'SKR로 Pro'
  ],
  'paymentsPending': [
    'Payments are not enabled in this build. No funds will be requested. Price, wallet connection and server verification are pending integration.',
    'Šioje versijoje mokėjimai neįjungti. Pinigų neprašoma. Kaina, piniginės prijungimas ir serverio patikra dar integruojami.',
    'Los pagos no están activos. No se solicitarán fondos. Precio, cartera y verificación del servidor pendientes.',
    'Les paiements ne sont pas actifs. Aucun fonds ne sera demandé. Prix, portefeuille et vérification serveur à intégrer.',
    'Zahlungen sind noch nicht aktiv. Es werden keine Mittel angefordert. Preis, Wallet und Serverprüfung folgen.',
    '이 버전에서는 결제할 수 없습니다. 자금을 요청하지 않습니다. 가격, 지갑 연결, 서버 검증은 구현 예정입니다.'
  ],
  'demo': [
    'Explore Pro preview',
    'Išbandyti Pro peržiūrą',
    'Explorar vista previa Pro',
    'Explorer l’aperçu Pro',
    'Pro-Vorschau erkunden',
    'Pro 미리보기'
  ],
  'demoNote': [
    'Design preview only. Not a purchase or a license. Native controls remain disabled.',
    'Tik dizaino peržiūra. Tai ne pirkimas ir ne licencija. Natyvios funkcijos neaktyvinamos.',
    'Solo vista previa. No es una compra ni licencia. Los controles nativos siguen desactivados.',
    'Aperçu uniquement. Aucun achat ni licence. Fonctions natives désactivées.',
    'Nur Vorschau, kein Kauf und keine Lizenz. Native Funktionen bleiben deaktiviert.',
    '디자인 미리보기입니다. 구매나 라이선스가 아닙니다. 기기 기능은 활성화되지 않습니다.'
  ],
  'previewMode': [
    'PREVIEW',
    'PERŽIŪRA',
    'VISTA PREVIA',
    'APERÇU',
    'VORSCHAU',
    '미리보기'
  ],
  'endPreview': [
    'Exit Pro preview',
    'Baigti Pro peržiūrą',
    'Salir de vista previa',
    'Quitter l’aperçu Pro',
    'Pro-Vorschau beenden',
    'Pro 미리보기 종료'
  ],
  'androidOnly': [
    'Actual app blocking requires the Android build, a verified Pro license and your explicit permissions. This preview changes settings only.',
    'Tikram blokavimui reikia Android versijos, patvirtintos Pro licencijos ir tavo suteiktų leidimų. Peržiūroje keičiasi tik nustatymai.',
    'El bloqueo real requiere Android, licencia Pro verificada y permisos. Aquí solo se configuran ajustes.',
    'Le blocage réel nécessite Android, une licence Pro vérifiée et vos autorisations. Cet aperçu règle seulement les paramètres.',
    'Echtes Blockieren benötigt Android, verifizierte Pro-Lizenz und Berechtigungen. Hier werden nur Einstellungen gezeigt.',
    '실제 차단에는 Android 앱, 검증된 Pro 라이선스, 명시적 권한이 필요합니다. 여기서는 설정만 변경됩니다.'
  ],
  'reminderNote': [
    'In Android, a sound notification opens this animation when tapped. Automatic full-screen takeover is not promised. Browser previews do not schedule background alarms.',
    'Android versijoje garsinis pranešimas atvers animaciją jį palietus. Automatinio ekrano perėmimo nežadame. Naršyklės peržiūra foninių priminimų neplanuoja.',
    'En Android, una notificación sonora abre la animación al tocarla. No se garantiza pantalla completa automática. La vista web no programa alarmas.',
    'Sur Android, touchez la notification sonore pour voir l’animation. Pas de plein écran automatique garanti. Pas d’alarmes en arrière-plan sur le web.',
    'Unter Android öffnet Antippen der Tonbenachrichtigung die Animation. Kein automatischer Vollbildmodus garantiert. Keine Hintergrundalarme in der Webvorschau.',
    'Android에서 소리 알림을 누르면 애니메이션이 열립니다. 자동 전체 화면은 보장하지 않습니다. 웹 미리보기는 백그라운드 알림을 예약하지 않습니다.'
  ],
  'safety': [
    'Breathe gently, never force or hold beyond comfort. Stop if dizzy or uncomfortable.',
    'Kvėpuok švelniai, neversk savęs sulaikyti kvėpavimo. Jei svaigsta galva ar nemalonu, sustok.',
    'Respira suavemente, sin forzar ni retener más de lo cómodo. Detente si te mareas.',
    'Respirez doucement, sans forcer ni retenir au-delà du confort. Arrêtez en cas de vertige.',
    'Atme sanft, ohne Zwang oder unangenehmes Anhalten. Bei Schwindel aufhören.',
    '무리하지 말고 편안하게 호흡하세요. 어지럽거나 불편하면 멈추세요.'
  ],
  'language': ['Language', 'Kalba', 'Idioma', 'Langue', 'Sprache', '언어'],
  'appearance': [
    'Light appearance',
    'Šviesi tema',
    'Tema claro',
    'Thème clair',
    'Helles Design',
    '밝은 테마'
  ],
  'privacy': [
    'Privacy & safety',
    'Privatumas ir sauga',
    'Privacidad y seguridad',
    'Confidentialité et sécurité',
    'Datenschutz & Sicherheit',
    '개인정보와 안전'
  ],
  'privacyBody': [
    'Check-ins stay on your device. This preview stores nothing after reload. Degen Detox does not measure cortisol, diagnose addiction, execute trades or provide financial advice. No analytics are enabled.',
    'Savistaba lieka tavo įrenginyje. Perkrovus šią peržiūrą duomenys dingsta. Degen Detox nematuoja kortizolio, nediagnozuoja priklausomybės, neatlieka sandorių ir neteikia finansinių patarimų. Analitika neįjungta.',
    'Tus registros son locales. Esta vista no conserva datos tras recargar. No medimos cortisol, diagnosticamos adicciones, ejecutamos operaciones ni damos asesoría financiera. Sin analíticas.',
    'Vos bilans restent locaux. L’aperçu ne conserve rien après rechargement. Aucun dosage de cortisol, diagnostic, trading ou conseil financier. Aucune analyse d’usage.',
    'Check-ins bleiben lokal. Die Vorschau speichert nach Neuladen nichts. Keine Kortisolmessung, Diagnose, Trades oder Finanzberatung. Keine Analyse aktiv.',
    '기록은 기기에 보관됩니다. 미리보기는 새로고침하면 초기화됩니다. 코르티솔 측정, 중독 진단, 거래 실행, 금융 조언을 제공하지 않으며 분석 수집은 없습니다.'
  ],
  'delete': [
    'Delete local check-ins',
    'Ištrinti vietines savistabas',
    'Borrar registros locales',
    'Effacer les bilans locaux',
    'Lokale Check-ins löschen',
    '기기 기록 삭제'
  ],
  'deleteAsk': [
    'Delete all your check-ins on this device? This cannot be undone.',
    'Ištrinti visas savistabas šiame įrenginyje? Atkurti nebus galima.',
    '¿Borrar todos los registros de este dispositivo? No se puede deshacer.',
    'Effacer tous les bilans sur cet appareil ? Action irréversible.',
    'Alle Check-ins auf diesem Gerät löschen? Nicht rückgängig zu machen.',
    '이 기기의 기록을 모두 삭제할까요? 되돌릴 수 없습니다.'
  ],
  'sources': [
    'Read the evidence',
    'Skaityti šaltinį',
    'Consultar evidencia',
    'Lire la source',
    'Quelle lesen',
    '근거 보기'
  ],
  'learnIntro': [
    '8 guides to stress, screen use and trading habits.',
    '8 temos apie stresą, ekranus ir prekybos įpročius.',
    '8 guías sobre estrés, pantallas y hábitos de trading.',
    '8 guides sur le stress, les écrans et le trading.',
    '8 Ratgeber zu Stress, Bildschirmen und Handelsgewohnheiten.',
    '스트레스, 화면 사용, 거래 습관에 관한 가이드 8개.'
  ],
  'cortisolTitle': [
    'Cortisol is not the enemy',
    'Kortizolis nėra priešas',
    'El cortisol no es el enemigo',
    'Le cortisol n’est pas l’ennemi',
    'Kortisol ist nicht der Feind',
    '코르티솔은 적이 아니에요'
  ],
  'cortisolBody': [
    'Cortisol supports metabolism, blood pressure and the stress response. It normally follows a daily rhythm, with higher levels around waking. The goal is not zero cortisol. Persistent symptoms deserve a clinician’s assessment; an app cannot infer hormone levels from mood.',
    'Kortizolis palaiko medžiagų apykaitą, kraujospūdį ir streso reakciją. Jo lygis natūraliai kinta per parą ir paprastai būna aukštesnis ryte. Tikslas nėra nulinis kortizolis. Dėl užsitęsusių simptomų kreipkis į gydytoją; iš nuotaikos programėlė hormonų lygio nenustato.',
    'El cortisol ayuda al metabolismo, la presión arterial y la respuesta al estrés. Tiene un ritmo diario y suele ser más alto al despertar. El objetivo no es eliminarlo. Los síntomas persistentes necesitan valoración médica; el estado de ánimo no mide hormonas.',
    'Le cortisol soutient le métabolisme, la pression artérielle et la réponse au stress. Son rythme quotidien est généralement plus élevé au réveil. Le but n’est pas zéro cortisol. Des symptômes persistants nécessitent un avis médical ; l’humeur ne mesure pas les hormones.',
    'Kortisol unterstützt Stoffwechsel, Blutdruck und Stressreaktion. Es folgt einem Tagesrhythmus und ist morgens meist höher. Das Ziel ist nicht null Kortisol. Anhaltende Beschwerden gehören ärztlich abgeklärt; Stimmung misst keine Hormone.',
    '코르티솔은 대사, 혈압, 스트레스 반응에 필요합니다. 하루 주기에 따라 변하며 보통 기상 무렵 높습니다. 코르티솔을 없애는 것이 목표가 아닙니다. 지속적인 증상은 의사와 상담하세요. 기분만으로 호르몬 수치를 알 수 없습니다.'
  ],
  'tradingTitle': [
    'When checking becomes chasing',
    'Kai tikrinimas virsta vaikymusi',
    'Cuando mirar se convierte en perseguir',
    'Quand consulter devient poursuivre',
    'Wenn Prüfen zum Hinterherjagen wird',
    '확인이 추격이 될 때'
  ],
  'tradingBody': [
    'Research links intensive speculative trading with problem-gambling symptoms in some people. Association does not mean every trader has an addiction. Warning signs include chasing losses, spending beyond your plan, disrupted sleep and hiding your activity.',
    'Tyrimai sieja intensyvią spekuliacinę prekybą su probleminio lošimo simptomais kai kuriems žmonėms. Tai nereiškia, kad kiekvienas treideris priklausomas. Įspėjamieji ženklai: nuostolių atsilošinėjimas, plano viršijimas, sutrikęs miegas ir veiklos slėpimas.',
    'Los estudios relacionan el trading especulativo intenso con síntomas de juego problemático en algunas personas. No significa que todo trader tenga adicción. Señales: perseguir pérdidas, superar límites, perder sueño u ocultar la actividad.',
    'Des études associent le trading spéculatif intense à des symptômes de jeu problématique chez certaines personnes. Tous les traders ne sont pas dépendants. Signaux : poursuivre les pertes, dépasser ses limites, perdre le sommeil ou cacher son activité.',
    'Studien verbinden intensives spekulatives Trading bei manchen Menschen mit problematischem Glücksspiel. Nicht jeder Trader ist abhängig. Warnzeichen: Verlusten nachjagen, Limits überschreiten, Schlafprobleme und Verheimlichen.',
    '연구에서는 일부 사람의 강도 높은 투기 거래와 문제 도박 증상의 관련성을 보고합니다. 모든 트레이더가 중독이라는 뜻은 아닙니다. 손실 만회 집착, 계획 초과 지출, 수면 방해, 활동 숨기기는 주의 신호입니다.'
  ],
  'helpTitle': [
    'A pause is not always enough',
    'Kartais vien pertraukos neužtenka',
    'A veces una pausa no basta',
    'Une pause ne suffit pas toujours',
    'Eine Pause reicht nicht immer',
    '잠깐 쉬는 것만으로 부족할 때'
  ],
  'helpBody': [
    'If trading is harming your finances, relationships or mental health, speak with a qualified mental-health professional or local gambling-harm service. Tell someone you trust. If you are in immediate danger, contact local emergency services. This app is not treatment.',
    'Jei prekyba kenkia finansams, santykiams ar psichikos sveikatai, kreipkis į psichikos sveikatos specialistą arba pagalbos dėl lošimų tarnybą. Pasikalbėk su patikimu žmogumi. Esant tiesioginiam pavojui skambink vietos skubios pagalbos tarnyboms. Ši programėlė nėra gydymas.',
    'Si el trading daña tus finanzas, relaciones o salud mental, busca un profesional o servicio local de ayuda por juego. Habla con alguien de confianza. Ante peligro inmediato contacta emergencias. Esta app no es tratamiento.',
    'Si le trading nuit à vos finances, relations ou santé mentale, consultez un professionnel ou un service d’aide au jeu. Parlez à une personne de confiance. En danger immédiat, contactez les urgences. Cette app n’est pas un traitement.',
    'Schadet Trading deinen Finanzen, Beziehungen oder deiner Psyche, wende dich an Fachpersonal oder eine örtliche Glücksspielsuchtberatung. Sprich mit einer Vertrauensperson. Bei akuter Gefahr den Notdienst rufen. Diese App ist keine Behandlung.',
    '거래가 재정, 관계, 정신건강을 해친다면 전문가나 지역 도박문제 지원기관에 상담하세요. 믿을 수 있는 사람에게 이야기하세요. 즉각적인 위험이 있으면 응급기관에 연락하세요. 이 앱은 치료가 아닙니다.'
  ],
  'breathTitle': [
    'Make room for a slower breath',
    'Suteik erdvės lėtesniam kvėpavimui',
    'Haz espacio para respirar despacio',
    'Laissez place à une respiration lente',
    'Raum für einen ruhigeren Atem',
    '천천히 호흡할 여유'
  ],
  'breathBody': [
    'Gentle breathing exercises can help with stress. Sit comfortably and breathe without forcing. Use a pace that feels easy; stop if you feel dizzy. Regular practice matters more than a perfect count.',
    'Švelnūs kvėpavimo pratimai gali padėti patiriant stresą. Patogiai atsisėsk ir kvėpuok be prievartos. Pasirink patogų tempą; svaigstant galvai sustok. Reguliarumas svarbiau už tobulą skaičiavimą.',
    'La respiración suave puede ayudar con el estrés. Siéntate cómodo y no fuerces. Elige un ritmo fácil y detente si te mareas. La práctica regular importa más que una cuenta perfecta.',
    'Une respiration douce peut aider face au stress. Asseyez-vous confortablement sans forcer. Choisissez un rythme facile, arrêtez en cas de vertige. La régularité compte plus que le décompte parfait.',
    'Sanfte Atemübungen können bei Stress helfen. Sitze bequem und atme ohne Zwang. Wähle ein leichtes Tempo und höre bei Schwindel auf. Regelmäßigkeit zählt mehr als perfektes Zählen.',
    '부드러운 호흡은 스트레스 완화에 도움이 될 수 있습니다. 편하게 앉아 무리하지 마세요. 편한 속도로 호흡하고 어지러우면 멈추세요. 완벽한 숫자보다 꾸준한 연습이 중요합니다.'
  ],
  'back': ['Back', 'Atgal', 'Atrás', 'Retour', 'Zurück', '뒤로'],
  'empty': [
    'No check-ins saved yet.',
    'Išsaugotų savistabų dar nėra.',
    'Aún no hay registros guardados.',
    'Aucun bilan enregistré.',
    'Noch keine Check-ins gespeichert.',
    '아직 저장된 기록이 없습니다.'
  ],
  'ready': [
    'A moment for yourself',
    'Akimirka sau',
    'Un momento para ti',
    'Un moment pour vous',
    'Ein Moment für dich',
    '나를 위한 순간'
  ],
};
