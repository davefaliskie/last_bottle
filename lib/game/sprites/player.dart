import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('bottle.png');
    size = Vector2.all(100);
    position = Vector2(0, -(gameRef.size.y / 2) + (size.y / 2));
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // This makes the sprite fall down
    double newYPosition = position.y + (100 * dt);

    // THIS PREVENTS GOING PAST BOTTOM
    if (newYPosition > (gameRef.size.y / 2) - (size.y / 2)) {
      newYPosition = (gameRef.size.y / 2) - (size.y / 2);
    }

    // Apply the calculated or adjusted Y position
    position.y = newYPosition;
  }

  void move(double deltaX) {
    final newX = position.x + deltaX;

    if (newX >= size.x / 2 && newX <= gameRef.size.x - size.x / 2) {
      position.add(Vector2(deltaX, 0));
    }
  }
}
