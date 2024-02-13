import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/game/sprites/player.dart';

class RecycleGame extends FlameGame {
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

    world.add(Player(
      position: Vector2(-270, 0),
      radius: 270.0,
    ));

    world.add(Player(
      position: Vector2(270, 0),
      radius: 270.0,
      color: Colors.white,
    ));
  }

  @override
  Color backgroundColor() {
    return Colors.blue;
  }
}
