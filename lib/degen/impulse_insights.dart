import 'package:flutter/material.dart';
import 'strings.dart';

String insightText(String key, String locale) => insightWords[key]![
    languages.contains(locale) ? languages.indexOf(locale) : 0];

const insightWords = <String, List<String>>{
  'title': [
    'Your urge patterns',
    'Tavo potraukio apžvalga',
    'Tus patrones de impulso',
    'Tes tendances d’envie',
    'Deine Impulsmuster',
    '충동 패턴'
  ],
  'purpose': [
    'Pause and notice the urge before acting. Rate it from 1 to 10 and optionally note what happened. Compare your own check-ins over time.',
    'Prieš veikdamas sustok ir pastebėk potraukį. Įvertink jį nuo 1 iki 10 ir, jei nori, užrašyk, kas jį paskatino. Ilgainiui palygink savo įrašus.',
    'Haz una pausa antes de actuar. Puntúa el impulso del 1 al 10 y anota, si quieres, qué pasó. Compara tus registros con el tiempo.',
    'Fais une pause avant d’agir. Note ton envie de 1 à 10 et, si tu le souhaites, ce qui s’est passé. Compare tes observations au fil du temps.',
    'Halte vor dem Handeln inne. Bewerte den Drang von 1 bis 10 und notiere bei Bedarf den Auslöser. Vergleiche deine Einträge im Laufe der Zeit.',
    '행동하기 전에 잠시 멈춰 충동을 알아차리세요. 1~10점으로 평가하고 원한다면 상황을 기록하세요. 시간이 지나며 내 기록을 비교할 수 있습니다.',
  ],
  'window': [
    'Last 30 days · on this device',
    'Paskutinės 30 dienų · šiame įrenginyje',
    'Últimos 30 días · en este dispositivo',
    '30 derniers jours · sur cet appareil',
    'Letzte 30 Tage · auf diesem Gerät',
    '최근 30일 · 이 기기에 저장'
  ],
  'need': [
    'Add at least 3 check-ins to see your summary.',
    'Apžvalgai reikia bent 3 įrašų.',
    'Añade al menos 3 registros para ver el resumen.',
    'Ajoute au moins 3 observations pour voir le bilan.',
    'Für die Übersicht brauchst du mindestens 3 Einträge.',
    '요약을 보려면 3회 이상 기록하세요.'
  ],
  'count': [
    'Check-ins',
    'Įrašai',
    'Registros',
    'Observations',
    'Einträge',
    '기록 수'
  ],
  'mean': [
    'Average urge',
    'Vidutinis potraukis',
    'Impulso medio',
    'Envie moyenne',
    'Mittlerer Drang',
    '평균 충동'
  ],
  'range': [
    'Lowest / highest',
    'Mažiausias / didžiausias',
    'Mínimo / máximo',
    'Minimum / maximum',
    'Niedrigster / höchster',
    '최저 / 최고'
  ],
  'trend': [
    'Recent scores · oldest to newest',
    'Naujausi įverčiai · nuo seniausio',
    'Puntuaciones recientes · de antigua a nueva',
    'Notes récentes · de la plus ancienne à la plus récente',
    'Letzte Werte · ältester zuerst',
    '최근 점수 · 오래된 순'
  ],
  'dayparts': [
    'By time of day',
    'Pagal paros laiką',
    'Por momento del día',
    'Par moment de la journée',
    'Nach Tageszeit',
    '시간대별'
  ],
  'night': [
    'Night · 00–06',
    'Naktis · 00–06',
    'Noche · 00–06',
    'Nuit · 00–06',
    'Nacht · 00–06',
    '심야 · 00–06'
  ],
  'morning': [
    'Morning · 06–12',
    'Rytas · 06–12',
    'Mañana · 06–12',
    'Matin · 06–12',
    'Morgen · 06–12',
    '오전 · 06–12'
  ],
  'afternoon': [
    'Afternoon · 12–18',
    'Diena · 12–18',
    'Tarde · 12–18',
    'Après-midi · 12–18',
    'Nachmittag · 12–18',
    '오후 · 12–18'
  ],
  'evening': [
    'Evening · 18–24',
    'Vakaras · 18–24',
    'Noche · 18–24',
    'Soir · 18–24',
    'Abend · 18–24',
    '저녁 · 18–24'
  ],
  'more': [
    'To compare times, record at least 5 check-ins, including at least 2 in each of two different time periods. Try checking in at varied times, not only during strong urges.',
    'Laikams palyginti reikia bent 5 įrašų, iš jų bent po 2 dviejuose skirtinguose paros laikotarpiuose. Pildyk įvairiu metu, ne tik tada, kai potraukis stiprus.',
    'Para comparar horarios necesitas 5 registros, con al menos 2 en cada uno de dos periodos distintos. Registra en momentos variados, no solo con impulsos fuertes.',
    'Pour comparer les horaires, il faut 5 observations, dont au moins 2 dans chacun de deux créneaux différents. Note aussi tes envies faibles à des heures variées.',
    'Für den Zeitvergleich brauchst du 5 Einträge, davon mindestens je 2 in zwei verschiedenen Zeiträumen. Erfasse unterschiedliche Zeiten, nicht nur starke Impulse.',
    '시간대 비교에는 5회 이상, 서로 다른 두 시간대에 각각 2회 이상 기록이 필요합니다. 충동이 강할 때뿐 아니라 다양한 시간에 기록하세요.',
  ],
  'higher': [
    'Higher recorded average',
    'Didesnis užfiksuotas vidurkis',
    'Mayor media registrada',
    'Moyenne observée plus élevée',
    'Höherer erfasster Mittelwert',
    '기록상 높은 평균'
  ],
  'lower': [
    'Lower recorded average',
    'Mažesnis užfiksuotas vidurkis',
    'Menor media registrada',
    'Moyenne observée plus faible',
    'Niedrigerer erfasster Mittelwert',
    '기록상 낮은 평균'
  ],
  'equal': [
    'The comparable time periods have the same average.',
    'Palyginamų laikotarpių vidurkiai vienodi.',
    'Los periodos comparables tienen la misma media.',
    'Les créneaux comparables ont la même moyenne.',
    'Die vergleichbaren Zeiträume haben denselben Mittelwert.',
    '비교 가능한 시간대의 평균이 같습니다.'
  ],
  'limits': [
    'This describes only your recorded ratings, not all your day. Small samples can mislead. It is not a diagnosis, a cortisol measurement, or proof of cause.',
    'Tai tik tavo užfiksuotų įverčių, o ne visos dienos apžvalga. Maža imtis gali klaidinti. Tai nėra diagnozė, kortizolio matavimas ar priežasties įrodymas.',
    'Describe solo las puntuaciones registradas, no todo tu día. Pocos datos pueden confundir. No es un diagnóstico, una medición de cortisol ni prueba de una causa.',
    'Ce bilan décrit uniquement tes notes, pas toute ta journée. Un petit échantillon peut tromper. Ce n’est ni un diagnostic, ni une mesure du cortisol, ni une preuve de cause.',
    'Dies beschreibt nur deine erfassten Werte, nicht den ganzen Tag. Kleine Stichproben können täuschen. Keine Diagnose, Cortisolmessung oder Aussage über Ursachen.',
    '이 요약은 하루 전체가 아닌 기록된 점수만 보여줍니다. 적은 표본은 오해를 줄 수 있습니다. 진단이나 코르티솔 측정, 원인의 증거가 아닙니다.',
  ],
  'history': [
    'Recent check-ins',
    'Naujausi įrašai',
    'Registros recientes',
    'Observations récentes',
    'Letzte Einträge',
    '최근 기록'
  ],
};

class UrgeRecord {
  const UrgeRecord(this.date, this.score, this.hour, this.note);
  final DateTime date;
  final int score, hour;
  final String note;
  int get bucket => hour ~/ 6;
}

class UrgeInsights {
  UrgeInsights(List<Map<String, dynamic>> entries, {DateTime? now}) {
    final end = now ?? DateTime.now();
    final start = end.subtract(const Duration(days: 30));
    for (final entry in entries) {
      final date = DateTime.tryParse('${entry['date']}');
      final score = entry['urge'];
      if (date == null ||
          score is! int ||
          score < 1 ||
          score > 10 ||
          date.isBefore(start) ||
          date.isAfter(end)) {
        continue;
      }
      final storedHour = entry['hourLocal'];
      final hour = storedHour is int && storedHour >= 0 && storedHour < 24
          ? storedHour
          : date.toLocal().hour;
      records.add(UrgeRecord(date, score, hour,
          entry['note'] is String ? entry['note'] as String : ''));
    }
    records.sort((a, b) => a.date.compareTo(b.date));
  }
  final records = <UrgeRecord>[];
  bool get ready => records.length >= 3;
  double get mean => records.isEmpty
      ? 0
      : records.fold<int>(0, (s, r) => s + r.score) / records.length;
  List<UrgeRecord> bucket(int index) =>
      records.where((r) => r.bucket == index).toList();
  double bucketMean(int index) {
    final list = bucket(index);
    return list.isEmpty
        ? 0
        : list.fold<int>(0, (s, r) => s + r.score) / list.length;
  }

  List<int> get comparable =>
      List.generate(4, (i) => i).where((i) => bucket(i).length >= 2).toList();
  bool get canCompare => records.length >= 5 && comparable.length >= 2;
  List<int> get high {
    if (!canCompare) return [];
    final max = comparable.map(bucketMean).reduce((a, b) => a > b ? a : b);
    return comparable
        .where((i) => (bucketMean(i) - max).abs() < .000001)
        .toList();
  }

  List<int> get low {
    if (!canCompare) return [];
    final min = comparable.map(bucketMean).reduce((a, b) => a < b ? a : b);
    return comparable
        .where((i) => (bucketMean(i) - min).abs() < .000001)
        .toList();
  }

  bool get equal => canCompare && high.length == comparable.length;
}

class ImpulseInsightsPanel extends StatelessWidget {
  const ImpulseInsightsPanel(
      {super.key, required this.entries, required this.locale, this.now});
  final List<Map<String, dynamic>> entries;
  final String locale;
  final DateTime? now;
  @override
  Widget build(BuildContext context) {
    final data = UrgeInsights(entries, now: now);
    String t(String key) => insightText(key, locale);
    String period(int i) => t(['night', 'morning', 'afternoon', 'evening'][i]);
    final color = Theme.of(context).colorScheme.primary;
    Widget heading(String text) => Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 12),
        child: Text(text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)));
    String timestamp(UrgeRecord r) {
      final date =
          MaterialLocalizations.of(context).formatShortDate(r.date.toLocal());
      // Preserve the hour recorded at the location, even after travel.
      return '$date · ${r.hour.toString().padLeft(2, '0')}:${r.date.minute.toString().padLeft(2, '0')}';
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(t('window'), style: const TextStyle(fontSize: 12)),
      const SizedBox(height: 12),
      Text(t('purpose')),
      heading('${t('count')}: ${data.records.length}'),
      if (!data.ready) Text(t('need')),
      if (data.ready) ...[
        Text('${t('mean')}: ${data.mean.toStringAsFixed(1)}/10',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: color)),
        const SizedBox(height: 8),
        Text(
            '${t('range')}: ${data.records.map((r) => r.score).reduce((a, b) => a < b ? a : b)} / ${data.records.map((r) => r.score).reduce((a, b) => a > b ? a : b)}'),
        heading(t('trend')),
        // Labels expose every score without requiring colour or a tooltip.
        SizedBox(
            height: 92,
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              for (final r in data.records.skip(
                  data.records.length > 14 ? data.records.length - 14 : 0))
                Expanded(
                    child: Semantics(
                        label: '${timestamp(r)}: ${r.score}/10',
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('${r.score}',
                                      style: const TextStyle(fontSize: 12)),
                                  const SizedBox(height: 4),
                                  Container(
                                      height: r.score * 6.0,
                                      decoration: BoxDecoration(
                                          color: color.withValues(alpha: .75),
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                ])))),
            ])),
        heading(t('dayparts')),
        for (var i = 0; i < 4; i++)
          Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${period(i)} · ${t('count')}: ${data.bucket(i).length}'),
                    const SizedBox(height: 4),
                    if (data.bucket(i).isNotEmpty)
                      Text(
                          '${t('mean')}: ${data.bucketMean(i).toStringAsFixed(1)}/10'),
                  ])),
        if (!data.canCompare)
          Text(t('more'))
        else if (data.equal)
          Text(t('equal'))
        else ...[
          Text('${t('higher')}: ${data.high.map(period).join(', ')}'),
          const SizedBox(height: 8),
          Text('${t('lower')}: ${data.low.map(period).join(', ')}'),
        ],
      ],
      heading(t('history')),
      for (final r in data.records.reversed.take(10))
        Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${timestamp(r)} · ${r.score}/10',
                  style: const TextStyle(fontWeight: FontWeight.w700)),
              if (r.note.isNotEmpty) Text(r.note),
            ])),
      const Divider(),
      const SizedBox(height: 8),
      Text(t('limits'), style: const TextStyle(fontSize: 13, height: 1.5)),
    ]);
  }
}
