import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/game/recycle_game.dart';
import 'package:recycle/game/sprites/player.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<RecycleGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
  });

  final String spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2(obstacleWidth, obstacleHeight);
    anchor = Anchor.center;
    add(RectangleHitbox());
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
  ObstacleTrash() : super(spritePath: 'trash.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      debugPrint("Hit Trash");
      // removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleWater extends Obstacle {
  ObstacleWater() : super(spritePath: 'water.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      debugPrint("Hit Water");
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
