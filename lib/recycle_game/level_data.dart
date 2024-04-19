import 'dart:math';

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

// Levels should have MAX 15 total rows (0..14)

class LevelData {
  final leftSide = -(gameWidth / 2) + (obstacleSize / 2);
  final rightSide = (gameWidth / 2) - (obstacleSize / 2);
  final initialMaxHeight = -(gameHeight / 2);
  final obstacleSpacing = obstacleSize + (playerHeight * 2);
  final random = Random();

  List<ObstacleData> getLevel(int levelNumber) {
    final Map<int, List<ObstacleData> Function()> levelConfigs = {
      1: () => _level1(),
      2: () => _level2(),
      3: () => _level3(),
      4: () => _level4(),
      5: () => _level5(),
    };
    if (levelConfigs.containsKey(levelNumber)) {
      return levelConfigs[levelNumber]!();
    } else {
      throw Exception('Level not found');
    }
  }

  // Easy Just Trash
  List<ObstacleData> _level1() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item2: ObstacleType.trash,
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
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item1: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.trash,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.binRecycle,
      item2: ObstacleType.binTrash,
      item3: ObstacleType.binRecycle,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binRecycle,
    ));

    return level;
  }

  // Water Introduced
  List<ObstacleData> _level2() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.trash,
      item2: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item1: ObstacleType.water,
      item3: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 3,
      item1: ObstacleType.trash,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item3: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item1: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item2: ObstacleType.binTrash,
      item4: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item1: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.water,
      item2: ObstacleType.trash,
      item3: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item3: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.binRecycle,
      item2: ObstacleType.binTrash,
      item3: ObstacleType.binTrash,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binRecycle,
    ));

    return level;
  }

  // Fire Introduced
  List<ObstacleData> _level3() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item3: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 3,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item1: ObstacleType.water,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item2: ObstacleType.water,
      item3: ObstacleType.fire,
      item4: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item4: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item1: ObstacleType.binTrash,
      item2: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item3: ObstacleType.fire,
      item4: ObstacleType.water,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.fire,
      item4: ObstacleType.fire,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 13,
      item3: ObstacleType.binTrash,
      item4: ObstacleType.binRecycle,
      item5: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 14,
      item2: ObstacleType.binRecycle,
    ));

    return level;
  }

  // Turtle Introduced (on game world)
  List<ObstacleData> _level4() {
    List<ObstacleData> level = [];

    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.fire,
      item2: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item1: ObstacleType.trash,
      item3: ObstacleType.trash,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item2: ObstacleType.fire,
      item4: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 3,
      item1: ObstacleType.fire,
      item3: ObstacleType.trash,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item4: ObstacleType.water,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item1: ObstacleType.water,
      item2: ObstacleType.water,
      item3: ObstacleType.water,
      item5: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item1: ObstacleType.fire,
      item2: ObstacleType.fire,
      item4: ObstacleType.trash,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item1: ObstacleType.binTrash,
      item3: ObstacleType.fire,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item1: ObstacleType.binTrash,
      item2: ObstacleType.binTrash,
      item4: ObstacleType.binTrash,
      item5: ObstacleType.binTrash,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item1: ObstacleType.trash,
      item2: ObstacleType.water,
      item4: ObstacleType.trash,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item1: ObstacleType.trash,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
      item5: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item1: ObstacleType.trash,
      item2: ObstacleType.fire,
      item3: ObstacleType.fire,
      item4: ObstacleType.water,
    ));

    level.addAll(obstacleRow(
      row: 12,
      item1: ObstacleType.fire,
      item2: ObstacleType.trash,
      item3: ObstacleType.trash,
      item4: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 13,
      item1: ObstacleType.fire,
      item4: ObstacleType.fire,
      item5: ObstacleType.fire,
    ));

    level.addAll(obstacleRow(
      row: 14,
      item1: ObstacleType.fire,
      item3: ObstacleType.binRecycle,
      item5: ObstacleType.fire,
    ));

    return level;
  }

  // Randmly Generated Objects
  List<ObstacleData> _level5() {
    List<ObstacleData> level = [];

    // randomly generate the rows
    for (int row = 0; row <= 13; row++) {
      final generatedItems = randomRowObstacles();
      level.addAll(obstacleRow(
        row: row,
        item1: generatedItems[0],
        item2: generatedItems[1],
        item3: generatedItems[2],
        item4: generatedItems[3],
        item5: generatedItems[4],
      ));
    }

    // put the recycle bin in the final row at a random spot
    final endBinSpace = random.nextInt(5) + 1;
    level.addAll(obstacleRow(
      row: 14,
      item1: endBinSpace == 1 ? ObstacleType.binRecycle : null,
      item2: endBinSpace == 2 ? ObstacleType.binRecycle : null,
      item3: endBinSpace == 3 ? ObstacleType.binRecycle : null,
      item4: endBinSpace == 4 ? ObstacleType.binRecycle : null,
      item5: endBinSpace == 5 ? ObstacleType.binRecycle : null,
    ));
    return level;
  }

  List<ObstacleType?> randomRowObstacles() {
    final availableObjects = [
      ObstacleType.trash,
      ObstacleType.water,
      ObstacleType.fire,
      ObstacleType.binTrash,
      null,
    ];

    // ensure at least one item is null
    List<ObstacleType?> result = [null];

    // fill list with 4 more random items
    for (int item = 1; item <= 4; item++) {
      int randomIndex = random.nextInt(availableObjects.length);
      result.add(availableObjects[randomIndex]);
    }

    result.shuffle(random);
    return result;
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
