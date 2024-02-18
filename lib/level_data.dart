import 'package:flame/components.dart';
import 'package:recycle/constants.dart';

class LevelData {
  final leftSide = -(gameWidth / 2) + (obstacleWidth / 2);
  final rightSide = (gameWidth / 2) - (obstacleWidth / 2);
  final initialMaxHeight = -(gameHeight / 2);

  // A level can fill extendedHeight (Y).
  // First determine how many rows of obsticles we'll have
  // with each row being a height of obstacleHeight * 3

  // 19 "rows"
  final obstacleSpacing = (obstacleHeight * 2);

  List<Vector2> level1() {
    List<Vector2> level = [];

    level.addAll(leftRight(yPosition: obstacleSpacing * 0));

    level.addAll(middleBlocked(yPosition: obstacleSpacing * 1));

    level.addAll(singleLeftWall(yPosition: obstacleSpacing * 2));
    level.addAll(singleLeft(yPosition: obstacleSpacing * 2));

    level.addAll(singleRight(yPosition: obstacleSpacing * 3));

    level.addAll(middleGaped(yPosition: obstacleSpacing * 4));

    level.addAll(tripple(yPosition: obstacleSpacing * 5));

    // REPEATING

    level.addAll(leftRight(yPosition: obstacleSpacing * 6));

    level.addAll(middleBlocked(yPosition: obstacleSpacing * 7));

    level.addAll(singleLeftWall(yPosition: obstacleSpacing * 8));
    level.addAll(singleLeft(yPosition: obstacleSpacing * 8));

    level.addAll(singleRight(yPosition: obstacleSpacing * 9));

    level.addAll(middleGaped(yPosition: obstacleSpacing * 10));

    level.addAll(tripple(yPosition: obstacleSpacing * 11));

    level.addAll(leftRight(yPosition: obstacleSpacing * 12));

    level.addAll(middleBlocked(yPosition: obstacleSpacing * 13));

    level.addAll(singleLeftWall(yPosition: obstacleSpacing * 14));
    level.addAll(singleLeft(yPosition: obstacleSpacing * 15));

    level.addAll(singleRight(yPosition: obstacleSpacing * 16));

    level.addAll(middleGaped(yPosition: obstacleSpacing * 17));

    level.addAll(tripple(yPosition: obstacleSpacing * 18));

    return level;
  }

  List<Vector2> leftRight({required double yPosition}) {
    return [
      Vector2(leftSide, yPosition),
      Vector2(rightSide, yPosition),
    ];
  }

  List<Vector2> singleLeftWall({required double yPosition}) {
    return [
      Vector2(leftSide, yPosition),
    ];
  }

  List<Vector2> singleRightWall({required double yPosition}) {
    return [
      Vector2(rightSide, yPosition),
    ];
  }

  List<Vector2> singleLeft({required double yPosition}) {
    return [
      Vector2(-(gameWidth / 4), yPosition),
    ];
  }

  List<Vector2> singleRight({required double yPosition}) {
    return [
      Vector2((gameWidth / 4), yPosition),
    ];
  }

  List<Vector2> middleGaped({required double yPosition}) {
    return [
      Vector2(-(gameWidth / 5), yPosition),
      Vector2((gameWidth / 5), yPosition),
    ];
  }

  List<Vector2> middleBlocked({required double yPosition}) {
    return [
      Vector2(-obstacleWidth, yPosition),
      Vector2(0, yPosition),
      Vector2(obstacleWidth, yPosition),
    ];
  }

  List<Vector2> tripple({required double yPosition}) {
    return [
      Vector2(leftSide, yPosition),
      Vector2(0, yPosition),
      Vector2(rightSide, yPosition),
    ];
  }
}
