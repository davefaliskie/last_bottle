import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/localization/app_localizations_provider.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'hive_repository.g.dart';

class HiveRepository {
  HiveRepository(this.ref);
  final Ref ref;

  final log = Logger();
  final box = Hive.box("gameData");

  dynamic getValue(String key) {
    return box.get(key);
  }

  void setIntroComplete() {
    box.put("introComplete", true);
    log.d("BOX: ${box.toMap()}");
  }

  // given a key this will return the precent that key's value is of the totalAttempts
  String percentOfTotalAttempts(String key) {
    final totalAttempt = getValue("totalAttempts") ?? 0;
    int portion = getValue(key) ?? 0;

    if (totalAttempt == 0) {
      return ref.watch(appLocalizationsProvider).zero;
    }

    if (key == "trashEndCount") {
      int failedSpins = getValue("trashSpinEndCount") ?? 0;
      portion += failedSpins;
    }

    double percent = (portion / totalAttempt) * 100;
    if (percent == 0) {
      return ref.watch(appLocalizationsProvider).zero;
    }
    return "${percent.toStringAsFixed(1)}%";
  }

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

    awardPasses();
    log.d("BOX: ${box.toMap()}");
  }

  void saveSpin({required bool didWin}) {
    if (didWin == true) {
      final winEndCount = box.get("winEndCount", defaultValue: 0);
      box.put("winEndCount", winEndCount + 1);
    } else {
      final trashEndCount = box.get("trashSpinEndCount", defaultValue: 0);
      box.put("trashSpinEndCount", trashEndCount + 1);
    }
    awardPasses();
    log.d("BOX: ${box.toMap()}");
  }

  // The level will be set based on the attempt conditions
  int setLevel() {
    final recycleEnd = box.get("recycleEndCount", defaultValue: 0);
    log.d("LEVEL: ${(recycleEnd + 1).clamp(1, 5)}");
    return (recycleEnd + 1).clamp(1, 5);
  }

  bool canWin() {
    // don't allow winning until player's 6th attempted so they see all levels
    if (box.get("recycleEndCount", defaultValue: 0) > 5) {
      return true;
    }
    return false;
  }

  // This is called after each game ends,
  // passes are awarded based on specific data numbers.
  // passes can't be "lost", and maybe set to true multiple time but that's okay for now
  // * Each PassType should have a condition to be marked true
  void awardPasses() {
    if (box.get("trashEndCount", defaultValue: 0) == 1) {
      box.put("${PassType.trash.name}PassAwarded", true);
    }

    if (box.get("waterEndCount", defaultValue: 0) == 1) {
      box.put("${PassType.water.name}PassAwarded", true);
    }

    if (box.get("fireEndCount", defaultValue: 0) == 1) {
      box.put("${PassType.fire.name}PassAwarded", true);
    }

    if (box.get("turtleEndCount", defaultValue: 0) == 1) {
      box.put("${PassType.turtle.name}PassAwarded", true);
    }

    if (box.get("recycleEndCount", defaultValue: 0) == 5) {
      box.put("${PassType.recycle.name}PassAwarded", true);
    }

    if (box.get("winEndCount", defaultValue: 0) == 1) {
      box.put("${PassType.recycleSuccess.name}PassAwarded", true);
    }
  }

  // see if a pass was awarded by passType
  bool passAwarded(PassType passType) {
    return box.get("${passType.name}PassAwarded", defaultValue: false);
  }

  // bool get playSound {
  //   return box.get("playSound", defaultValue: true);
  // }

  // void togglePlaySound() {
  //   box.put("playSound", !playSound);
  // }

  void resetGame() {
    Hive.box("gameData").clear();
  }
}

@Riverpod(keepAlive: true)
HiveRepository hiveRepository(HiveRepositoryRef ref) {
  return HiveRepository(ref);
}

@riverpod
class CanPlaySound extends _$CanPlaySound {
  @override
  bool build() => Hive.box("gameData").get("playSound", defaultValue: true);

  void toggle() {
    final canPlay = Hive.box("gameData").get("playSound", defaultValue: true);
    Hive.box("gameData").put("playSound", !canPlay);
    state = !canPlay;
  }
}
