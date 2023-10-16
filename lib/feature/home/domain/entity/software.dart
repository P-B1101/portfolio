import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Software extends Equatable {
  final String title;
  final String image;
  final Color color;

  const Software({
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  List<Object?> get props => [
        title,
        image,
        color,
      ];
}
