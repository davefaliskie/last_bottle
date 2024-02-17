import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';

class Background extends ParallaxComponent {
  Background({required this.speed});

  final double speed;

  @override
  Future<void> onLoad() async {
    final layers = [
      ParallaxImageData('background/1.png'),
      ParallaxImageData('background/2.png'),
      ParallaxImageData('background/3.png'),
      ParallaxImageData('background/4.png'),
    ];

    final baseVelocity = Vector2(0, speed / pow(2, layers.length));

    final velocityMultiplierDelta = Vector2(0.0, 2.0);

    parallax = await game.loadParallax(
      layers,
      baseVelocity: baseVelocity,
      velocityMultiplierDelta: velocityMultiplierDelta,
      filterQuality: FilterQuality.none,
      repeat: ImageRepeat.repeatY,
    );
  }
}
