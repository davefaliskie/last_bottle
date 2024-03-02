import 'package:flame/components.dart';
import 'package:last_bottle/bottle_game/bottle_game.dart';

class Bottle extends SpriteComponent with HasGameRef<BottleGame> {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('display/bottle_full.png');
    size = Vector2.all(300);
    position = Vector2(0, 0);
    anchor = Anchor.center;
  }
}
