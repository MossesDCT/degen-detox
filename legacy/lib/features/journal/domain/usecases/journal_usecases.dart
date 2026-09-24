import '../entities/journal_entry.dart';
import '../repositories/journal_repository.dart';

class GetJournalEntries {
  const GetJournalEntries({required this.repository});
  final JournalRepository repository;

  Future<List<JournalEntry>> call() => repository.getEntries();

  Future<List<JournalEntry>> forMonth(int year, int month) =>
      repository.getEntriesForMonth(year, month);

  Future<Map<String, int>> moodSummary() => repository.getMoodSummaryForWeek();
}

class AddJournalEntry {
  const AddJournalEntry({required this.repository});
  final JournalRepository repository;

  Future<String> call(JournalEntry entry) => repository.addEntry(entry);
}

class UpdateJournalEntry {
  const UpdateJournalEntry({required this.repository});
  final JournalRepository repository;

  Future<void> call(JournalEntry entry) => repository.updateEntry(entry);
}

class DeleteJournalEntry {
  const DeleteJournalEntry({required this.repository});
  final JournalRepository repository;

  Future<void> call(String id) => repository.deleteEntry(id);
}
