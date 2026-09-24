import '../entities/journal_entry.dart';

abstract class JournalRepository {
  Future<List<JournalEntry>> getEntries();
  Future<List<JournalEntry>> getEntriesForMonth(int year, int month);
  Future<JournalEntry?> getEntryForDate(DateTime date);
  Future<String> addEntry(JournalEntry entry);
  Future<void> updateEntry(JournalEntry entry);
  Future<void> deleteEntry(String id);
  Future<Map<String, int>> getMoodSummaryForWeek();
}
