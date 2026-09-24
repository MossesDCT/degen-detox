import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

/// Full-screen video splash that plays the logo animation once,
/// then navigates to the next route via [onComplete].
///
/// The video is scaled with [BoxFit.cover] so it fills the entire
/// screen on any device aspect ratio — no black bars.
class SplashVideoPage extends StatefulWidget {
  const SplashVideoPage({super.key, required this.onComplete});

  /// Called when the video finishes (or after a safety timeout).
  final VoidCallback onComplete;

  @override
  State<SplashVideoPage> createState() => _SplashVideoPageState();
}

class _SplashVideoPageState extends State<SplashVideoPage> {
  late VideoPlayerController _controller;
  bool _finished = false;

  // Dark green matching the video's dark gradient edge
  static const _bgColor = Color(0xFF04180A);

  @override
  void initState() {
    super.initState();

    // Immersive mode — hide status bar + navigation bar during splash
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _controller = VideoPlayerController.asset('assets/video/splash_logo.mp4')
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {});
        _controller.play();
      }).catchError((_) {
        _complete();
      });

    _controller.addListener(_onVideoUpdate);

    // Safety timeout — never block longer than 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (!_finished) _complete();
    });
  }

  void _onVideoUpdate() {
    if (_controller.value.isInitialized &&
        _controller.value.position >= _controller.value.duration &&
        _controller.value.duration > Duration.zero) {
      _complete();
    }
  }

  void _complete() {
    if (_finished) return;
    _finished = true;

    // Restore system UI
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    widget.onComplete();
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideoUpdate);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: _controller.value.isInitialized
          ? _FullScreenVideo(controller: _controller)
          : const SizedBox.expand(), // dark bg while loading
    );
  }
}

/// Renders the video so it covers the full screen (like a wallpaper).
/// On taller screens the top/bottom of the video is cropped — the logo
/// in the center always stays visible.
class _FullScreenVideo extends StatelessWidget {
  const _FullScreenVideo({required this.controller});
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final videoSize = controller.value.size;

    // Calculate scale so video covers entire screen
    final scaleX = screenSize.width / videoSize.width;
    final scaleY = screenSize.height / videoSize.height;
    final scale = scaleX > scaleY ? scaleX : scaleY; // max → cover

    final scaledW = videoSize.width * scale;
    final scaledH = videoSize.height * scale;

    return Stack(
      children: [
        // Positioned to center the video (overflow is clipped by Stack)
        Positioned(
          left: (screenSize.width - scaledW) / 2,
          top: (screenSize.height - scaledH) / 2,
          width: scaledW,
          height: scaledH,
          child: VideoPlayer(controller),
        ),
      ],
    );
  }
}
