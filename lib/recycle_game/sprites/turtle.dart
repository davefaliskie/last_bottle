import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/recycle_game/sprites/player.dart';
import 'package:logger/logger.dart';

class Turtle extends SpriteComponent
    with HasGameRef<RecycleGame>, CollisionCallbacks {
  Turtle({
    required this.velocity,
    required position,
  }) : super(position: position);

  final Vector2 velocity;
  final log = Logger();

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('turtle.png');
    size = Vector2(turtleWidth, turtleHeight);
    angle = 0.7;
    anchor = Anchor.center;
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.add(velocity * dt);

    if (position.x < -(gameWidth / 2) - 200) {
      velocity.x = -velocity.x;

      flipHorizontally();
      angle = -0.7;
    }

    if (position.x > (gameWidth / 2) + 200) {
      velocity.x = -velocity.x;
      flipHorizontally();
      angle = 0.7;
    }
  }

  void move(double deltaX) {
    double newXPosition = position.x + deltaX;

    // Ensure the player does not move off-screen
    double minX = -gameRef.size.x / 2 + size.x / 2; // Left boundary
    double maxX = gameRef.size.x / 2 - size.x / 2; // Right boundary
    newXPosition = newXPosition.clamp(minX, maxX);

    position.x = newXPosition;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      log.d("Turtle Hit");
      other.removeFromParent();
      game.endAndGo(GameEndState.turtle);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
