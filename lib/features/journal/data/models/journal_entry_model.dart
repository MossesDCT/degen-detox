import '../../domain/entities/journal_entry.dart';

class JournalEntryModel extends JournalEntry {
  const JournalEntryModel({
    required super.id,
    required super.mood,
    required super.date,
    super.note,
    super.tags,
  });

  factory JournalEntryModel.fromMap(Map<String, dynamic> map) {
    return JournalEntryModel(
      id: map['id'] as String,
      mood: MoodLevelExtension.fromValue(map['mood'] as int),
      date: DateTime.parse(map['date'] as String),
      note: map['note'] as String?,
      tags: map['tags'] != null
          ? (map['tags'] as String)
              .split(',')
              .where((t) => t.isNotEmpty)
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mood': mood.value,
      'date': date.toIso8601String(),
      'note': note,
      'tags': tags.join(','),
    };
  }

  factory JournalEntryModel.fromEntity(JournalEntry entry) {
    return JournalEntryModel(
      id: entry.id,
      mood: entry.mood,
      date: entry.date,
      note: entry.note,
      tags: entry.tags,
    );
  }
}
