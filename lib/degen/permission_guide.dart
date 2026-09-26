import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../features/pro/app_blocker/data/app_blocker_service.dart';
import 'strings.dart';
import 'luxury.dart';

String guideText(String key, String locale) {
  final i = languages.indexOf(locale);
  return guideWords[key]![i < 0 ? 0 : i];
}

const guideWords = <String, List<String>>{
  'intro': [
    'Enable Accessibility to detect selected apps and return to Home during protected hours. This is sensitive permission. Our blocker does not retrieve screen content, messages or passwords. Active blocks end automatically; Android permissions remain under your control.',
    'Įjunk pritaikymo neįgaliesiems tarnybą, kad atpažintume pasirinktas programėles ir apsaugos valandomis grąžintume į pagrindinį ekraną. Tai jautrus leidimas. Blokatorius neskaito ekrano turinio, žinučių ar slaptažodžių. Aktyvus blokas baigiasi automatiškai; Android leidimų kontrolė lieka tavo rankose.',
    'Activa Accesibilidad para detectar apps elegidas y volver al inicio durante horas protegidas. Es un permiso sensible. No obtenemos contenido de pantalla, mensajes ni contraseñas. El bloqueo activo termina automáticamente; controlas los permisos de Android.',
    'Active l’accessibilité pour détecter les apps choisies et revenir à l’accueil aux heures protégées. Autorisation sensible : aucun écran, message ou mot de passe lu. Le blocage actif se termine automatiquement ; tu gardes le contrôle des autorisations Android.',
    'Bedienungshilfen erkennen ausgewählte Apps und führen während der Schutzzeiten zum Startbildschirm. Sensible Berechtigung: keine Bildschirminhalte, Nachrichten oder Passwörter gelesen. Aktive Sperren enden automatisch; Android-Berechtigungen bleiben unter deiner Kontrolle.',
    '접근성은 선택한 앱을 감지하고 보호 시간에 홈 화면으로 돌아갑니다. 민감한 권한이며 화면 내용, 메시지, 비밀번호를 읽지 않습니다. 활성 차단은 자동 종료되며 Android 권한은 사용자가 제어합니다.',
  ],
  'helpButton': [
    'Access denied or setting restricted?',
    'Rodo „Prieiga nesuteikta“ ar apribojimą?',
    '¿Acceso denegado o ajuste restringido?',
    'Accès refusé ou paramètre restreint ?',
    'Zugriff verweigert oder Einstellung eingeschränkt?',
    '액세스가 거부되거나 설정이 제한되나요?'
  ],
  'stepInfo': [
    'Allow the Android setting',
    'Leisk Android nustatymą',
    'Permite el ajuste de Android',
    'Autorise le réglage Android',
    'Android-Einstellung zulassen',
    'Android 설정 허용'
  ],
  'stepEnable': [
    'Now enable the blocker',
    'Dabar įjunk blokatorių',
    'Ahora activa el bloqueador',
    'Active maintenant le bloqueur',
    'Jetzt den Blocker aktivieren',
    '이제 차단기 켜기'
  ],
  'findMenu': [
    'The button opens Degen Detox’s App info directly. Find ⋮ in the top-right corner.',
    'Mygtukas atvers būtent Degen Detox programos informaciją. Viršutiniame dešiniajame kampe surask ⋮.',
    'El botón abre directamente la información de Degen Detox. Busca ⋮ arriba a la derecha.',
    'Le bouton ouvre directement les infos de Degen Detox. Repère ⋮ en haut à droite.',
    'Die Schaltfläche öffnet direkt die App-Info von Degen Detox. Suche oben rechts nach ⋮.',
    '버튼을 누르면 Degen Detox 앱 정보가 바로 열립니다. 오른쪽 위의 ⋮를 찾으세요.',
  ],
  'allowMenu': [
    'Tap “Allow restricted settings”, if offered, and confirm your device lock.',
    'Paspausk „Leisti apribotus nustatymus“, jei toks punktas yra, ir patvirtink telefono atrakinimu.',
    'Pulsa “Permitir ajustes restringidos”, si aparece, y confirma el bloqueo del teléfono.',
    'Choisis « Autoriser les paramètres restreints », si proposé, et confirme le verrouillage.',
    'Tippe auf „Eingeschränkte Einstellungen zulassen“, falls angeboten, und bestätige die Gerätesperre.',
    '표시되는 경우 “제한된 설정 허용”을 누르고 기기 잠금을 확인하세요.',
  ],
  'returnStep': [
    'Return here using Android Back. Then open the blocker settings and enable Degen Detox.',
    'Telefono mygtuku „Atgal“ grįžk čia. Tada atverk blokatoriaus nustatymus ir įjunk Degen Detox.',
    'Vuelve aquí con Atrás. Después abre los ajustes del bloqueador y activa Degen Detox.',
    'Reviens ici avec Retour, puis ouvre les réglages du bloqueur et active Degen Detox.',
    'Kehre mit Zurück hierher zurück. Öffne dann die Blocker-Einstellungen und aktiviere Degen Detox.',
    '뒤로 버튼으로 돌아오세요. 차단기 설정을 열고 Degen Detox를 켜세요.',
  ],
  'enableHint': [
    'Turn on Degen Detox in the next screen and confirm Android’s message. If a list opens, choose Degen Detox. Return here; we check automatically.',
    'Kitame ekrane įjunk Degen Detox ir patvirtink Android pranešimą. Jei atsivers sąrašas, pasirink Degen Detox. Grįžus leidimą patikrinsime automatiškai.',
    'Activa Degen Detox y confirma el aviso de Android. Si aparece una lista, elige Degen Detox. Al volver lo comprobaremos automáticamente.',
    'Active Degen Detox et confirme le message Android. Si une liste s’ouvre, choisis Degen Detox. Nous vérifierons automatiquement à ton retour.',
    'Aktiviere Degen Detox und bestätige den Android-Hinweis. Falls eine Liste erscheint, wähle Degen Detox. Bei deiner Rückkehr prüfen wir automatisch.',
    '다음 화면에서 Degen Detox를 켜고 Android 안내를 확인하세요. 목록이 열리면 Degen Detox를 선택하세요. 돌아오면 자동으로 확인합니다.',
  ],
  'safeHelp': [
    'Only continue if you trust this app. If the option is missing, consult the Android guide below. Do not disable Play Protect or bypass device policy.',
    'Tęsk tik jei pasitiki šia programėle. Jei tokio punkto nėra, žr. Android pagalbą žemiau. Neišjunk Play Protect ir neapeik įrenginio politikos.',
    'Continúa solo si confías en la app. Si falta la opción, consulta la guía Android. No desactives Play Protect ni eludas políticas.',
    'Continue uniquement si tu fais confiance à l’app. Si l’option manque, consulte le guide Android. Ne désactive pas Play Protect et ne contourne pas les règles.',
    'Nur fortfahren, wenn du der App vertraust. Fehlt die Option, nutze die Android-Hilfe. Play Protect nicht deaktivieren und keine Richtlinien umgehen.',
    '앱을 신뢰할 때만 진행하세요. 옵션이 없으면 아래 Android 도움말을 확인하세요. Play Protect를 끄거나 기기 정책을 우회하지 마세요.',
  ],
  'details': [
    'How it works and your control',
    'Kaip veikia ir ką valdai tu',
    'Cómo funciona y tu control',
    'Fonctionnement et ton contrôle',
    'Funktionsweise und deine Kontrolle',
    '작동 방식과 사용자 제어'
  ],
  'done': ['Done', 'Baigta', 'Listo', 'Terminé', 'Fertig', '완료'],
  'purposeShort': [
    'Check Android protection before purchasing Pro.',
    'Patikrink Android leidimus prieš įsigydamas Pro.',
    'Comprueba la protección de Android antes de comprar Pro.',
    'Vérifie les autorisations Android avant d’acheter Pro.',
    'Prüfe den Android-Schutz vor dem Pro-Kauf.',
    'Pro 구매 전에 Android 보호 권한을 확인하세요.',
  ],
  'purpose': [
    'Accessibility is used only to detect which app opens and return you to the home screen when that app is on your own block list during your chosen hours. This is a sensitive permission. Our service does not retrieve screen contents, type, read passwords, messages or seed phrases. No screenshot or keystroke recording.',
    'Pritaikymo neįgaliesiems leidimas naudojamas tik atpažinti atidarytą programėlę ir grąžinti į pagrindinį ekraną, kai ji yra tavo pasirinktame blokavimo sąraše tavo nustatytomis valandomis. Tai jautrus leidimas. Mūsų tarnyba nenuskaito ekrano turinio, nerašo už tave, neskaito slaptažodžių, žinučių ar piniginės atkūrimo frazių. Ekrano vaizdai ir klavišų paspaudimai neįrašomi.',
    'Accesibilidad solo detecta qué app se abre y te devuelve al inicio si está en tu lista durante el horario elegido. Es un permiso sensible. Nuestro servicio no obtiene el contenido de la pantalla, escribe, lee contraseñas, mensajes ni frases semilla. No graba pantallas ni pulsaciones.',
    'L’accessibilité sert uniquement à reconnaître l’app ouverte et à revenir à l’accueil si tu l’as bloquée pendant les horaires choisis. Cette autorisation est sensible. Notre service ne récupère pas le contenu de l’écran, ne saisit rien et ne lit ni mots de passe, messages ou phrases de récupération. Aucun enregistrement de l’écran ou des frappes.',
    'Bedienungshilfen erkennen nur die geöffnete App und führen zum Startbildschirm zurück, wenn sie zu deinen gewählten Zeiten gesperrt ist. Diese Berechtigung ist sensibel. Unser Dienst liest keine Bildschirminhalte, Passwörter, Nachrichten oder Seed-Phrasen und gibt nichts ein. Keine Bildschirm- oder Tastaturaufzeichnung.',
    '접근성은 열린 앱을 감지하고, 선택한 시간에 차단 목록에 있는 앱이면 홈 화면으로 돌아가는 데만 사용합니다. 민감한 권한입니다. 서비스는 화면 내용, 비밀번호, 메시지, 복구 구문을 읽거나 대신 입력하지 않습니다. 화면이나 키 입력을 기록하지 않습니다.',
  ],
  'restricted': [
    'If Android says “Access denied” or “Restricted setting”: open App info below, then ⋮ → Allow restricted settings, if offered. Confirm your device lock, return here, then open Accessibility → Installed/downloaded apps → Degen Detox → enable. Menu names vary by Android version. Only continue if you trust this app. Do not disable Play Protect. If the option is missing or blocked by device policy, do not bypass it.',
    'Jei Android rodo „Programai prieiga nesuteikta“ arba „Apribotas nustatymas“: žemiau atidaryk programos informaciją, tada ⋮ → „Leisti apribotus nustatymus“, jei toks punktas yra. Patvirtink telefono užraktą, grįžk čia ir atverk Pritaikymas neįgaliesiems → Įdiegtos / atsisiųstos programos → Degen Detox → įjungti. Meniu pavadinimai gali skirtis. Tęsk tik jei pasitiki šia programėle. Neišjunk Play Protect. Jei pasirinkimo nėra arba jį riboja įrenginio politika, nebandyk to apeiti.',
    'Si Android muestra “Acceso denegado” o “Ajuste restringido”: abre Información de la app, luego ⋮ → Permitir ajustes restringidos, si aparece. Confirma el bloqueo del teléfono, vuelve aquí y abre Accesibilidad → Apps instaladas/descargadas → Degen Detox → activar. Los nombres varían. Continúa solo si confías en la app. No desactives Play Protect ni eludas políticas del dispositivo.',
    'Si Android indique « Accès refusé » ou « Paramètre restreint » : ouvre Infos sur l’application, puis ⋮ → Autoriser les paramètres restreints, si proposé. Confirme le verrouillage du téléphone, reviens ici, puis Accessibilité → Applications installées/téléchargées → Degen Detox → activer. Les menus varient. Continue uniquement si tu fais confiance à cette app. Ne désactive pas Play Protect et ne contourne pas les règles de l’appareil.',
    'Bei „Zugriff verweigert“ oder „Eingeschränkte Einstellung“: App-Info öffnen, dann ⋮ → Eingeschränkte Einstellungen zulassen, falls verfügbar. Gerätesperre bestätigen, zurückkehren und Bedienungshilfen → Installierte/heruntergeladene Apps → Degen Detox aktivieren. Menünamen variieren. Nur fortfahren, wenn du dieser App vertraust. Play Protect nicht ausschalten und Geräterichtlinien nicht umgehen.',
    'Android에서 “액세스 거부” 또는 “제한된 설정”이 표시되면 아래 앱 정보를 열고, 제공되는 경우 ⋮ → 제한된 설정 허용을 선택하세요. 기기 잠금을 확인하고 돌아와 접근성 → 설치/다운로드한 앱 → Degen Detox를 켜세요. 메뉴는 기기마다 다릅니다. 앱을 신뢰할 때만 진행하세요. Play Protect를 끄거나 기기 정책을 우회하지 마세요.',
  ],
  'consent': [
    'I understand the purpose and choose to open Android Accessibility settings.',
    'Suprantu paskirtį ir savo noru atveriu Android pritaikymo neįgaliesiems nustatymus.',
    'Entiendo la finalidad y elijo abrir los ajustes de accesibilidad.',
    'Je comprends la finalité et choisis d’ouvrir les réglages d’accessibilité.',
    'Ich verstehe den Zweck und möchte die Bedienungshilfen öffnen.',
    '목적을 이해했으며 Android 접근성 설정을 열겠습니다.',
  ],
  'appInfo': [
    'Open Degen Detox App info',
    'Atverti Degen Detox informaciją',
    'Abrir información de Degen Detox',
    'Ouvrir les infos de Degen Detox',
    'Degen Detox App-Info öffnen',
    'Degen Detox 앱 정보 열기'
  ],
  'access': [
    'Open blocker settings',
    'Atverti blokatoriaus nustatymus',
    'Abrir ajustes del bloqueador',
    'Ouvrir les réglages du bloqueur',
    'Blocker-Einstellungen öffnen',
    '차단기 설정 열기'
  ],
  'refresh': [
    'Check again',
    'Patikrinti dar kartą',
    'Comprobar otra vez',
    'Vérifier à nouveau',
    'Erneut prüfen',
    '다시 확인'
  ],
  'ready': [
    'Permission granted · service connected',
    'Leidimas suteiktas · tarnyba prijungta',
    'Permiso concedido · servicio conectado',
    'Autorisation accordée · service connecté',
    'Berechtigung erteilt · Dienst verbunden',
    '권한 허용됨 · 서비스 연결됨'
  ],
  'waiting': [
    'Permission granted, but service is not connected. Reopen Accessibility, toggle the service off and on, then check again.',
    'Leidimas suteiktas, bet tarnyba neprijungta. Vėl atverk pritaikymo neįgaliesiems nustatymus, išjunk ir įjunk tarnybą, tada patikrink dar kartą.',
    'Permiso concedido, pero servicio desconectado. Desactívalo y actívalo en Accesibilidad y vuelve a comprobar.',
    'Autorisation accordée, mais service déconnecté. Désactive puis réactive le service dans Accessibilité et vérifie à nouveau.',
    'Berechtigung erteilt, Dienst nicht verbunden. Dienst in den Bedienungshilfen aus- und einschalten und erneut prüfen.',
    '권한은 허용되었지만 서비스가 연결되지 않았습니다. 접근성에서 서비스를 껐다 켠 후 다시 확인하세요.'
  ],
  'off': [
    'Not enabled yet · follow the steps below',
    'Dar neįjungta · atlik žemiau nurodytus veiksmus',
    'Aún no está activo · sigue los pasos',
    'Pas encore activé · suis les étapes',
    'Noch nicht aktiviert · Schritte unten befolgen',
    '아직 비활성 상태 · 아래 단계를 따르세요'
  ],
  'error': [
    'Could not check Android settings. Try again.',
    'Nepavyko patikrinti Android nustatymų. Bandyk dar kartą.',
    'No se pudieron comprobar los ajustes. Reintenta.',
    'Impossible de vérifier les réglages. Réessaie.',
    'Einstellungen konnten nicht geprüft werden. Erneut versuchen.',
    'Android 설정을 확인할 수 없습니다. 다시 시도하세요.'
  ],
  'privacy': [
    'No advertising SDK or analytics tracker is included. Your check-ins, app selection and schedule stay on this device; check-ins are local preferences, not an encrypted medical record. Payment receipts are stored using secure storage. Wallet approval happens in your wallet, never by entering a seed phrase here. Solana transfers are public; the RPC provider receives network requests (including IP address and queried wallet data). Notification permission is only for reminders. Removing the app deletes its local data; keep your payment signature for restoration.',
    'Programėlėje nėra reklamos SDK ar analitikos sekimo. Savijautos įrašai, pasirinktų programėlių sąrašas ir grafikas lieka šiame įrenginyje; savijautos įrašai saugomi vietiniuose nustatymuose, tai nėra šifruota medicininė kortelė. Mokėjimų kvitai saugomi saugioje saugykloje. Mokėjimą tvirtini savo piniginėje, čia niekada neįvesk atkūrimo frazės. Solana pervedimai vieši; RPC paslaugos teikėjas gauna tinklo užklausas, įskaitant IP adresą ir užklausoje nurodytos piniginės duomenis. Pranešimų leidimas skirtas tik priminimams. Pašalinus programėlę jos vietiniai duomenys ištrinami; prieigos atkūrimui išsisaugok mokėjimo parašą.',
    'Sin SDK de publicidad ni rastreador analítico. Tus registros, selección de apps y horario permanecen en el dispositivo; los registros son preferencias locales, no un expediente médico cifrado. Los recibos usan almacenamiento seguro. Apruebas pagos en tu wallet, nunca introduciendo aquí una frase semilla. Las transferencias Solana son públicas; el proveedor RPC recibe solicitudes, incluida la IP y los datos de wallet consultados. Las notificaciones solo sirven para recordatorios. Desinstalar borra los datos locales; conserva la firma del pago para restaurar.',
    'Aucun SDK publicitaire ni traceur analytique. Tes notes, apps choisies et horaires restent sur cet appareil ; les notes sont des préférences locales, pas un dossier médical chiffré. Les reçus utilisent un stockage sécurisé. Tu approuves les paiements dans ton portefeuille, jamais en saisissant ici une phrase de récupération. Les transferts Solana sont publics ; le fournisseur RPC reçoit les requêtes, dont l’adresse IP et les données de portefeuille interrogées. Les notifications servent uniquement aux rappels. La désinstallation efface les données locales ; conserve la signature du paiement.',
    'Keine Werbe-SDKs oder Analyse-Tracker. Einträge, App-Auswahl und Zeitplan bleiben auf diesem Gerät; Einträge sind lokale Einstellungen, keine verschlüsselte Gesundheitsakte. Zahlungsbelege werden sicher gespeichert. Zahlungen bestätigst du in deiner Wallet, niemals durch Eingabe einer Seed-Phrase hier. Solana-Transfers sind öffentlich; der RPC-Anbieter erhält Netzwerkanfragen mit IP-Adresse und abgefragten Wallet-Daten. Benachrichtigungen dienen nur Erinnerungen. Deinstallation löscht lokale Daten; Zahlungssignatur zur Wiederherstellung aufbewahren.',
    '광고 SDK나 분석 추적기가 없습니다. 기록, 앱 선택, 일정은 기기에 저장됩니다. 기록은 로컬 설정이며 암호화된 의료 기록이 아닙니다. 결제 영수증은 보안 저장소에 저장합니다. 결제는 지갑에서 승인하며 여기에는 복구 구문을 입력하지 마세요. Solana 거래는 공개되며 RPC 제공자는 IP 주소와 조회한 지갑 정보가 포함된 네트워크 요청을 받습니다. 알림 권한은 미리 알림에만 사용합니다. 앱 삭제 시 로컬 데이터가 삭제되므로 복원을 위해 결제 서명을 보관하세요.',
  ],
  'philosophy': [
    'You choose your apps and hours before enabling the schedule. Once active, the block cannot be stopped, shortened or edited in this app until it ends automatically. This is voluntary support, not treatment or an unbreakable system lock. Phone, system tools and supported wallets remain available.',
    'Programėles ir laiką pasirenki prieš įjungdamas grafiką. Prasidėjus blokui, šioje programėlėje jo negalėsi sustabdyti, sutrumpinti ar pakeisti iki automatinės pabaigos. Tai savanoriška pagalba, ne gydymas ar neapeinamas sistemos užraktas. Telefonas, sistemos įrankiai ir palaikomos piniginės lieka pasiekiami.',
    'Eliges apps y horas antes de activar el horario. Una vez activo, no puedes detener, acortar ni editar el bloqueo en esta app hasta su fin automático. Es apoyo voluntario, no tratamiento ni bloqueo del sistema inviolable. Teléfono, herramientas del sistema y wallets compatibles siguen disponibles.',
    'Tu choisis apps et heures avant l’activation. Le blocage actif ne peut être arrêté, raccourci ou modifié dans cette app avant sa fin automatique. Aide volontaire, ni traitement ni verrou système inviolable. Téléphone, outils système et portefeuilles compatibles restent accessibles.',
    'Apps und Zeiten wählst du vor der Aktivierung. Eine aktive Sperre lässt sich in dieser App bis zum automatischen Ende nicht stoppen, verkürzen oder ändern. Freiwillige Hilfe, keine Behandlung oder unüberwindbare Systemsperre. Telefon, Systemwerkzeuge und unterstützte Wallets bleiben erreichbar.',
    '일정 활성화 전에 앱과 시간을 선택하세요. 차단이 시작되면 자동 종료까지 이 앱에서 중지, 단축, 변경할 수 없습니다. 자발적 도움이며 치료나 우회 불가능한 시스템 잠금은 아닙니다. 전화, 시스템 도구, 지원 지갑은 계속 사용할 수 있습니다.',
  ],
};

class PermissionGuide extends StatefulWidget {
  const PermissionGuide(
      {super.key, required this.locale, required this.native});
  final String locale;
  final AppBlockerNativeService native;
  @override
  State<PermissionGuide> createState() => _PermissionGuideState();
}

class _PermissionGuideState extends State<PermissionGuide>
    with WidgetsBindingObserver {
  bool consent = false, checking = false;
  bool restrictedHelp = false,
      awaitingInfoReturn = false,
      returnedFromInfo = false;
  String state = 'off';
  String g(String key) => guideText(key, widget.locale);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    check();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (awaitingInfoReturn) {
        setState(() {
          awaitingInfoReturn = false;
          returnedFromInfo = true;
        });
      }
      check();
    }
  }

  Future<void> check() async {
    if (kIsWeb || checking) return;
    setState(() => checking = true);
    var next = 'error';
    try {
      final p = await widget.native.checkPermissions();
      next = p['hasAccessibilityPermission'] != true
          ? 'off'
          : p['serviceConnected'] == true
              ? 'ready'
              : 'waiting';
    } catch (_) {/* Report unavailable, never infer permission. */}
    if (mounted) {
      setState(() {
        state = next;
        checking = false;
      });
    }
  }

  Future<void> open(Future<void> Function() action) async {
    try {
      await action();
    } catch (_) {
      if (mounted) setState(() => state = 'error');
    }
  }

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LuxuryPanel(
            padding: const EdgeInsets.all(18),
            child: Row(children: [
              Icon(state == 'ready'
                  ? Icons.check_circle_outline
                  : Icons.info_outline),
              const SizedBox(width: 12),
              Expanded(
                  child: Text(g(state), style: const TextStyle(height: 1.6))),
            ])),
        const SizedBox(height: 20),
        if (state != 'ready') ...[
          Text(g('intro'), style: const TextStyle(height: 1.6)),
          const SizedBox(height: 16),
          if (restrictedHelp) ...[
            LuxuryPanel(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(g(returnedFromInfo ? 'stepEnable' : 'stepInfo'),
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 14),
                      // Schematic, not an imitation of an actionable system menu.
                      Row(children: [
                        const Expanded(child: Text('Android · Degen Detox')),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text('⋮',
                                style: TextStyle(fontSize: 26))),
                      ]),
                      const SizedBox(height: 14),
                      Text('1. ${g('findMenu')}',
                          style: const TextStyle(height: 1.6)),
                      const SizedBox(height: 10),
                      Text('2. ${g('allowMenu')}',
                          style: const TextStyle(height: 1.6)),
                      const SizedBox(height: 10),
                      Text('3. ${g('returnStep')}',
                          style: const TextStyle(height: 1.6)),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                          onPressed: kIsWeb
                              ? null
                              : () {
                                  awaitingInfoReturn = true;
                                  open(widget.native.openAppDetails);
                                },
                          icon: const Icon(Icons.more_vert),
                          label: Text(g('appInfo'))),
                    ])),
            const SizedBox(height: 16),
          ],
          Text(g('enableHint'), style: const TextStyle(height: 1.6)),
          CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: consent,
              onChanged: (v) => setState(() => consent = v ?? false),
              title: Text(g('consent'),
                  style: const TextStyle(fontSize: 14, height: 1.5))),
          FilledButton.icon(
              onPressed: consent && !kIsWeb
                  ? () => open(widget.native.requestAccessibilityPermission)
                  : null,
              icon: const Icon(Icons.accessibility_new),
              label: Text(g('access'))),
          if (!restrictedHelp)
            TextButton(
                onPressed: () => setState(() => restrictedHelp = true),
                child: Text(g('helpButton'))),
          if (restrictedHelp) ...[
            const SizedBox(height: 12),
            Text(g('safeHelp'),
                style: const TextStyle(fontSize: 12, height: 1.6)),
          ],
          const SizedBox(height: 10),
          TextButton.icon(
              onPressed: checking ? null : check,
              icon: const Icon(Icons.refresh),
              label: Text(g('refresh'))),
        ] else
          FilledButton.icon(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(Icons.check),
              label: Text(g('done'))),
        if (restrictedHelp && state != 'ready')
          TextButton.icon(
              onPressed: () => launchUrl(
                  Uri.parse(
                      'https://support.google.com/android/answer/12623953?hl=en'),
                  mode: LaunchMode.externalApplication),
              icon: const Icon(Icons.open_in_new, size: 16),
              label: const Text('Google · Android')),
        const SizedBox(height: 16),
        ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text(g('details')),
            children: [
              Text(g('purpose'), style: const TextStyle(height: 1.7)),
              const SizedBox(height: 12),
              Text(g('philosophy'), style: const TextStyle(height: 1.7)),
            ]),
      ]);
}
