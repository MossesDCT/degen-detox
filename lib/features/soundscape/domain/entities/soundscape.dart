import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Domain entity for an audio soundscape.
class Soundscape extends Equatable {
  const Soundscape({
    required this.id,
    required this.name,
    required this.description,
    required this.audioPath,
    required this.emoji,
    required this.primaryColor,
    required this.secondaryColor,
    this.isProOnly = false,
  });

  final String id;
  final String name;
  final String description;
  final String audioPath; // Asset or URL path
  final String emoji;
  final Color primaryColor;
  final Color secondaryColor;
  final bool isProOnly;

  LinearGradient get gradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [primaryColor, secondaryColor],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        audioPath,
        emoji,
        primaryColor,
        secondaryColor,
        isProOnly
      ];
}
