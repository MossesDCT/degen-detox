import 'strings.dart';

String strictText(String key, String locale) {
  final i = languages.indexOf(locale);
  return strictWords[key]![i < 0 ? 0 : i];
}

const strictWords = <String, List<String>>{
  'strict': [
    'Strict Morning Shield',
    'Griežta ryto apsauga',
    'Escudo matinal estricto',
    'Bouclier du matin strict',
    'Strenger Morgenschutz',
    '엄격한 아침 보호'
  ],
  'notice': [
    'Once a block starts, this app cannot stop it, shorten it or change its app list until it ends. It ends automatically. Phone, system tools and supported wallets remain available. This is not an unbreakable system lock.',
    'Prasidėjus blokui, šioje programėlėje negalėsi jo sustabdyti, sutrumpinti ar pakeisti programėlių sąrašo iki jo pabaigos. Jis baigsis automatiškai. Telefonas, sistemos įrankiai ir palaikomos piniginės liks pasiekiami. Tai nėra neapeinamas sistemos užraktas.',
    'Una vez iniciado el bloqueo, esta app no permite detenerlo, acortarlo ni cambiar su lista hasta el final. Termina automáticamente. Teléfono, herramientas del sistema y wallets compatibles siguen disponibles. No es un bloqueo del sistema inviolable.',
    'Une fois le blocage commencé, cette app ne permet ni de l’arrêter, le raccourcir ou modifier sa liste avant la fin. Il se termine automatiquement. Téléphone, outils système et portefeuilles compatibles restent accessibles. Ce n’est pas un verrou système inviolable.',
    'Sobald eine Sperre beginnt, lässt sie sich in dieser App bis zum Ende nicht stoppen, verkürzen oder in der App-Auswahl ändern. Sie endet automatisch. Telefon, Systemwerkzeuge und unterstützte Wallets bleiben zugänglich. Keine unüberwindbare Systemsperre.',
    '차단이 시작되면 종료 전까지 이 앱에서 중지, 시간 단축, 앱 목록 변경을 할 수 없습니다. 자동으로 종료됩니다. 전화, 시스템 도구, 지원 지갑은 계속 사용할 수 있습니다. 우회가 불가능한 시스템 잠금은 아닙니다.',
  ],
  'active': [
    'Block active',
    'Blokavimas aktyvus',
    'Bloqueo activo',
    'Blocage actif',
    'Sperre aktiv',
    '차단 중'
  ],
  'ends': [
    'Ends automatically at {time}',
    'Automatiškai baigsis {time}',
    'Termina automáticamente a las {time}',
    'Fin automatique à {time}',
    'Endet automatisch um {time}',
    '{time}에 자동 종료'
  ],
  'remaining': [
    'Remaining · hours : minutes : seconds',
    'Liko · valandos : minutės : sekundės',
    'Restante · horas : minutos : segundos',
    'Restant · heures : minutes : secondes',
    'Verbleibend · Stunden : Minuten : Sekunden',
    '남은 시간 · 시 : 분 : 초'
  ],
  'locked': [
    'The time, duration and app list are locked until this block ends.',
    'Laikas, trukmė ir programėlių sąrašas užrakinti iki šio bloko pabaigos.',
    'Hora, duración y lista de apps quedan bloqueadas hasta el final.',
    'Heure, durée et liste d’apps sont verrouillées jusqu’à la fin.',
    'Zeit, Dauer und App-Liste sind bis zum Ende dieser Sperre gesperrt.',
    '종료까지 시간, 기간, 앱 목록을 변경할 수 없습니다.'
  ],
  'confirm': [
    'Enable strict schedule?',
    'Įjungti griežtą grafiką?',
    '¿Activar horario estricto?',
    'Activer le programme strict ?',
    'Strengen Zeitplan aktivieren?',
    '엄격한 일정 활성화?'
  ],
  'accept': [
    'I understand · enable',
    'Suprantu · įjungti',
    'Entendido · activar',
    'Je comprends · activer',
    'Verstanden · aktivieren',
    '이해했습니다 · 활성화'
  ],
  'checking': [
    'Checking protection…',
    'Tikrinama apsauga…',
    'Comprobando protección…',
    'Vérification de la protection…',
    'Schutz wird geprüft…',
    '보호 상태 확인 중…'
  ],
  'stateError': [
    'Could not verify block status. Editing is unavailable until we can check it.',
    'Nepavyko patikrinti bloko būsenos. Kol jos nepatikrinsime, keitimas negalimas.',
    'No se pudo verificar el estado. No se puede editar hasta comprobarlo.',
    'État du blocage non vérifié. Modification indisponible en attendant.',
    'Sperrstatus konnte nicht geprüft werden. Bearbeitung bleibt bis zur Prüfung gesperrt.',
    '차단 상태를 확인할 수 없습니다. 확인될 때까지 편집할 수 없습니다.'
  ],
  'serviceOff': [
    'The schedule is locked, but the Android blocking service is disconnected.',
    'Grafikas užrakintas, bet Android blokavimo tarnyba neprijungta.',
    'El horario está bloqueado, pero el servicio Android está desconectado.',
    'Programme verrouillé, mais service Android déconnecté.',
    'Zeitplan gesperrt, Android-Blockierdienst nicht verbunden.',
    '일정은 잠겨 있지만 Android 차단 서비스가 연결되지 않았습니다.'
  ],
  'time': [
    'Enter wake-up time',
    'Įvesk pabudimo laiką',
    'Introduce la hora de despertar',
    'Saisis l’heure du réveil',
    'Aufwachzeit eingeben',
    '기상 시간 입력'
  ],
  'hour': ['Hours', 'Valandos', 'Horas', 'Heures', 'Stunden', '시'],
  'minute': ['Minutes', 'Minutės', 'Minutos', 'Minutes', 'Minuten', '분'],
  'invalid': [
    'Enter a valid time.',
    'Įvesk teisingą laiką.',
    'Introduce una hora válida.',
    'Saisis une heure valide.',
    'Gültige Zeit eingeben.',
    '올바른 시간을 입력하세요.'
  ],
  'testReset': [
    'Owner test · reset local Pro',
    'Kūrėjo testas · panaikinti vietinę Pro',
    'Prueba del creador · restablecer Pro local',
    'Test créateur · réinitialiser Pro local',
    'Entwicklertest · lokales Pro zurücksetzen',
    '개발자 테스트 · 로컬 Pro 초기화'
  ],
  'resetBody': [
    'This clears Pro access on this installation only, so you can test a new 500 SKR purchase. It does not refund, cancel or erase the previous on-chain payment. A secure backup of its receipt is kept. Your app list, schedule and check-ins stay intact. Real payment is optional; Restore can recover the existing purchase.',
    'Bus pašalinta tik šioje instaliacijoje saugoma Pro prieiga, kad galėtum išbandyti naują 500 SKR pirkimą. Ankstesnis pervedimas negrąžinamas, neatšaukiamas ir neištrinamas iš blokų grandinės. Saugi kvito kopija išlieka. Programėlių sąrašas, grafikas ir savijautos įrašai lieka. Mokėti nebūtina: „Atkurti pirkimą“ gali grąžinti esamą prieigą.',
    'Solo borra el acceso Pro de esta instalación para probar una nueva compra de 500 SKR. No reembolsa, cancela ni borra el pago anterior en cadena. Se conserva una copia segura del recibo. Lista, horario y registros permanecen. Pagar es opcional; Restaurar recupera la compra existente.',
    'Efface uniquement Pro sur cette installation pour tester un nouvel achat de 500 SKR. Aucun remboursement, annulation ou effacement du paiement en chaîne. Une copie sécurisée du reçu est conservée. Liste, programme et notes restent. Payer est facultatif ; Restaurer récupère l’achat existant.',
    'Entfernt nur den lokalen Pro-Zugang für einen neuen 500-SKR-Testkauf. Keine Erstattung, Stornierung oder Löschung der bisherigen Blockchain-Zahlung. Eine sichere Belegkopie bleibt erhalten. App-Liste, Zeitplan und Einträge bleiben. Eine Zahlung ist optional; Wiederherstellen stellt den Kauf wieder her.',
    '이 설치의 Pro 접근 권한만 초기화하여 새로운 500 SKR 구매를 테스트할 수 있습니다. 이전 온체인 결제는 환불, 취소, 삭제되지 않습니다. 영수증 보안 백업과 앱 목록, 일정, 기록은 유지됩니다. 재결제는 선택 사항이며 구매 복원으로 기존 권한을 되찾을 수 있습니다.',
  ],
  'resetDone': [
    'Local Pro reset. You can now choose 500 SKR in the purchase screen.',
    'Vietinė Pro prieiga pašalinta. Pirkimo lange gali pasirinkti 500 SKR.',
    'Pro local restablecido. Puedes elegir 500 SKR al comprar.',
    'Pro local réinitialisé. Tu peux choisir 500 SKR à l’achat.',
    'Lokales Pro zurückgesetzt. Im Kaufbildschirm kannst du 500 SKR wählen.',
    '로컬 Pro가 초기화되었습니다. 구매 화면에서 500 SKR를 선택할 수 있습니다.'
  ],
  'resetDenied': [
    'Finish or recover the pending payment before resetting.',
    'Prieš atstatydamas užbaik arba atkurk laukiantį mokėjimą.',
    'Finaliza o recupera el pago pendiente antes de restablecer.',
    'Termine ou récupère le paiement en attente avant la réinitialisation.',
    'Ausstehende Zahlung vor dem Zurücksetzen abschließen oder wiederherstellen.',
    '초기화 전에 대기 중인 결제를 완료하거나 복구하세요.'
  ],
};
