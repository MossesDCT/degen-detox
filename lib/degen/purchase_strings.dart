const purchaseWords = <String, List<String>>{
  'privacyNative': [
    'Check-ins and settings stay on this phone; notes are not encrypted. Purchase receipts use Android-backed secure storage. Wallet payments are public on Solana and verified through an HTTPS RPC provider, which receives your IP and requested wallet/transaction data. We do not collect analytics, seed phrases or private keys. Accessibility reads the opened app name only, not screen content. Degen Detox does not measure hormones or diagnose addiction.',
    'Savistaba ir nustatymai lieka telefone; pastabos nešifruojamos. Pirkimo kvitai saugomi saugioje Android saugykloje. Mokėjimai vieši Solana tinkle ir tikrinami per HTTPS RPC paslaugą, kuri gauna tavo IP bei užklausose pateiktus piniginės ir operacijos duomenis. Nerenkame analitikos, atkūrimo frazių ar privačių raktų. Pritaikymo neįgaliesiems funkcija mato tik atidaromos programėlės pavadinimą, ne ekrano turinį. Degen Detox nematuoja hormonų ir nediagnozuoja priklausomybės.',
    'Registros y ajustes quedan en este teléfono; las notas no están cifradas. Los recibos usan almacenamiento seguro Android. Los pagos son públicos en Solana y se verifican por HTTPS RPC, cuyo proveedor recibe tu IP y los datos consultados de cartera y transacción. No recopilamos analíticas, frases semilla ni claves privadas. Accesibilidad solo identifica la app abierta. No medimos hormonas ni diagnosticamos adicciones.',
    'Bilans et réglages restent sur ce téléphone ; les notes ne sont pas chiffrées. Les reçus utilisent le stockage sécurisé Android. Les paiements sont publics sur Solana et vérifiés via un fournisseur HTTPS RPC qui reçoit votre IP et les données consultées. Aucune analyse, phrase de récupération ni clé privée collectée. L’Accessibilité identifie seulement l’app ouverte. Aucun dosage hormonal ni diagnostic.',
    'Check-ins und Einstellungen bleiben auf diesem Telefon; Notizen sind nicht verschlüsselt. Kaufbelege liegen im sicheren Android-Speicher. Zahlungen sind auf Solana öffentlich und werden per HTTPS-RPC geprüft; der Anbieter erhält IP und abgefragte Wallet-/Transaktionsdaten. Keine Analysen, Seed-Phrasen oder privaten Schlüssel. Bedienungshilfen erkennen nur die geöffnete App, keine Bildschirminhalte. Keine Hormonmessung oder Diagnose.',
    '기록과 설정은 기기에 보관되며 메모는 암호화되지 않습니다. 구매 영수증은 Android 보안 저장소를 사용합니다. 결제는 Solana에 공개되며 HTTPS RPC 제공자가 IP와 조회한 지갑·거래 데이터를 받아 확인합니다. 분석, 복구 문구, 개인 키를 수집하지 않습니다. 접근성은 열린 앱만 식별하며 화면 내용을 읽지 않습니다. 호르몬 측정이나 중독 진단을 하지 않습니다.'
  ],
  'lifetime': [
    'One-time payment',
    'Vienkartinis mokėjimas',
    'Pago único',
    'Paiement unique',
    'Einmalige Zahlung',
    '일회성 결제'
  ],
  'noSubscription': [
    'Lifetime Pro. No subscriptions. No monthly bills.',
    'Pro visam laikui. Jokių prenumeratų. Jokių mėnesinių mokesčių.',
    'Pro para siempre. Sin suscripciones ni cuotas mensuales.',
    'Pro à vie. Sans abonnement ni frais mensuels.',
    'Pro für immer. Keine Abos. Keine monatlichen Gebühren.',
    '평생 Pro. 구독도 월 요금도 없습니다.'
  ],
  'buySol': [
    'Unlock for 0.1 SOL',
    'Atrakinti už 0,1 SOL',
    'Desbloquear por 0,1 SOL',
    'Débloquer pour 0,1 SOL',
    'Für 0,1 SOL freischalten',
    '0.1 SOL로 활성화'
  ],
  'buySkr': [
    'Unlock for 500 SKR',
    'Atrakinti už 500 SKR',
    'Desbloquear por 500 SKR',
    'Débloquer pour 500 SKR',
    'Für 500 SKR freischalten',
    '500 SKR로 활성화'
  ],
  'fees': [
    'One-time price plus Solana network fees. SKR also needs a small SOL balance; the first payment may create the recipient token account at your cost. Review the total in your wallet.',
    'Vienkartinė kaina ir Solana tinklo mokestis. SKR mokėjimui reikia šiek tiek SOL; pirmas mokėjimas gali tavo lėšomis sukurti gavėjo žetono sąskaitą. Visą sumą patikrink piniginėje.',
    'Precio único más comisiones de Solana. SKR requiere algo de SOL; el primer pago puede crear la cuenta del destinatario a tu cargo. Revisa el total en tu cartera.',
    'Prix unique plus frais Solana. Le SKR nécessite un peu de SOL ; le premier paiement peut créer le compte du destinataire à vos frais. Vérifiez le total dans votre portefeuille.',
    'Einmalpreis plus Solana-Netzwerkgebühren. SKR benötigt etwas SOL; die erste Zahlung kann das Empfängerkonto auf deine Kosten erstellen. Prüfe den Gesamtbetrag in der Wallet.',
    '일회성 가격에 Solana 수수료가 추가됩니다. SKR 결제에도 소량의 SOL이 필요하며 첫 결제 시 수취인 토큰 계정 생성 비용이 들 수 있습니다. 지갑에서 총액을 확인하세요.'
  ],
  'recipient': [
    'Recipient',
    'Gavėjas',
    'Destinatario',
    'Destinataire',
    'Empfänger',
    '수취인'
  ],
  'confirmPayment': [
    'Review one-time purchase',
    'Patikrink vienkartinį pirkimą',
    'Revisar compra única',
    'Vérifier l’achat unique',
    'Einmalkauf prüfen',
    '일회성 구매 확인'
  ],
  'openWallet': [
    'Continue in wallet',
    'Tęsti piniginėje',
    'Continuar en la cartera',
    'Continuer dans le portefeuille',
    'In Wallet fortfahren',
    '지갑에서 계속'
  ],
  'restore': [
    'Restore purchase',
    'Atkurti pirkimą',
    'Restaurar compra',
    'Restaurer l’achat',
    'Kauf wiederherstellen',
    '구매 복원'
  ],
  'receiptInput': [
    'Transaction signature (optional)',
    'Operacijos parašas (neprivaloma)',
    'Firma de transacción (opcional)',
    'Signature de transaction (facultatif)',
    'Transaktionssignatur (optional)',
    '거래 서명 (선택 사항)'
  ],
  'restoreHint': [
    'Connect the wallet you paid with. Restoration is free and asks for a message signature, not a payment. For old purchases, paste the transaction signature from your wallet history.',
    'Prijunk piniginę, iš kurios mokėjai. Atkūrimas nemokamas: pasirašoma žinutė, ne mokėjimas. Senam pirkimui įklijuok operacijos parašą iš piniginės istorijos.',
    'Conecta la cartera con la que pagaste. Restaurar es gratis y firma un mensaje, no un pago. Para compras antiguas pega la firma de tu historial.',
    'Connectez le portefeuille utilisé pour payer. La restauration est gratuite et signe un message, pas un paiement. Pour un ancien achat, collez la signature de l’historique.',
    'Verbinde die Wallet des Kaufs. Die Wiederherstellung ist kostenlos: Nachricht signieren, nicht bezahlen. Bei alten Käufen die Signatur aus dem Verlauf einfügen.',
    '결제에 사용한 지갑을 연결하세요. 복원은 무료이며 결제가 아닌 메시지에 서명합니다. 오래된 구매는 지갑 기록의 거래 서명을 붙여 넣으세요.'
  ],
  'owned': [
    'Lifetime Pro active',
    'Pro visam laikui aktyvus',
    'Pro de por vida activo',
    'Pro à vie actif',
    'Lebenslanges Pro aktiv',
    '평생 Pro 활성화'
  ],
  'processing': [
    'Waiting for your wallet or network confirmation… Do not pay again.',
    'Laukiama piniginės arba tinklo patvirtinimo… Nemokėk pakartotinai.',
    'Esperando la cartera o la red… No pagues otra vez.',
    'En attente du portefeuille ou du réseau… Ne payez pas à nouveau.',
    'Warte auf Wallet oder Netzwerk… Nicht erneut bezahlen.',
    '지갑 또는 네트워크 확인 대기 중… 다시 결제하지 마세요.'
  ],
  'networkError': [
    'Network unavailable or rate limited. Try Restore later. Your existing access is unchanged.',
    'Tinklas nepasiekiamas arba riboja užklausas. Vėliau bandyk atkurti pirkimą. Turima prieiga nesikeičia.',
    'Red no disponible o limitada. Prueba Restaurar más tarde. Tu acceso actual no cambia.',
    'Réseau indisponible ou limité. Réessayez la restauration plus tard. Votre accès reste inchangé.',
    'Netzwerk nicht verfügbar oder begrenzt. Später wiederherstellen. Bestehender Zugriff bleibt unverändert.',
    '네트워크 오류 또는 요청 제한입니다. 나중에 복원하세요. 기존 이용 권한은 유지됩니다.'
  ],
  'noWallet': [
    'No compatible mobile wallet found. Enable your Seeker wallet or install a Mobile Wallet Adapter wallet.',
    'Nerasta suderinama piniginė. Įjunk Seeker piniginę arba įdiek Mobile Wallet Adapter palaikančią piniginę.',
    'No hay cartera compatible. Activa la cartera Seeker o instala una compatible con Mobile Wallet Adapter.',
    'Aucun portefeuille compatible. Activez celui de Seeker ou installez un portefeuille Mobile Wallet Adapter.',
    'Keine kompatible Wallet. Seeker-Wallet aktivieren oder eine Mobile-Wallet-Adapter-Wallet installieren.',
    '호환 지갑이 없습니다. Seeker 지갑을 활성화하거나 Mobile Wallet Adapter 지갑을 설치하세요.'
  ],
  'walletCancelled': [
    'Wallet request cancelled or timed out. No purchase was confirmed.',
    'Piniginės užklausa atšaukta arba baigėsi jos laikas. Pirkimas nepatvirtintas.',
    'Solicitud cancelada o caducada. No se confirmó ninguna compra.',
    'Demande annulée ou expirée. Aucun achat confirmé.',
    'Wallet-Anfrage abgebrochen oder abgelaufen. Kein Kauf bestätigt.',
    '지갑 요청이 취소되었거나 시간이 초과되었습니다. 구매가 확인되지 않았습니다.'
  ],
  'pendingPayment': [
    'A payment may still be pending. Do not pay again. Tap Restore to check its status.',
    'Mokėjimas gali būti dar vykdomas. Nemokėk dar kartą. Spausk Atkurti ir patikrink būseną.',
    'El pago puede seguir pendiente. No pagues otra vez. Pulsa Restaurar.',
    'Un paiement est peut-être en attente. Ne payez pas à nouveau. Touchez Restaurer.',
    'Zahlung möglicherweise ausstehend. Nicht erneut zahlen. Wiederherstellen wählen.',
    '결제가 처리 중일 수 있습니다. 다시 결제하지 말고 복원을 눌러 확인하세요.'
  ],
  'paymentFailed': [
    'Transaction failed or expired without confirmation. Any network fee is not refundable by the app. You can try again.',
    'Operacija nepavyko arba nebuvo patvirtinta laiku. Programėlė negali grąžinti tinklo mokesčio. Gali bandyti dar kartą.',
    'La operación falló o caducó. La app no puede devolver la comisión de red. Puedes reintentar.',
    'Transaction échouée ou expirée. L’app ne rembourse pas les frais réseau. Vous pouvez réessayer.',
    'Transaktion fehlgeschlagen oder abgelaufen. Netzwerkgebühren kann die App nicht erstatten. Erneut versuchen.',
    '거래가 실패했거나 만료되었습니다. 앱은 네트워크 수수료를 환불할 수 없습니다. 다시 시도할 수 있습니다.'
  ],
  'invalidReceipt': [
    'This transaction does not match a valid Degen Detox purchase for this wallet.',
    'Ši operacija neatitinka galiojančio šios piniginės Degen Detox pirkimo.',
    'Esta operación no es una compra válida de Degen Detox para esta cartera.',
    'Cette transaction n’est pas un achat Degen Detox valide pour ce portefeuille.',
    'Diese Transaktion ist kein gültiger Degen-Detox-Kauf für diese Wallet.',
    '이 거래는 이 지갑의 유효한 Degen Detox 구매가 아닙니다.'
  ],
  'receiptNotFound': [
    'No purchase found in the recent wallet history. Paste your older transaction signature to restore; do not buy again.',
    'Naujausioje piniginės istorijoje pirkimo nerasta. Įklijuok senesnio pirkimo operacijos parašą; nepirk iš naujo.',
    'No se encontró compra reciente. Pega la firma de la compra antigua; no compres otra vez.',
    'Aucun achat récent trouvé. Collez la signature de votre ancien achat ; ne rachetez pas.',
    'Kein Kauf im jüngeren Verlauf gefunden. Alte Transaktionssignatur einfügen; nicht erneut kaufen.',
    '최근 지갑 기록에서 구매를 찾지 못했습니다. 이전 거래 서명을 입력하세요. 다시 구매하지 마세요.'
  ],
  'busyPayment': [
    'Finish the current wallet request first.',
    'Pirmiausia užbaik dabartinę piniginės užklausą.',
    'Finaliza la solicitud actual.',
    'Terminez la demande en cours.',
    'Aktuelle Wallet-Anfrage zuerst abschließen.',
    '현재 지갑 요청을 먼저 완료하세요.'
  ],
  'alreadyOwned': [
    'You already have lifetime Pro. No second payment is needed.',
    'Jau turi Pro visam laikui. Dar kartą mokėti nereikia.',
    'Ya tienes Pro de por vida. No necesitas pagar de nuevo.',
    'Vous avez déjà Pro à vie. Aucun nouveau paiement requis.',
    'Du hast bereits Pro für immer. Keine weitere Zahlung nötig.',
    '이미 평생 Pro를 보유하고 있습니다. 다시 결제할 필요가 없습니다.'
  ],
  'merchantWallet': [
    'Use a different wallet for a real purchase. The recipient cannot pay themselves. Use the QA build for free feature testing.',
    'Tikram pirkimui naudok kitą piniginę. Gavėjas negali mokėti pats sau. Nemokamai funkcijas bandyk QA versijoje.',
    'Usa otra cartera para comprar. El destinatario no puede pagarse a sí mismo. Prueba las funciones gratis en QA.',
    'Utilisez un autre portefeuille. Le destinataire ne peut pas se payer lui-même. Testez gratuitement avec QA.',
    'Andere Wallet für den Kauf verwenden. Empfänger können nicht an sich selbst zahlen. Funktionen kostenlos im QA-Build testen.',
    '실제 구매에는 다른 지갑을 사용하세요. 수취인은 자신에게 결제할 수 없습니다. 무료 기능 테스트는 QA 앱을 사용하세요.'
  ],
  'androidPayment': [
    'Payments are available in the Android app, not in this preview or QA build.',
    'Mokėjimai veikia Android programėlėje, ne šioje peržiūroje ar QA versijoje.',
    'Pagos disponibles en Android, no en esta vista ni en QA.',
    'Paiements dans l’app Android, pas dans cet aperçu ni QA.',
    'Zahlungen nur in der Android-App, nicht in Vorschau oder QA.',
    '결제는 Android 앱에서 가능하며 미리보기나 QA 버전에서는 불가합니다.'
  ],
  'qaBanner': [
    'QA TEST · No real payments',
    'QA TESTAS · Tikrų mokėjimų nėra',
    'PRUEBA QA · Sin pagos reales',
    'TEST QA · Aucun paiement réel',
    'QA-TEST · Keine echten Zahlungen',
    'QA 테스트 · 실제 결제 없음'
  ],
  'permissions': [
    'Set up Android permissions',
    'Suteikti Android leidimus',
    'Configurar permisos Android',
    'Configurer les autorisations Android',
    'Android-Berechtigungen einrichten',
    'Android 권한 설정'
  ],
  'permissionsBody': [
    'Morning Shield needs Accessibility to detect only which app opens and return blocked apps to Home. It does not read messages, record screens or send app usage to a server. Enable it voluntarily in Android Settings. You can stop blocking here at any time.',
    'Ryto apsaugai reikia Pritaikymo neįgaliesiems leidimo, kad aptiktų atidaromą programėlę ir grąžintų į pradžios ekraną. Žinutės neskaitomos, ekranas neįrašomas, naudojimas nesiunčiamas į serverį. Leidimą įjunk savanoriškai Android nustatymuose. Blokavimą čia gali bet kada sustabdyti.',
    'Morning Shield usa Accesibilidad para detectar la app abierta y devolver las bloqueadas al inicio. No lee mensajes, graba la pantalla ni envía uso a servidores. Actívalo voluntariamente en Ajustes. Puedes detenerlo aquí.',
    'Morning Shield utilise l’Accessibilité pour détecter l’app ouverte et revenir à l’accueil. Aucun message lu, écran enregistré ni usage envoyé à un serveur. Activez-la volontairement dans les réglages. Arrêt possible ici à tout moment.',
    'Morning Shield benötigt Bedienungshilfen, um geöffnete Apps zu erkennen und blockierte Apps zum Startbildschirm zurückzuleiten. Keine Nachrichten, Bildschirmaufnahmen oder Übermittlung der Nutzung. Freiwillig in Android aktivieren. Hier jederzeit beenden.',
    'Morning Shield는 접근성으로 열린 앱을 감지하고 차단 앱을 홈 화면으로 돌려보냅니다. 메시지 읽기, 화면 녹화, 사용 기록 전송을 하지 않습니다. Android 설정에서 자발적으로 활성화하며 언제든 여기서 중지할 수 있습니다.'
  ],
  'accessibility': [
    'Open Accessibility settings',
    'Atidaryti pritaikymo neįgaliesiems nustatymus',
    'Abrir Accesibilidad',
    'Ouvrir les réglages d’accessibilité',
    'Bedienungshilfen öffnen',
    '접근성 설정 열기'
  ],
  'stopBlocking': [
    'Stop blocking and cancel schedule',
    'Sustabdyti blokavimą ir tvarkaraštį',
    'Detener bloqueo y horario',
    'Arrêter le blocage et le programme',
    'Blockierung und Zeitplan beenden',
    '차단 및 일정 중지'
  ],
  'blockSaved': [
    'Schedule enabled. If you are inside the morning window, blocking starts now.',
    'Tvarkaraštis įjungtas. Jei dabar yra pasirinktas ryto laikas, blokavimas prasideda iš karto.',
    'Horario activado. Si ya estás en la franja matinal, el bloqueo empieza ahora.',
    'Programme activé. Si vous êtes dans la plage matinale, le blocage commence maintenant.',
    'Zeitplan aktiv. Innerhalb des Morgenfensters beginnt die Blockierung sofort.',
    '일정이 활성화되었습니다. 아침 시간대라면 지금 차단이 시작됩니다.'
  ],
  'needPermission': [
    'Enable Accessibility and select at least one app, then save again.',
    'Įjunk Pritaikymą neįgaliesiems ir pasirink bent vieną programėlę, tada išsaugok dar kartą.',
    'Activa Accesibilidad y elige al menos una app; vuelve a guardar.',
    'Activez l’Accessibilité et choisissez une app, puis enregistrez à nouveau.',
    'Bedienungshilfen aktivieren, mindestens eine App wählen und erneut speichern.',
    '접근성을 켜고 앱을 하나 이상 선택한 후 다시 저장하세요.'
  ],
  'testReminder': [
    'Test notification in 10 seconds',
    'Bandomasis pranešimas po 10 sekundžių',
    'Probar aviso en 10 segundos',
    'Tester dans 10 secondes',
    'In 10 Sekunden testen',
    '10초 후 알림 테스트'
  ],
  'testBlock': [
    'QA: block selected apps for 2 minutes',
    'QA: blokuoti pasirinktas programėles 2 minutes',
    'QA: bloquear apps 2 minutos',
    'QA : bloquer 2 minutes',
    'QA: Apps für 2 Minuten blockieren',
    'QA: 선택 앱 2분 차단'
  ],
  'remindersOn': [
    'Reminders enabled. Timing may vary with battery settings.',
    'Priminimai įjungti. Laikas gali kisti dėl baterijos nustatymų.',
    'Avisos activados. La batería puede afectar la hora.',
    'Rappels actifs. L’économie de batterie peut modifier l’horaire.',
    'Erinnerungen aktiv. Energiesparen kann den Zeitpunkt verändern.',
    '알림이 켜졌습니다. 배터리 설정에 따라 시간이 달라질 수 있습니다.'
  ],
};
