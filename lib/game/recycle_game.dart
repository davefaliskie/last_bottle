import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/game/components/background.dart';
import 'package:recycle/game/recycle_world.dart';

class RecycleGame extends FlameGame<RecycleWorld> {
  RecycleGame()
      : super(
          world: RecycleWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // todo set speed based on level
    camera.backdrop.add(Background(speed: 100));
  }
}
