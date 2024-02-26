import 'package:flame/components.dart';
import 'package:last_bottle/constants.dart';

enum ObstacleType {
  trash,
  water,
  binTrash,
  binRecycle,
}

class ObstacleData {
  final Vector2 position;
  final ObstacleType type;

  ObstacleData({required this.position, required this.type});
}

class LevelData {
  final leftSide = -(gameWidth / 2) + (obstacleSize / 2);
  final rightSide = (gameWidth / 2) - (obstacleSize / 2);
  final initialMaxHeight = -(gameHeight / 2);

  // A level can fill extendedHeight (Y).
  // First determine how many rows of obsticles we'll have
  // with each row being a height of obstacleHeight * 3

  // 19 "rows"
  final obstacleSpacing = (obstacleSize * 2);

  List<ObstacleData> level1() {
    List<ObstacleData> level = [];

    level.addAll(leftRight(
      yPosition: obstacleSpacing * 0,
      type: ObstacleType.water,
    ));

    level.addAll(middleBlocked(yPosition: obstacleSpacing * 1));

    level.addAll(singleLeftWall(
      yPosition: obstacleSpacing * 2,
      type: ObstacleType.binRecycle,
    ));
    level.addAll(singleLeft(yPosition: obstacleSpacing * 2));

    level.addAll(singleRight(
      yPosition: obstacleSpacing * 3,
      type: ObstacleType.water,
    ));

    level.addAll(middleGaped(yPosition: obstacleSpacing * 4));

    level.addAll(tripple(yPosition: obstacleSpacing * 5));

    // REPEATING

    level.addAll(leftRight(
      yPosition: obstacleSpacing * 6,
      type: ObstacleType.water,
    ));

    level.addAll(middleBlocked(yPosition: obstacleSpacing * 7));

    level.addAll(singleLeftWall(yPosition: obstacleSpacing * 8));
    level.addAll(singleLeft(yPosition: obstacleSpacing * 8));

    level.addAll(singleRight(yPosition: obstacleSpacing * 9));

    level.addAll(middleGaped(
      yPosition: obstacleSpacing * 10,
      type: ObstacleType.water,
    ));

    level.addAll(tripple(yPosition: obstacleSpacing * 11));

    level.addAll(leftRight(yPosition: obstacleSpacing * 12));

    level.addAll(middleBlocked(yPosition: obstacleSpacing * 13));

    level.addAll(singleLeftWall(yPosition: obstacleSpacing * 14));
    level.addAll(singleLeft(yPosition: obstacleSpacing * 15));

    level.addAll(singleRight(yPosition: obstacleSpacing * 16));

    level.addAll(middleGaped(yPosition: obstacleSpacing * 17));

    level.addAll(tripple(yPosition: obstacleSpacing * 18));

    // ADD ROW OF BINS AT extendedHeight
    level.addAll(
      tripple(
        yPosition: extendedHeight,
        type: ObstacleType.binTrash,
      ),
    );

    level.addAll(
      middleGaped(
        yPosition: extendedHeight,
        type: ObstacleType.binRecycle,
      ),
    );

    return level;
  }

  List<ObstacleData> leftRight({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2(leftSide, yPosition),
        type: type,
      ),
      ObstacleData(
        position: Vector2(rightSide, yPosition),
        type: type,
      ),
    ];
  }

  List<ObstacleData> singleLeftWall({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2(leftSide, yPosition),
        type: type,
      ),
    ];
  }

  List<ObstacleData> singleRightWall({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2(rightSide, yPosition),
        type: type,
      ),
    ];
  }

  List<ObstacleData> singleLeft({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2(-(gameWidth / 4), yPosition),
        type: type,
      ),
    ];
  }

  List<ObstacleData> singleRight({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2((gameWidth / 4), yPosition),
        type: type,
      ),
    ];
  }

  List<ObstacleData> middleGaped({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2(-(gameWidth / 5), yPosition),
        type: type,
      ),
      ObstacleData(
        position: Vector2((gameWidth / 5), yPosition),
        type: type,
      ),
    ];
  }

  List<ObstacleData> middleBlocked({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2(-obstacleSize, yPosition),
        type: type,
      ),
      ObstacleData(
        position: Vector2(0, yPosition),
        type: type,
      ),
      ObstacleData(
        position: Vector2(obstacleSize, yPosition),
        type: type,
      ),
    ];
  }

  List<ObstacleData> tripple({
    required double yPosition,
    ObstacleType type = ObstacleType.trash,
  }) {
    return [
      ObstacleData(
        position: Vector2(leftSide, yPosition),
        type: type,
      ),
      ObstacleData(
        position: Vector2(0, yPosition),
        type: type,
      ),
      ObstacleData(
        position: Vector2(rightSide, yPosition),
        type: type,
      ),
    ];
  }
}
