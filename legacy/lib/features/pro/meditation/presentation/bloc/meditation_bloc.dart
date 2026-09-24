import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

// ── Events ────────────────────────────────────────────────────────────────────

abstract class MeditationEvent extends Equatable {
  const MeditationEvent();
  @override
  List<Object?> get props => [];
}

class PlayMeditation extends MeditationEvent {
  const PlayMeditation({required this.title, required this.audioAsset});
  final String title;
  final String audioAsset;
  @override
  List<Object?> get props => [title, audioAsset];
}

class PauseMeditation extends MeditationEvent {
  const PauseMeditation();
}

class ResumeMeditation extends MeditationEvent {
  const ResumeMeditation();
}

class StopMeditation extends MeditationEvent {
  const StopMeditation();
}

class MeditationCompleted extends MeditationEvent {
  const MeditationCompleted();
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class MeditationState extends Equatable {
  const MeditationState();
  @override
  List<Object?> get props => [];
}

class MeditationIdle extends MeditationState {
  const MeditationIdle();
}

class MeditationLoading extends MeditationState {
  const MeditationLoading({required this.title});
  final String title;
  @override
  List<Object?> get props => [title];
}

class MeditationPlaying extends MeditationState {
  const MeditationPlaying({
    required this.title,
    required this.audioAsset,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });
  final String title;
  final String audioAsset;
  final Duration position;
  final Duration duration;
  @override
  List<Object?> get props => [title, audioAsset, position, duration];

  MeditationPlaying copyWith({
    Duration? position,
    Duration? duration,
  }) {
    return MeditationPlaying(
      title: title,
      audioAsset: audioAsset,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}

class MeditationPaused extends MeditationState {
  const MeditationPaused({
    required this.title,
    required this.audioAsset,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });
  final String title;
  final String audioAsset;
  final Duration position;
  final Duration duration;
  @override
  List<Object?> get props => [title, audioAsset, position, duration];
}

class MeditationDone extends MeditationState {
  const MeditationDone({required this.title});
  final String title;
  @override
  List<Object?> get props => [title];
}

class MeditationError extends MeditationState {
  const MeditationError({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  MeditationBloc() : super(const MeditationIdle()) {
    on<PlayMeditation>(_onPlay);
    on<PauseMeditation>(_onPause);
    on<ResumeMeditation>(_onResume);
    on<StopMeditation>(_onStop);
    on<MeditationCompleted>(_onCompleted);

    // Listen for audio completion
    _player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        if (!isClosed) add(const MeditationCompleted());
      }
    });
  }

  final AudioPlayer _player = AudioPlayer();
  final Map<String, File> _extractedFiles = {};

  Future<File> _extractAssetToFile(String assetPath) async {
    if (_extractedFiles.containsKey(assetPath)) {
      return _extractedFiles[assetPath]!;
    }
    final dir = await getTemporaryDirectory();
    // Use a unique temp filename that includes the locale prefix to avoid
    // collisions between e.g. assets/audio/meditation_morning.mp3 and
    // assets/audio/de/meditation_morning.mp3
    final uniqueName =
        assetPath.replaceFirst('assets/audio/', '').replaceAll('/', '_');
    final file = File('${dir.path}/$uniqueName');
    // Always overwrite if asset path changed to clear stale cache
    final data = await rootBundle.load(assetPath);
    await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
    await Future.delayed(const Duration(milliseconds: 200));
    _extractedFiles[assetPath] = file;
    return file;
  }

  @override
  Future<void> close() async {
    await _player.dispose();
    return super.close();
  }

  Future<void> _onPlay(
      PlayMeditation event, Emitter<MeditationState> emit) async {
    emit(MeditationLoading(title: event.title));
    try {
      await _player.stop();
      final file = await _extractAssetToFile(event.audioAsset);
      debugPrint('[MeditationBloc] Playing: ${file.path}');
      await _player.setFilePath(file.path);
      await _player.setLoopMode(LoopMode.off); // Play once
      await _player.setVolume(1.0);
      final duration = _player.duration ?? Duration.zero;
      await _player.play();

      emit(MeditationPlaying(
        title: event.title,
        audioAsset: event.audioAsset,
        duration: duration,
      ));
    } catch (e) {
      debugPrint('[MeditationBloc] Error: $e');
      emit(MeditationError(message: e.toString()));
      emit(const MeditationIdle());
    }
  }

  Future<void> _onPause(
      PauseMeditation event, Emitter<MeditationState> emit) async {
    final current = state;
    if (current is MeditationPlaying) {
      await _player.pause();
      emit(MeditationPaused(
        title: current.title,
        audioAsset: current.audioAsset,
        position: _player.position,
        duration: current.duration,
      ));
    }
  }

  Future<void> _onResume(
      ResumeMeditation event, Emitter<MeditationState> emit) async {
    final current = state;
    if (current is MeditationPaused) {
      await _player.play();
      emit(MeditationPlaying(
        title: current.title,
        audioAsset: current.audioAsset,
        position: current.position,
        duration: current.duration,
      ));
    }
  }

  Future<void> _onStop(
      StopMeditation event, Emitter<MeditationState> emit) async {
    await _player.stop();
    emit(const MeditationIdle());
  }

  Future<void> _onCompleted(
      MeditationCompleted event, Emitter<MeditationState> emit) async {
    final current = state;
    if (current is MeditationPlaying) {
      emit(MeditationDone(title: current.title));
    }
  }
}
