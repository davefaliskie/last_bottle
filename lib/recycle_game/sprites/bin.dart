import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recycle/recycle_game/recycle_game.dart';
import 'package:recycle/recycle_game/sprites/obstacle.dart';
import 'package:recycle/recycle_game/sprites/player.dart';
import 'package:recycle/router.dart';

class Bin extends SpriteComponent
    with HasGameRef<RecycleGame>, CollisionCallbacks {
  Bin({
    required this.spritePath,
  });

  final String spritePath;

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
      debugPrint("Went in Trash Bin");
      game.endAndGo(AppRoute.endTrash);
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
      debugPrint("Went to Recycling Bin");
      game.endAndGo(AppRoute.endRecycle);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
