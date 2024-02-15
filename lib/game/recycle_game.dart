import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/game/sprites/player.dart';

class RecycleGame extends FlameGame
    with KeyboardEvents, HorizontalDragDetector {
  late Player player;
  bool moveLeft = false;
  bool moveRight = false;

  RecycleGame()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    player = Player();
    await add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (moveLeft) {
      player.move(-400 * dt); // Adjust speed as necessary
    }
    if (moveRight) {
      player.move(400 * dt); // Adjust speed as necessary
    }
  }

  @override
  Color backgroundColor() {
    return Colors.blue;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    if (info.delta.global.x > 0) {
      // Dragging right
      moveRight = true;
      moveLeft = false;
    } else if (info.delta.global.x < 0) {
      // Dragging left
      moveLeft = true;
      moveRight = false;
    }
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      moveRight = true;
      moveLeft = false;
      return KeyEventResult.handled;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      moveRight = false;
      moveLeft = true;
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
