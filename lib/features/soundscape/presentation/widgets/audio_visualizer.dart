import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/theme/theme_helper.dart';

/// Animated audio visualizer with bouncing bars.
/// Shows a simple wave animation to indicate audio is playing.
class AudioVisualizer extends StatefulWidget {
  const AudioVisualizer({
    super.key,
    this.barCount = 5,
    this.color = Colors.white,
    this.height = 20.0,
    this.width = 40.0,
  });

  final int barCount;
  final Color color;
  final double height;
  final double width;

  @override
  State<AudioVisualizer> createState() => _AudioVisualizerState();
}

class _AudioVisualizerState extends State<AudioVisualizer>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.barCount, (i) {
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600 + (i * 150)),
      )..repeat(reverse: true);
    });

    _animations = _controllers.map((c) {
      return Tween<double>(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: c, curve: Curves.easeInOut),
      );
    }).toList();

    // Stagger the animations
    for (var i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 80), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barWidth = widget.width / widget.barCount - 2;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(widget.barCount, (index) {
          return AnimatedBuilder(
            animation: _animations[index],
            builder: (context, _) {
              final heightFraction = _animations[index].value;
              return Container(
                width: barWidth,
                height: widget.height * heightFraction,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.7 + (0.3 * heightFraction)),
                  borderRadius: BorderRadius.circular(barWidth / 2),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

/// Circular wave visualizer for the soundscape player.
class CircularAudioVisualizer extends StatefulWidget {
  const CircularAudioVisualizer({
    super.key,
    required this.color,
    this.radius = 80.0,
    this.waveCount = 24,
  });

  final Color color;
  final double radius;
  final int waveCount;

  @override
  State<CircularAudioVisualizer> createState() =>
      _CircularAudioVisualizerState();
}

class _CircularAudioVisualizerState extends State<CircularAudioVisualizer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _random = math.Random();
  late List<double> _heights;

  @override
  void initState() {
    super.initState();
    _heights = List.generate(
        widget.waveCount, (_) => 0.3 + _random.nextDouble() * 0.7);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(_updateHeights);
    _controller.repeat();
  }

  void _updateHeights() {
    if (mounted && _controller.value > 0.9) {
      setState(() {
        _heights = List.generate(
            widget.waveCount, (_) => 0.3 + _random.nextDouble() * 0.7);
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateHeights);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.radius * 2,
      height: widget.radius * 2,
      child: CustomPaint(
        painter: _CircularWavePainter(
          heights: _heights,
          color: widget.color,
          progress: _controller.value,
          radius: widget.radius,
        ),
      ),
    );
  }
}

class _CircularWavePainter extends CustomPainter {
  const _CircularWavePainter({
    required this.heights,
    required this.color,
    required this.progress,
    required this.radius,
  });

  final List<double> heights;
  final Color color;
  final double progress;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color.withOpacity(0.6)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final count = heights.length;
    for (var i = 0; i < count; i++) {
      final angle = (i / count) * 2 * math.pi;
      final innerRadius = radius * 0.6;
      final outerRadius = innerRadius + (radius * 0.35 * heights[i]);

      final startX = center.dx + innerRadius * math.cos(angle);
      final startY = center.dy + innerRadius * math.sin(angle);
      final endX = center.dx + outerRadius * math.cos(angle);
      final endY = center.dy + outerRadius * math.sin(angle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(_CircularWavePainter old) =>
      old.progress != progress || old.heights != heights;
}
