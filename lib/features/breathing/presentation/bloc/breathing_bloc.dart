import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/breathing_technique.dart';
import '../../domain/usecases/get_breathing_techniques.dart';

// ── Session Phase Enum ────────────────────────────────────────────────────────

/// The current state of a breathing session.
enum SessionPhase { idle, inhale, hold, exhale, holdAfterExhale, complete }

// ── Events ────────────────────────────────────────────────────────────────────

abstract class BreathingEvent extends Equatable {
  const BreathingEvent();
  @override
  List<Object?> get props => [];
}

class LoadBreathingTechniques extends BreathingEvent {
  const LoadBreathingTechniques({this.l10n});
  final AppLocalizations? l10n;
  @override
  List<Object?> get props => [l10n];
}

class StartBreathingSession extends BreathingEvent {
  const StartBreathingSession(this.technique);
  final BreathingTechnique technique;
  @override
  List<Object?> get props => [technique];
}

class TickBreathingTimer extends BreathingEvent {
  const TickBreathingTimer(this.remainingSeconds);
  final int remainingSeconds;
  @override
  List<Object?> get props => [remainingSeconds];
}

class NextBreathingPhase extends BreathingEvent {
  const NextBreathingPhase();
}

class StopBreathingSession extends BreathingEvent {
  const StopBreathingSession();
}

class ResetBreathingSession extends BreathingEvent {
  const ResetBreathingSession();
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class BreathingState extends Equatable {
  const BreathingState();
  @override
  List<Object?> get props => [];
}

class BreathingInitial extends BreathingState {
  const BreathingInitial();
}

class BreathingLoading extends BreathingState {
  const BreathingLoading();
}

class BreathingTechniquesLoaded extends BreathingState {
  const BreathingTechniquesLoaded(this.techniques);
  final List<BreathingTechnique> techniques;
  @override
  List<Object?> get props => [techniques];
}

class BreathingError extends BreathingState {
  const BreathingError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

/// Active session state — emitted continuously during a session.
class BreathingSessionActive extends BreathingState {
  const BreathingSessionActive({
    required this.technique,
    required this.phase,
    required this.currentPhaseIndex,
    required this.remainingSeconds,
    required this.completedCycles,
    required this.totalCycles,
    required this.phaseName,
    required this.phaseInstruction,
  });

  final BreathingTechnique technique;
  final SessionPhase phase;
  final int currentPhaseIndex;
  final int remainingSeconds;
  final int completedCycles;
  final int totalCycles;
  final String phaseName;
  final String phaseInstruction;

  bool get isComplete => phase == SessionPhase.complete;
  double get cycleProgress => completedCycles / totalCycles;

  @override
  List<Object?> get props => [
        technique,
        phase,
        currentPhaseIndex,
        remainingSeconds,
        completedCycles,
        totalCycles,
        phaseName,
        phaseInstruction,
      ];
}

class BreathingSessionComplete extends BreathingState {
  const BreathingSessionComplete({
    required this.technique,
    required this.completedCycles,
    required this.totalDurationSeconds,
  });

  final BreathingTechnique technique;
  final int completedCycles;
  final int totalDurationSeconds;

  @override
  List<Object?> get props => [technique, completedCycles, totalDurationSeconds];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class BreathingBloc extends Bloc<BreathingEvent, BreathingState> {
  BreathingBloc({required this.getTechniques})
      : super(const BreathingInitial()) {
    on<LoadBreathingTechniques>(_onLoad);
    on<StartBreathingSession>(_onStart);
    on<TickBreathingTimer>(_onTick);
    on<NextBreathingPhase>(_onNextPhase);
    on<StopBreathingSession>(_onStop);
    on<ResetBreathingSession>(_onReset);
  }

  final GetBreathingTechniques getTechniques;

  Timer? _timer;
  int _currentPhaseIndex = 0;
  int _remainingSeconds = 0;
  int _completedCycles = 0;
  int _sessionStartTime = 0;
  BreathingTechnique? _activeTechnique;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  Future<void> _onLoad(
      LoadBreathingTechniques event, Emitter<BreathingState> emit) async {
    emit(const BreathingLoading());
    try {
      final techniques = await getTechniques(event.l10n);
      emit(BreathingTechniquesLoaded(techniques));
    } catch (e) {
      emit(BreathingError(e.toString()));
    }
  }

  Future<void> _onStart(
      StartBreathingSession event, Emitter<BreathingState> emit) async {
    _timer?.cancel();
    _activeTechnique = event.technique;
    _currentPhaseIndex = 0;
    _completedCycles = 0;
    _sessionStartTime = DateTime.now().millisecondsSinceEpoch;

    final firstPhase = event.technique.phases[0];
    _remainingSeconds = firstPhase.durationSeconds;

    emit(BreathingSessionActive(
      technique: event.technique,
      phase: _sessionPhaseFromType(firstPhase.type),
      currentPhaseIndex: 0,
      remainingSeconds: _remainingSeconds,
      completedCycles: 0,
      totalCycles: event.technique.totalCycles,
      phaseName: firstPhase.name,
      phaseInstruction: firstPhase.instruction,
    ));

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!isClosed) {
        add(const TickBreathingTimer(0)); // trigger tick
      }
    });
  }

  Future<void> _onTick(
      TickBreathingTimer event, Emitter<BreathingState> emit) async {
    if (_activeTechnique == null) return;

    _remainingSeconds--;

    if (_remainingSeconds <= 0) {
      // Move to next phase
      add(const NextBreathingPhase());
    } else {
      final technique = _activeTechnique!;
      final phase = technique.phases[_currentPhaseIndex];
      emit(BreathingSessionActive(
        technique: technique,
        phase: _sessionPhaseFromType(phase.type),
        currentPhaseIndex: _currentPhaseIndex,
        remainingSeconds: _remainingSeconds,
        completedCycles: _completedCycles,
        totalCycles: technique.totalCycles,
        phaseName: phase.name,
        phaseInstruction: phase.instruction,
      ));
    }
  }

  Future<void> _onNextPhase(
      NextBreathingPhase event, Emitter<BreathingState> emit) async {
    if (_activeTechnique == null) return;
    final technique = _activeTechnique!;

    _currentPhaseIndex++;

    if (_currentPhaseIndex >= technique.phases.length) {
      // Completed one full cycle
      _currentPhaseIndex = 0;
      _completedCycles++;

      if (_completedCycles >= technique.totalCycles) {
        // Session complete
        _timer?.cancel();
        final elapsed =
            (DateTime.now().millisecondsSinceEpoch - _sessionStartTime) ~/ 1000;
        emit(BreathingSessionComplete(
          technique: technique,
          completedCycles: _completedCycles,
          totalDurationSeconds: elapsed,
        ));
        return;
      }
    }

    final nextPhase = technique.phases[_currentPhaseIndex];
    _remainingSeconds = nextPhase.durationSeconds;

    emit(BreathingSessionActive(
      technique: technique,
      phase: _sessionPhaseFromType(nextPhase.type),
      currentPhaseIndex: _currentPhaseIndex,
      remainingSeconds: _remainingSeconds,
      completedCycles: _completedCycles,
      totalCycles: technique.totalCycles,
      phaseName: nextPhase.name,
      phaseInstruction: nextPhase.instruction,
    ));
  }

  Future<void> _onStop(
      StopBreathingSession event, Emitter<BreathingState> emit) async {
    _timer?.cancel();
    if (_activeTechnique != null) {
      emit(BreathingTechniquesLoaded(await getTechniques()));
    } else {
      emit(const BreathingInitial());
    }
    _activeTechnique = null;
  }

  Future<void> _onReset(
      ResetBreathingSession event, Emitter<BreathingState> emit) async {
    _timer?.cancel();
    _activeTechnique = null;
    _currentPhaseIndex = 0;
    _completedCycles = 0;
    emit(const BreathingInitial());
  }

  SessionPhase _sessionPhaseFromType(BreathingPhaseType type) {
    switch (type) {
      case BreathingPhaseType.inhale:
        return SessionPhase.inhale;
      case BreathingPhaseType.exhale:
        return SessionPhase.exhale;
      case BreathingPhaseType.hold:
        // Distinguish hold-after-inhale vs hold-after-exhale
        if (_currentPhaseIndex > 0) {
          final prevPhase = _activeTechnique!.phases[_currentPhaseIndex - 1];
          if (prevPhase.type == BreathingPhaseType.exhale) {
            return SessionPhase.holdAfterExhale;
          }
        }
        return SessionPhase.hold;
    }
  }
}
