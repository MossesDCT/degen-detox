import '../../domain/entities/education_snippet.dart';

/// Data model for education snippet — maps between domain entity and raw data.
class EducationSnippetModel extends EducationSnippet {
  const EducationSnippetModel({
    required super.id,
    required super.title,
    required super.content,
    required super.category,
    required super.readingTimeMinutes,
    super.emoji,
    super.isHighlighted,
  });

  factory EducationSnippetModel.fromMap(Map<String, dynamic> map) {
    return EducationSnippetModel(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      category: SnippetCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => SnippetCategory.basics,
      ),
      readingTimeMinutes: map['readingTimeMinutes'] as int,
      emoji: map['emoji'] as String?,
      isHighlighted: map['isHighlighted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category.name,
      'readingTimeMinutes': readingTimeMinutes,
      'emoji': emoji,
      'isHighlighted': isHighlighted,
    };
  }

  factory EducationSnippetModel.fromEntity(EducationSnippet entity) {
    return EducationSnippetModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      category: entity.category,
      readingTimeMinutes: entity.readingTimeMinutes,
      emoji: entity.emoji,
      isHighlighted: entity.isHighlighted,
    );
  }
}
