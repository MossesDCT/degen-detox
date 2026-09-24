import '../../domain/entities/journal_entry.dart';
import '../../domain/repositories/journal_repository.dart';
import '../datasources/journal_local_datasource.dart';
import '../models/journal_entry_model.dart';

class JournalRepositoryImpl implements JournalRepository {
  const JournalRepositoryImpl({required this.datasource});

  final JournalLocalDatasource datasource;

  @override
  Future<List<JournalEntry>> getEntries() => datasource.getEntries();

  @override
  Future<List<JournalEntry>> getEntriesForMonth(int year, int month) =>
      datasource.getEntriesForMonth(year, month);

  @override
  Future<JournalEntry?> getEntryForDate(DateTime date) =>
      datasource.getEntryForDate(date);

  @override
  Future<String> addEntry(JournalEntry entry) =>
      datasource.insertEntry(JournalEntryModel.fromEntity(entry));

  @override
  Future<void> updateEntry(JournalEntry entry) =>
      datasource.updateEntry(JournalEntryModel.fromEntity(entry));

  @override
  Future<void> deleteEntry(String id) => datasource.deleteEntry(id);

  @override
  Future<Map<String, int>> getMoodSummaryForWeek() =>
      datasource.getMoodSummaryForWeek();
}
