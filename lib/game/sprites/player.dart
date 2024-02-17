import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('bottle.png');
    size = Vector2.all(100);
    position = Vector2(0, -(gameRef.size.y / 2));
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // This makes the sprite fall down
    double newYPosition = position.y + (300 * dt);

    // Check if the new Y position is greater than the game height minus half the sprite size
    // If so, set the Y position to the bottom of the game area
    if (newYPosition > gameRef.size.y - size.y / 2) {
      newYPosition = gameRef.size.y - size.y / 2;
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
