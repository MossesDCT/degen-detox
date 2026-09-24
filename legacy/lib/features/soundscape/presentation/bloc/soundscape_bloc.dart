import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/entities/soundscape.dart';
import '../../domain/usecases/get_soundscapes.dart';

// ── Events ────────────────────────────────────────────────────────────────────

abstract class SoundscapeEvent extends Equatable {
  const SoundscapeEvent();
  @override
  List<Object?> get props => [];
}

class LoadSoundscapes extends SoundscapeEvent {
  const LoadSoundscapes();
}

class PlaySoundscape extends SoundscapeEvent {
  const PlaySoundscape(this.soundscape);
  final Soundscape soundscape;
  @override
  List<Object?> get props => [soundscape];
}

class PauseSoundscape extends SoundscapeEvent {
  const PauseSoundscape();
}

class ResumeSoundscape extends SoundscapeEvent {
  const ResumeSoundscape();
}

class StopSoundscape extends SoundscapeEvent {
  const StopSoundscape();
}

class SetVolume extends SoundscapeEvent {
  const SetVolume(this.volume);
  final double volume;
  @override
  List<Object?> get props => [volume];
}

class SetSleepTimer extends SoundscapeEvent {
  const SetSleepTimer(this.minutes);
  final int? minutes; // null = no timer
  @override
  List<Object?> get props => [minutes];
}

class SleepTimerExpired extends SoundscapeEvent {
  const SleepTimerExpired();
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class SoundscapeState extends Equatable {
  const SoundscapeState();
  @override
  List<Object?> get props => [];
}

class SoundscapeInitial extends SoundscapeState {
  const SoundscapeInitial();
}

class SoundscapeLoading extends SoundscapeState {
  const SoundscapeLoading();
}

class SoundscapeLoaded extends SoundscapeState {
  const SoundscapeLoaded({
    required this.soundscapes,
    this.activeSoundscape,
    this.isPlaying = false,
    this.volume = 0.8,
    this.sleepTimerMinutes,
    this.sleepTimerRemainingSeconds,
  });

  final List<Soundscape> soundscapes;
  final Soundscape? activeSoundscape;
  final bool isPlaying;
  final double volume;
  final int? sleepTimerMinutes;
  final int? sleepTimerRemainingSeconds;

  SoundscapeLoaded copyWith({
    List<Soundscape>? soundscapes,
    Soundscape? activeSoundscape,
    bool? isPlaying,
    double? volume,
    int? sleepTimerMinutes,
    int? sleepTimerRemainingSeconds,
    bool clearTimer = false,
    bool clearActive = false,
  }) {
    return SoundscapeLoaded(
      soundscapes: soundscapes ?? this.soundscapes,
      activeSoundscape:
          clearActive ? null : (activeSoundscape ?? this.activeSoundscape),
      isPlaying: isPlaying ?? this.isPlaying,
      volume: volume ?? this.volume,
      sleepTimerMinutes:
          clearTimer ? null : (sleepTimerMinutes ?? this.sleepTimerMinutes),
      sleepTimerRemainingSeconds: clearTimer
          ? null
          : (sleepTimerRemainingSeconds ?? this.sleepTimerRemainingSeconds),
    );
  }

  @override
  List<Object?> get props => [
        soundscapes,
        activeSoundscape,
        isPlaying,
        volume,
        sleepTimerMinutes,
        sleepTimerRemainingSeconds,
      ];
}

class SoundscapeError extends SoundscapeState {
  const SoundscapeError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class SoundscapePlaybackError extends SoundscapeState {
  const SoundscapePlaybackError({
    required this.soundscapes,
    required this.soundscapeName,
    required this.errorMessage,
  });
  final List<Soundscape> soundscapes;
  final String soundscapeName;
  final String errorMessage;
  @override
  List<Object?> get props => [soundscapes, soundscapeName, errorMessage];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class SoundscapeBloc extends Bloc<SoundscapeEvent, SoundscapeState> {
  SoundscapeBloc({required this.getSoundscapes})
      : super(const SoundscapeInitial()) {
    on<LoadSoundscapes>(_onLoad);
    on<PlaySoundscape>(_onPlay);
    on<PauseSoundscape>(_onPause);
    on<ResumeSoundscape>(_onResume);
    on<StopSoundscape>(_onStop);
    on<SetVolume>(_onSetVolume);
    on<SetSleepTimer>(_onSetSleepTimer);
    on<SleepTimerExpired>(_onSleepTimerExpired);
  }

  final GetSoundscapes getSoundscapes;
  final AudioPlayer _player = AudioPlayer();
  Timer? _sleepTimer;
  final Map<String, File> _extractedFiles = {};

  /// Extract a Flutter asset to a temp file for reliable Android playback.
  /// Caches extracted files so we only do this once per asset.
  Future<File> _extractAssetToFile(String assetPath) async {
    if (_extractedFiles.containsKey(assetPath)) {
      return _extractedFiles[assetPath]!;
    }
    final dir = await getTemporaryDirectory();
    final fileName = assetPath.split('/').last;
    final file = File('${dir.path}/$fileName');
    if (!await file.exists()) {
      final data = await rootBundle.load(assetPath);
      await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
      // Small delay to ensure file I/O is fully flushed
      await Future.delayed(const Duration(milliseconds: 200));
    }
    _extractedFiles[assetPath] = file;
    return file;
  }

  @override
  Future<void> close() async {
    _sleepTimer?.cancel();
    await _player.dispose();
    return super.close();
  }

  Future<void> _onLoad(
      LoadSoundscapes event, Emitter<SoundscapeState> emit) async {
    emit(const SoundscapeLoading());
    try {
      final soundscapes = await getSoundscapes();
      emit(SoundscapeLoaded(soundscapes: soundscapes));
    } catch (e) {
      emit(SoundscapeError(e.toString()));
    }
  }

  Future<void> _onPlay(
      PlaySoundscape event, Emitter<SoundscapeState> emit) async {
    final current = state;
    if (current is! SoundscapeLoaded) return;

    try {
      // If same soundscape is playing, just resume
      if (current.activeSoundscape?.id == event.soundscape.id &&
          current.isPlaying) {
        return;
      }

      // Stop current audio
      await _player.stop();

      // Load audio — extract asset to temp file for reliable Android playback
      final assetPath = event.soundscape.audioPath;
      debugPrint('[SoundscapeBloc] Loading audio: $assetPath');

      final file = await _extractAssetToFile(assetPath);
      debugPrint('[SoundscapeBloc] Extracted to: ${file.path}');
      await _player.setFilePath(file.path);
      await _player.setLoopMode(LoopMode.one); // Loop infinitely
      await _player.setVolume(current.volume);
      await _player.play();
      debugPrint('[SoundscapeBloc] Playing: ${event.soundscape.name}');

      emit(current.copyWith(
        activeSoundscape: event.soundscape,
        isPlaying: true,
      ));
    } catch (e, stackTrace) {
      debugPrint('[SoundscapeBloc] ERROR playing ${event.soundscape.name}: $e');
      debugPrint('[SoundscapeBloc] StackTrace: $stackTrace');
      // Emit error so UI can show it to user
      emit(SoundscapePlaybackError(
        soundscapes: current.soundscapes,
        soundscapeName: event.soundscape.name,
        errorMessage: e.toString(),
      ));
      // Return to loaded state
      emit(current.copyWith(
        activeSoundscape: event.soundscape,
        isPlaying: false,
      ));
    }
  }

  Future<void> _onPause(
      PauseSoundscape event, Emitter<SoundscapeState> emit) async {
    final current = state;
    if (current is! SoundscapeLoaded) return;

    await _player.pause();
    emit(current.copyWith(isPlaying: false));
  }

  Future<void> _onResume(
      ResumeSoundscape event, Emitter<SoundscapeState> emit) async {
    final current = state;
    if (current is! SoundscapeLoaded) return;

    await _player.play();
    emit(current.copyWith(isPlaying: true));
  }

  Future<void> _onStop(
      StopSoundscape event, Emitter<SoundscapeState> emit) async {
    final current = state;
    if (current is! SoundscapeLoaded) return;

    await _player.stop();
    _sleepTimer?.cancel();
    emit(current.copyWith(
      isPlaying: false,
      clearActive: true,
      clearTimer: true,
    ));
  }

  Future<void> _onSetVolume(
      SetVolume event, Emitter<SoundscapeState> emit) async {
    final current = state;
    if (current is! SoundscapeLoaded) return;

    await _player.setVolume(event.volume);
    emit(current.copyWith(volume: event.volume));
  }

  Future<void> _onSetSleepTimer(
      SetSleepTimer event, Emitter<SoundscapeState> emit) async {
    final current = state;
    if (current is! SoundscapeLoaded) return;

    _sleepTimer?.cancel();

    if (event.minutes == null) {
      emit(current.copyWith(clearTimer: true));
      return;
    }

    final totalSeconds = event.minutes! * 60;
    emit(current.copyWith(
      sleepTimerMinutes: event.minutes,
      sleepTimerRemainingSeconds: totalSeconds,
    ));

    _sleepTimer = Timer(Duration(seconds: totalSeconds), () {
      if (!isClosed) add(const SleepTimerExpired());
    });
  }

  Future<void> _onSleepTimerExpired(
      SleepTimerExpired event, Emitter<SoundscapeState> emit) async {
    final current = state;
    if (current is! SoundscapeLoaded) return;

    await _player.stop();
    emit(current.copyWith(
      isPlaying: false,
      clearActive: true,
      clearTimer: true,
    ));
  }
}
