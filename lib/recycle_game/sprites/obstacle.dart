import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/recycle_game/sprites/player.dart';
import 'package:logger/logger.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<RecycleGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    this.cirlceHitbox = false,
  });

  final String spritePath;
  final bool cirlceHitbox;
  final log = Logger();

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
      log.d("Hit Trash");
      other.removeFromParent();
      game.endAndGo(GameEndState.trash);
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
      log.d("Hit Water");
      other.removeFromParent();
      game.endAndGo(GameEndState.water);
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
      log.d("Hit Fire");
      other.removeFromParent();
      game.endAndGo(GameEndState.fire);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class BinTrash extends Obstacle {
  BinTrash() : super(spritePath: 'bin_trash.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      log.d("Went in Trash Bin");
      other.removeFromParent();
      game.endAndGo(GameEndState.trash);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class BinRecycle extends Obstacle {
  BinRecycle() : super(spritePath: 'bin_recycle.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      log.d("Went to Recycling Bin");
      other.removeFromParent();
      game.endAndGo(GameEndState.recycle);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
