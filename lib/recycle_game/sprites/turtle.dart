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

    // - move turtle left and right at an angle
    // - move off screen by 200 & piviot while also fliping sprite direction
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
