import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../config/di.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/journal_entry.dart';
import '../bloc/journal_bloc.dart';
import '../widgets/journal_entry_card.dart';
import '../widgets/mood_calendar.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Mood journal page with calendar view and entry list.
class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<JournalBloc>()..add(const LoadJournalEntries()),
      child: const _JournalView(),
    );
  }
}

class _JournalView extends StatelessWidget {
  const _JournalView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(context.l10n.journalTitle),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => _showAddEntryDialog(context),
          ),
        ],
      ),
      body: BlocBuilder<JournalBloc, JournalState>(
        builder: (context, state) {
          if (state is JournalLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.sageGreen),
            );
          }

          if (state is JournalLoaded) {
            return CustomScrollView(
              slivers: [
                // Calendar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: MoodCalendar(
                      year: state.displayYear,
                      month: state.displayMonth,
                      moodSummary: state.moodSummary,
                      onPreviousMonth: () {
                        final d =
                            DateTime(state.displayYear, state.displayMonth - 1);
                        context.read<JournalBloc>().add(
                              ChangeMonth(year: d.year, month: d.month),
                            );
                      },
                      onNextMonth: () {
                        final d =
                            DateTime(state.displayYear, state.displayMonth + 1);
                        context.read<JournalBloc>().add(
                              ChangeMonth(year: d.year, month: d.month),
                            );
                      },
                    ),
                  ).animate().fadeIn(duration: 400.ms),
                ),

                // Weekly average
                if (state.weeklyAverage != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.lightSage.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Text('📊', style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 10),
                            Text(
                              context.l10n.weeklyAverage(
                                  _moodLabel(context, state.weeklyAverage!)),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: context.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                // Entries list
                if (state.entries.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('📔', style: TextStyle(fontSize: 48)),
                          const SizedBox(height: 16),
                          Text(
                            context.l10n.noEntriesThisMonth,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            context.l10n.tapPlusToAdd,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final entry = state.entries[index];
                        return JournalEntryCard(
                          entry: entry,
                          animationDelay: Duration(milliseconds: 50 * index),
                          onDelete: () {
                            context
                                .read<JournalBloc>()
                                .add(DeleteEntry(entry.id));
                          },
                        );
                      },
                      childCount: state.entries.length,
                    ),
                  ),

                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEntryDialog(context),
        backgroundColor: AppColors.sageGreen,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          context.l10n.addEntry,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  String _moodLabel(BuildContext context, double avg) {
    final l = context.l10n;
    if (avg >= 4.5) return '😊 ${l.moodGreat}';
    if (avg >= 3.5) return '🙂 ${l.moodGood}';
    if (avg >= 2.5) return '😐 ${l.moodOkay}';
    if (avg >= 1.5) return '😔 ${l.moodBad}';
    return '😰 ${l.moodTerrible}';
  }

  void _showAddEntryDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<JournalBloc>(),
        child: const _AddEntrySheet(),
      ),
    );
  }
}

/// Bottom sheet for adding a new mood entry.
class _AddEntrySheet extends StatefulWidget {
  const _AddEntrySheet();

  @override
  State<_AddEntrySheet> createState() => _AddEntrySheetState();
}

class _AddEntrySheetState extends State<_AddEntrySheet> {
  MoodLevel _selectedMood = MoodLevel.okay;
  final _noteController = TextEditingController();
  final _tagController = TextEditingController();
  final List<String> _tags = [];

  @override
  void dispose() {
    _noteController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.cardBg,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.dividerColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                context.l10n.howAreYouFeeling,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20),

              // Mood selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: MoodLevel.values.map((mood) {
                  final isSelected = _selectedMood == mood;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedMood = mood),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.lightSage.withOpacity(0.5)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: isSelected
                            ? Border.all(
                                color: AppColors.sageGreen,
                                width: 2,
                              )
                            : null,
                      ),
                      child: Column(
                        children: [
                          Text(mood.emoji,
                              style: TextStyle(fontSize: isSelected ? 32 : 26)),
                          const SizedBox(height: 4),
                          Text(
                            mood.getLocalizedName(context),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: isSelected
                                  ? AppColors.sageGreen
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Note
              TextField(
                controller: _noteController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: context.l10n.addNoteOptional,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: context.dividerColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: context.dividerColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: AppColors.sageGreen, width: 1.5),
                  ),
                  filled: true,
                  fillColor: AppColors.background,
                ),
              ),

              const SizedBox(height: 24),

              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<JournalBloc>().add(AddEntry(
                          mood: _selectedMood,
                          note: _noteController.text.isEmpty
                              ? null
                              : _noteController.text,
                          tags: _tags,
                        ));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.sageGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    context.l10n.saveEntry,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
