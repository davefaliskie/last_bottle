import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/recycle_game/sprites/obstacle.dart';
import 'package:last_bottle/recycle_game/sprites/player.dart';
import 'package:logger/logger.dart';

class Bin extends SpriteComponent
    with HasGameRef<RecycleGame>, CollisionCallbacks {
  Bin({
    required this.spritePath,
  });

  final String spritePath;
  final log = Logger();

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    // size = Vector2(300, 300);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  bool onComponentTypeCheck(PositionComponent other) {
    if (other is Obstacle || other is Bin) {
      // do NOT collide with Other Obsticles or Bins
      return false;
    }
    return super.onComponentTypeCheck(other);
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
