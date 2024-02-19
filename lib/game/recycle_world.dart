import 'dart:async';

import 'package:flame/components.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/game/recycle_game.dart';
import 'package:recycle/game/sprites/bin.dart';
import 'package:recycle/game/sprites/obstacle.dart';
import 'package:recycle/game/sprites/player.dart';
import 'package:recycle/level_data.dart';

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

    loadLevel(LevelData().level1());

    // Add player last so it's on top.
    player = Player();
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacle>().forEach((obstacle) {
      // Move obstacles up at the same rate the player was falling
      obstacle.position.y -= (400 * dt);

      // Optionally, respawn or recycle obstacles that move off-screen
      if (obstacle.position.y < -(gameRef.size.y / 2)) {
        obstacle.position.y += extendedHeight;
      }
    });
  }
}
