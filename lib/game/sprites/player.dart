import 'package:flame/components.dart';
import 'package:recycle/constants.dart';

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

    // if (newYPosition > 0) {
    //   newYPosition = position.y + (50 * dt);
    // }

    // THIS PREVENTS GOING PAST BOTTOM
    if (newYPosition > (gameRef.size.y / 2) - (size.y / 2)) {
      newYPosition = (gameRef.size.y / 2) - (size.y / 2);
    }

    // Apply the calculated or adjusted Y position
    position.y = newYPosition;
  }

  void move(double deltaX) {
    double newXPosition = position.x + deltaX;

    // Ensure the player does not move off-screen
    double minX = -gameRef.size.x / 2 + size.x / 2; // Left boundary
    double maxX = gameRef.size.x / 2 - size.x / 2; // Right boundary
    newXPosition = newXPosition.clamp(minX, maxX);

    position.x = newXPosition;
  }
}
