import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends CircleComponent {
  Player({
    required super.position,
    required double radius,
    Color color = Colors.orange,
  }) : super(
          radius: radius,
          anchor: Anchor.center,
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
        );
}
