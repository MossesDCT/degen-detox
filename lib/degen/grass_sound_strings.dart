import 'strings.dart';

String grassSoundText(String key, String locale) => grassSoundWords[key]![
    languages.contains(locale) ? languages.indexOf(locale) : 0];

const grassSoundWords = <String, List<String>>{
  'sound': [
    'Birdsong · 3.2 seconds',
    'Paukščių čiulbėjimas · 3,2 sekundės',
    'Canto de pájaros · 3,2 segundos',
    'Chant d’oiseaux · 3,2 secondes',
    'Vogelgezwitscher · 3,2 Sekunden',
    '새소리 · 3.2초',
  ],
  'hint': [
    'A short birdsong alert with vibration. Uses notification volume, not media volume. Sound and lock-screen visibility depend on your phone settings. Silent and Do Not Disturb modes are respected; a muted or customised notification channel stays under your control.',
    'Trumpas paukščių čiulbėjimas su vibracija. Naudojamas pranešimų, ne medijos garsumas. Garsas ir rodymas užrakintame ekrane priklauso nuo telefono nustatymų. Tylos ir „Netrukdyti“ režimai gerbiami; nutildytą ar pakeistą pranešimų kanalą valdai tu.',
    'Un breve canto de pájaros con vibración. Usa el volumen de notificaciones, no el multimedia. El sonido y la pantalla de bloqueo dependen de tus ajustes. Se respetan Silencio, No molestar y tus cambios al canal.',
    'Un bref chant d’oiseaux avec vibration. Utilise le volume des notifications, pas celui des médias. Le son et l’écran verrouillé dépendent de tes réglages. Les modes silencieux, Ne pas déranger et tes choix de canal sont respectés.',
    'Kurzes Vogelgezwitscher mit Vibration. Nutzt die Benachrichtigungs-, nicht die Medienlautstärke. Ton und Sperrbildschirm hängen von deinen Einstellungen ab. Lautlos, Nicht stören und eigene Kanaleinstellungen werden respektiert.',
    '진동과 함께 짧은 새소리가 울립니다. 미디어가 아닌 알림 음량을 사용합니다. 소리와 잠금 화면 표시는 휴대폰 설정에 따라 달라집니다. 무음, 방해 금지 및 직접 변경한 알림 채널 설정을 존중합니다.',
  ],
  'settings': [
    'Sound & notification settings',
    'Garso ir pranešimo nustatymai',
    'Ajustes de sonido y notificación',
    'Réglages du son et de la notification',
    'Ton- und Benachrichtigungseinstellungen',
    '소리 및 알림 설정',
  ],
  'error': [
    'Could not open settings. Open Android Settings → Apps → Degen Detox → Notifications.',
    'Nepavyko atverti nustatymų. Atverk Android nustatymus → Programos → Degen Detox → Pranešimai.',
    'No se pudieron abrir los ajustes. Ve a Ajustes de Android → Aplicaciones → Degen Detox → Notificaciones.',
    'Impossible d’ouvrir les réglages. Va dans Paramètres Android → Applications → Degen Detox → Notifications.',
    'Einstellungen konnten nicht geöffnet werden. Öffne Android-Einstellungen → Apps → Degen Detox → Benachrichtigungen.',
    '설정을 열 수 없습니다. Android 설정 → 앱 → Degen Detox → 알림으로 이동하세요.',
  ],
};
