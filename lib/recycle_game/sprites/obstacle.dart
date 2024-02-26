import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/recycle_game/sprites/player.dart';
import 'package:last_bottle/router.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<RecycleGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    this.cirlceHitbox = false,
  });

  final String spritePath;
  final bool cirlceHitbox;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;

    if (cirlceHitbox == true) {
      add(CircleHitbox());
    } else {
      add(RectangleHitbox());
    }
  }

  @override
  bool onComponentTypeCheck(PositionComponent other) {
    if (other is Obstacle) {
      // do NOT collide with Other Obsticles
      return false;
    }
    return super.onComponentTypeCheck(other);
  }
}

class ObstacleTrash extends Obstacle {
  ObstacleTrash()
      : super(
          spritePath: 'trash.png',
          cirlceHitbox: true,
        );

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      debugPrint("Hit Trash");
      game.endAndGo(AppRoute.endTrash);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleWater extends Obstacle {
  ObstacleWater()
      : super(
          spritePath: 'water.png',
          cirlceHitbox: true,
        );

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      debugPrint("Hit Water");
      game.endAndGo(AppRoute.endWater);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleFire extends Obstacle {
  ObstacleFire()
      : super(
          spritePath: 'fire.png',
          cirlceHitbox: true,
        );

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      debugPrint("Hit Fire");
      game.endAndGo(AppRoute.endFire);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
