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
    '1 · App info',
    '1 · Programos informacija',
    '1 · Información de la app',
    '1 · Infos sur l’application',
    '1 · App-Info',
    '1 · 앱 정보'
  ],
  'access': [
    '2 · Accessibility',
    '2 · Pritaikymas neįgaliesiems',
    '2 · Accesibilidad',
    '2 · Accessibilité',
    '2 · Bedienungshilfen',
    '2 · 접근성'
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
    'Boundaries without shame. You choose the apps and hours; we help you keep that commitment. The blocker is a voluntary guardrail, not an unbreakable lock or treatment. Stop it in Settings at any time. Phone, system tools and supported wallets are excluded. You remain in control.',
    'Ribos be gėdos. Tu pasirenki programėles ir laiką, mes padedame laikytis šio sprendimo. Blokavimas yra savanoriška pagalba, ne neįveikiamas užraktas ar gydymas. Nustatymuose jį gali bet kada sustabdyti. Telefonas, sistemos įrankiai ir palaikomos piniginės neblokuojami. Kontrolė lieka tavo rankose.',
    'Límites sin vergüenza. Tú eliges apps y horarios; te ayudamos a mantener tu decisión. Es una barrera voluntaria, no un bloqueo invencible ni un tratamiento. Puedes detenerlo en Ajustes. Se excluyen el teléfono, herramientas del sistema y wallets compatibles. Tú mantienes el control.',
    'Des limites sans culpabilité. Tu choisis apps et horaires ; nous t’aidons à respecter ce choix. C’est une aide volontaire, pas un verrou inviolable ni un traitement. Arrête-la à tout moment dans Réglages. Téléphone, outils système et portefeuilles pris en charge sont exclus. Tu gardes le contrôle.',
    'Grenzen ohne Scham. Du wählst Apps und Zeiten; wir unterstützen deine Entscheidung. Freiwillige Unterstützung, keine unüberwindbare Sperre oder Behandlung. In Einstellungen jederzeit stoppen. Telefon, Systemwerkzeuge und unterstützte Wallets bleiben frei. Du behältst die Kontrolle.',
    '자책 대신 경계 설정. 앱과 시간을 직접 선택하면 그 결정을 지키도록 돕습니다. 차단은 자발적인 보조 수단이며 완벽한 잠금이나 치료가 아닙니다. 설정에서 언제든 중지할 수 있습니다. 전화, 시스템 도구, 지원 지갑은 제외됩니다. 통제권은 사용자에게 있습니다.',
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
    if (state == AppLifecycleState.resumed) check();
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
        Text(g('purpose'), style: const TextStyle(height: 1.7)),
        const SizedBox(height: 20),
        Text(g('restricted'), style: const TextStyle(height: 1.7)),
        const SizedBox(height: 16),
        OutlinedButton.icon(
            onPressed: kIsWeb ? null : () => open(widget.native.openAppDetails),
            icon: const Icon(Icons.settings_outlined),
            label: Text(g('appInfo'))),
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
        const SizedBox(height: 10),
        TextButton.icon(
            onPressed: checking ? null : check,
            icon: const Icon(Icons.refresh),
            label: Text(g('refresh'))),
        TextButton.icon(
            onPressed: () => launchUrl(
                Uri.parse(
                    'https://support.google.com/android/answer/12623953?hl=en'),
                mode: LaunchMode.externalApplication),
            icon: const Icon(Icons.open_in_new, size: 16),
            label: const Text('Google · Android')),
        const SizedBox(height: 16),
        Text(g('philosophy'), style: const TextStyle(height: 1.7)),
      ]);
}
