import 'package:flame/components.dart';
import 'package:last_bottle/constants.dart';

enum ObstacleType {
  trash,
  water,
  fire,
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
  final obstacleSpacing = obstacleSize + (playerHeight * 2);

  List<ObstacleData> getLevel(int levelNumber) {
    final Map<int, List<ObstacleData> Function()> levelConfigs = {
      1: () => _level1(),
      2: () => _level2(),
    };
    if (levelConfigs.containsKey(levelNumber)) {
      return levelConfigs[levelNumber]!();
    } else {
      throw Exception('Level not found');
    }
  }

  // MAX 15 total rows

  List<ObstacleData> _level1() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item1: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item2: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item1: ObstacleType.binTrash,
      item2: ObstacleType.binTrash,
      item3: ObstacleType.binRecycle,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binTrash,
    ));

    return level;
  }

  List<ObstacleData> _level2() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item1: ObstacleType.water,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item3: ObstacleType.water,
      item4: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item1: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item2: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item1: ObstacleType.binTrash,
      item2: ObstacleType.binTrash,
      item3: ObstacleType.binRecycle,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binTrash,
    ));

    return level;
  }

  // Each obstacleRow can have 5 obstacles. Each will be 1/5 the screen width
  // this means if all 5 are included the player will have to hit one.
  // visually the items will be displayed [1,2,3,4,5]
  //
  // row (int) should be between 0..14
  List<ObstacleData> obstacleRow({
    required int row,
    ObstacleType? item1,
    ObstacleType? item2,
    ObstacleType? item3,
    ObstacleType? item4,
    ObstacleType? item5,
  }) {
    List<ObstacleData> content = [];
    final yPosition = obstacleSpacing * row;

    if (row < 0 || row > 14) {
      throw Exception("Row is out of range must be between 0..14");
    }

    if (item1 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide, yPosition),
          type: item1,
        ),
      );
    }
    if (item2 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide + (gameWidth / 5), yPosition),
          type: item2,
        ),
      );
    }
    if (item3 != null) {
      content.add(
        ObstacleData(
          position: Vector2(0, yPosition),
          type: item3,
        ),
      );
    }
    if (item4 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide - (gameWidth / 5), yPosition),
          type: item4,
        ),
      );
    }
    if (item5 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide, yPosition),
          type: item5,
        ),
      );
    }

    return content;
  }
}
