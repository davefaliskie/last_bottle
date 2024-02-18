import 'package:flame/components.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/game/recycle_game.dart';

class Obstacle extends SpriteComponent with HasGameRef<RecycleGame> {
  Obstacle({
    required this.spritePath,
  });

  final String spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2(obstacleWidth, obstacleHeight);
    anchor = Anchor.center;
  }
}

class ObstacleTrash extends Obstacle {
  ObstacleTrash() : super(spritePath: 'trash.png');
}

class ObstacleWater extends Obstacle {
  ObstacleWater() : super(spritePath: 'water.png');
}
