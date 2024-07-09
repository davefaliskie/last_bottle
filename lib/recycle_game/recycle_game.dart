import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/recycle_game/recycle_world.dart';

class RecycleGame extends FlameGame<RecycleWorld>
    with HorizontalDragDetector, KeyboardEvents, HasCollisionDetection {
  RecycleGame({
    required this.level,
    required this.endAndGo,
  }) : super(
          world: RecycleWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final int level;
  final void Function(GameEndState endState) endAndGo;

  @override
  Color backgroundColor() {
    return Colors.white;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    const double sensitivity = 1.0;
    world.player.move(info.delta.global.x * sensitivity);
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    const double moveSpeed = 55.0;

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        world.player.move(moveSpeed);
        return KeyEventResult.handled;
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        world.player.move(-moveSpeed);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}
