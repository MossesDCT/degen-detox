import 'strings.dart';

String upgradeText(String key, String locale) {
  final i = languages.indexOf(locale);
  return upgradeWords[key]![i < 0 ? 0 : i];
}

const upgradeWords = <String, List<String>>{
  'title': [
    'Add Touch Grass',
    'Pridėti Touch Grass',
    'Añadir Touch Grass',
    'Ajouter Touch Grass',
    'Touch Grass hinzufügen',
    'Touch Grass 추가'
  ],
  'body': [
    'Keep your lifetime Pro and add Touch Grass for a separate one-time payment of 500 SKR. The earlier SOL payment is not deducted or refunded. No subscription.',
    'Išsaugok viso gyvenimo Pro ir pridėk Touch Grass už atskirą vienkartinį 500 SKR mokėjimą. Ankstesnis SOL mokėjimas neįskaitomas ir negrąžinamas. Jokios prenumeratos.',
    'Conserva Pro de por vida y añade Touch Grass con un pago único adicional de 500 SKR. El pago SOL anterior no se descuenta ni reembolsa. Sin suscripción.',
    'Garde Pro à vie et ajoute Touch Grass pour un paiement unique supplémentaire de 500 SKR. Le paiement SOL précédent n’est ni déduit ni remboursé. Sans abonnement.',
    'Behalte Pro auf Lebenszeit und ergänze Touch Grass für einmalig zusätzlich 500 SKR. Die frühere SOL-Zahlung wird nicht angerechnet oder erstattet. Kein Abo.',
    '평생 Pro를 유지하면서 별도의 일회성 500 SKR 결제로 Touch Grass를 추가하세요. 이전 SOL 결제는 차감되거나 환불되지 않습니다. 구독은 없습니다.',
  ],
  'buy': [
    'Add for 500 SKR',
    'Pridėti už 500 SKR',
    'Añadir por 500 SKR',
    'Ajouter pour 500 SKR',
    'Für 500 SKR hinzufügen',
    '500 SKR로 추가'
  ],
  'kept': [
    'Your existing Pro stays active while the upgrade is pending or if you cancel.',
    'Esama Pro prieiga išlieka, kol papildymas laukia patvirtinimo arba jei jį atšauksi.',
    'Tu Pro actual sigue activo mientras esperas la confirmación o si cancelas.',
    'Ton Pro actuel reste actif en attendant la confirmation ou si tu annules.',
    'Dein vorhandenes Pro bleibt während der Bestätigung oder bei Abbruch aktiv.',
    '업그레이드 대기 중이거나 취소해도 기존 Pro는 유지됩니다.',
  ],
};
