import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'hive_repository.g.dart';

class HiveRepository {
  final box = Hive.box("gameData");

  String get userId {
    if (box.get("userId") != null) {
      return box.get("userId");
    } else {
      final newId = const Uuid().v4();
      box.put("userId", newId);
      return newId;
    }
  }

  void saveAttempt(GameEndState endState) {
    // increment totalAttempts by one
    final attempts = box.get("totalAttempts", defaultValue: 0);
    box.put("totalAttempts", attempts + 1);

    // based on endState increment related endType by one
    final endCounterKey = "${endState.name}EndCount";
    final endCount = box.get(endCounterKey, defaultValue: 0);
    box.put(endCounterKey, endCount + 1);

    debugPrint("BOX: ${box.toMap()}");
  }

  void saveSpin({required bool didWin}) {
    if (didWin == true) {
      final winEndCount = box.get("winEndCount", defaultValue: 0);
      box.put("winEndCount", winEndCount + 1);
    } else {
      final trashEndCount = box.get("trashEndCount", defaultValue: 0);
      box.put("trashEndCount", trashEndCount + 1);
    }
    debugPrint("BOX: ${box.toMap()}");
  }

  // The level will be set based on the attempt conditions
  int setLevel() {
    // todo calculate which level to show.
    if (box.get("totalAttempts", defaultValue: 0) > 30) {
      return 2;
    }
    return 1;
  }

  bool canWin() {
    // don't allow winning until player has attempted 5x & seen all levels
    if (box.get("recycleEndCount", defaultValue: 0) > 4) {
      return true;
    }
    return false;
  }
}

@Riverpod(keepAlive: true)
HiveRepository hiveRepository(HiveRepositoryRef ref) {
  return HiveRepository();
}
