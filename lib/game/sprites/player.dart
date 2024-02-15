import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('bottle.png');
    size = Vector2.all(100);
    position = Vector2(gameRef.size.x / 2, 0 + size.y / 2);
    anchor = Anchor.topCenter;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // This makes the sprite fall down
    position.add(Vector2(0, 100 * dt));
  }

  void move(double deltaX) {
    // Move the player left or right based on the drag delta
    position.add(Vector2(deltaX * 0.5, 0));
  }
}
