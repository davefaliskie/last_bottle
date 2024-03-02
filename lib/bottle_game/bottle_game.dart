import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:last_bottle/bottle_game/bottle.dart';
import 'package:last_bottle/constants.dart';
import 'package:logger/logger.dart';

class BottleGame extends FlameGame
    with HorizontalDragDetector, VerticalDragDetector {
  BottleGame({
    required this.endAndGo,
  }) : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final void Function() endAndGo;
  final log = Logger();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugMode = true;

    // camera.backdrop.add(Background(speed: 10));
    final bottle = Bottle();
    world.add(bottle);
  }

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    log.d("moved horizontal");
  }
}
