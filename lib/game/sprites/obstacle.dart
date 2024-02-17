import 'package:flame/components.dart';
import 'package:recycle/game/recycle_game.dart';

class Obstacle extends SpriteComponent with HasGameRef<RecycleGame> {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('trash.png');
    size = Vector2(200, 200);
    anchor = Anchor.center;
  }
}
