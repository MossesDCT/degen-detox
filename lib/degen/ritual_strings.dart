import 'strings.dart';

String ritualText(String key, String locale) => ritualWords[key]![
    languages.contains(locale) ? languages.indexOf(locale) : 0];

const ritualWords = <String, List<String>>{
  'measures': [
    'tbsp = tablespoon · tsp = teaspoon',
    'valg. š. = valgomasis šaukštas · arbat. š. = arbatinis šaukštelis',
    'cda. = cucharada · cdta. = cucharadita',
    'c. à soupe = cuillère à soupe · c. à café = cuillère à café',
    'EL = Esslöffel · TL = Teelöffel',
    '큰술 = 큰 계량스푼 · 작은술 = 작은 계량스푼',
  ],
  'ingredientHint': [
    'Tap an ingredient once you have added it. Tap again to undo. Checks stay on this device until you start cooking again.',
    'Paliesk jau įdėtą ingredientą. Palietęs dar kartą, nuimsi varnelę. Žymėjimai lieka šiame įrenginyje, kol pradėsi gaminti iš naujo.',
    'Toca un ingrediente al añadirlo y otra vez para desmarcarlo. Las marcas se guardan en este dispositivo hasta empezar de nuevo.',
    'Touche un ingrédient ajouté, puis à nouveau pour le décocher. Les coches restent sur cet appareil jusqu’à la prochaine préparation.',
    'Tippe eine hinzugefügte Zutat an und erneut zum Abwählen. Die Häkchen bleiben auf diesem Gerät, bis du neu beginnst.',
    '넣은 재료를 누르면 체크됩니다. 다시 누르면 해제됩니다. 새로 요리하기를 누를 때까지 이 기기에 표시가 유지됩니다.',
  ],
  'added': ['Added', 'Įdėta', 'Añadidos', 'Ajoutés', 'Hinzugefügt', '추가한 재료'],
  'restart': [
    'Start cooking again',
    'Gaminti iš naujo',
    'Cocinar de nuevo',
    'Recommencer la recette',
    'Neu kochen',
    '새로 요리하기'
  ],
  'addCustom': [
    'Add my fourth step',
    'Pridėti savo ketvirtą žingsnį',
    'Añadir mi cuarto paso',
    'Ajouter ma quatrième étape',
    'Meinen vierten Schritt hinzufügen',
    '나만의 네 번째 단계 추가'
  ],
  'customTitle': [
    'My evening ritual',
    'Mano vakaro ritualas',
    'Mi ritual de noche',
    'Mon rituel du soir',
    'Mein Abendritual',
    '나만의 저녁 루틴'
  ],
  'customHint': [
    'For example: read 10 pages, pray, or prepare for tomorrow. Your text stays on this device. Check it off again each time you open this routine.',
    'Pavyzdžiui: perskaityti 10 puslapių, pasimelsti ar pasiruošti rytojui. Tavo tekstas lieka šiame įrenginyje. Kiekvieną kartą atvėręs ritualą žingsnius pažymėsi iš naujo.',
    'Por ejemplo: leer 10 páginas, rezar o preparar el día siguiente. El texto queda en este dispositivo. Marca los pasos cada vez que abras la rutina.',
    'Par exemple : lire 10 pages, prier ou préparer demain. Le texte reste sur cet appareil. Recoche les étapes à chaque ouverture de la routine.',
    'Zum Beispiel: 10 Seiten lesen, beten oder morgen vorbereiten. Dein Text bleibt auf diesem Gerät. Bei jedem Öffnen hakst du die Schritte neu ab.',
    '예: 10쪽 읽기, 기도하기, 내일 준비하기. 입력한 내용은 이 기기에 저장됩니다. 루틴을 열 때마다 단계를 새로 체크하세요.',
  ],
  'customField': [
    'Your fourth step',
    'Tavo ketvirtas žingsnis',
    'Tu cuarto paso',
    'Ta quatrième étape',
    'Dein vierter Schritt',
    '나만의 네 번째 단계'
  ],
  'edit': ['Edit', 'Redaguoti', 'Editar', 'Modifier', 'Bearbeiten', '수정'],
  'remove': [
    'Remove my step',
    'Pašalinti mano žingsnį',
    'Eliminar mi paso',
    'Supprimer mon étape',
    'Meinen Schritt entfernen',
    '내 단계 삭제'
  ],
  'removeAsk': [
    'Remove your custom step? The three original steps will remain.',
    'Pašalinti tavo sukurtą žingsnį? Trys pagrindiniai žingsniai liks.',
    '¿Eliminar tu paso personalizado? Los tres pasos originales se conservarán.',
    'Supprimer ton étape personnelle ? Les trois étapes initiales resteront.',
    'Deinen eigenen Schritt entfernen? Die drei ursprünglichen Schritte bleiben.',
    '직접 만든 단계를 삭제할까요? 기본 세 단계는 유지됩니다.',
  ],
  'invalid': [
    'Enter 1–120 characters.',
    'Įrašyk nuo 1 iki 120 simbolių.',
    'Escribe entre 1 y 120 caracteres.',
    'Saisis de 1 à 120 caractères.',
    'Gib 1–120 Zeichen ein.',
    '1~120자를 입력하세요.'
  ],
  'storageError': [
    'Could not save on this device. Please try again.',
    'Nepavyko išsaugoti šiame įrenginyje. Bandyk dar kartą.',
    'No se pudo guardar en este dispositivo. Inténtalo de nuevo.',
    'Impossible d’enregistrer sur cet appareil. Réessaie.',
    'Speichern auf diesem Gerät fehlgeschlagen. Bitte erneut versuchen.',
    '이 기기에 저장하지 못했습니다. 다시 시도하세요.'
  ],
  'retry': [
    'Retry',
    'Bandyti dar kartą',
    'Reintentar',
    'Réessayer',
    'Erneut versuchen',
    '다시 시도'
  ],
};

/// Replace complete measurement tokens, including tokens in method steps.
/// Quantities/fractions are never changed or converted.
String localizeRecipeMeasures(String text, String locale) {
  const tablespoon = {
    'en': 'tbsp',
    'lt': 'valg. š.',
    'es': 'cda.',
    'fr': 'c. à soupe',
    'de': 'EL',
    'ko': '큰술'
  };
  const teaspoon = {
    'en': 'tsp',
    'lt': 'arbat. š.',
    'es': 'cdta.',
    'fr': 'c. à café',
    'de': 'TL',
    'ko': '작은술'
  };
  var value = text.replaceAllMapped(
      RegExp(r'\b(tbsp|tsp)\b', caseSensitive: false),
      (m) =>
          (m[1]!.toLowerCase() == 'tbsp' ? tablespoon : teaspoon)[locale] ??
          m[0]!);
  if (locale == 'ko') value = value.replaceAll(RegExp(r'\bcups?\b'), '컵');
  return value;
}
