import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';

class Player extends SpriteComponent with HasGameRef<RecycleGame> {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('player.png');
    size = Vector2(playerWidth, playerHeight);
    position = Vector2(0, -(gameRef.size.y / 2) + (size.y / 2));
    angle = 0.5;
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    // make the sprite fall down
    double newYPosition = position.y + (400 * dt);

    // don't fall past 1/4 of screen
    if (newYPosition > -(gameHeight / 4)) {
      newYPosition = -(gameHeight / 4);
    }

    // Apply the calculated or adjusted Y position
    position.y = newYPosition;
  }

  void move(double deltaX) {
    double newXPosition = position.x + deltaX;

    // Ensure the player does not move off-screen
    double minX = -gameRef.size.x / 2 + (size.x + 10); // Left boundary
    double maxX = gameRef.size.x / 2 - (size.x + 10); // Right boundary
    newXPosition = newXPosition.clamp(minX, maxX);

    position.x = newXPosition;
  }
}
