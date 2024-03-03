import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/recycle_game/sprites/bin.dart';
import 'package:last_bottle/recycle_game/sprites/obstacle.dart';
import 'package:last_bottle/recycle_game/sprites/player.dart';
import 'package:last_bottle/recycle_game/level_data.dart';
import 'package:last_bottle/recycle_game/sprites/turtle.dart';

class RecycleWorld extends World with HasGameRef<RecycleGame> {
  RecycleWorld({super.children});

  late final Player player;

  void loadLevel(List<ObstacleData> levelData) {
    // remove any existing Obstacles
    removeAll(children.whereType<Obstacle>().toList());

    // load new obstacles from level data
    for (var data in levelData) {
      Obstacle obstacle;
      if (data.type == ObstacleType.trash) {
        obstacle = ObstacleTrash()..position = data.position;
      } else if (data.type == ObstacleType.water) {
        obstacle = ObstacleWater()..position = data.position;
      } else if (data.type == ObstacleType.fire) {
        obstacle = ObstacleFire()..position = data.position;
      } else if (data.type == ObstacleType.binTrash) {
        obstacle = BinTrash()..position = data.position;
      } else if (data.type == ObstacleType.binRecycle) {
        obstacle = BinRecycle()..position = data.position;
      } else {
        continue;
      }
      add(obstacle);
    }
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // Add player first so it's behind trash
    player = Player();
    add(player);

    loadLevel(LevelData().getLevel(game.level));

    if (game.level >= 4) {
      // Add Turtle to level 4+
      final randomHeight =
          (gameHeight / 2) + Random().nextDouble() * gameHeight;

      final startPosition = Vector2(gameWidth / 2, randomHeight);
      final velocity = Vector2(-300, -200);
      final turtle = Turtle(
        velocity: velocity,
        position: startPosition,
      );
      add(turtle);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacle>().forEach((obstacle) {
      // Move obstacles up at the same rate the player was falling
      // THIS determines the speed of the game.
      obstacle.position.y -= (600 * dt);

      // Optionally, respawn or recycle obstacles that move off-screen
      if (obstacle.position.y < -(gameRef.size.y / 2)) {
        obstacle.position.y += extendedHeight;
      }
    });
  }
}
