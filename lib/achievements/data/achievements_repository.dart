import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bottle/achievements/domain/achievement.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'achievements_repository.g.dart';

class AchievementsRepository {
  AchievementsRepository(this.ref);
  final Ref ref;

  List<Achievement> getAchievmentsList() {
    List<Achievement> achievements = [];

    // Every PassType will have an associated Achievment
    for (var value in PassType.values) {
      achievements.add(
        Achievement.fromPassType(
          passType: value,
          obtained: ref.watch(hiveRepositoryProvider).passAwarded(value),
          ref: ref,
        ),
      );
    }

    return achievements;
  }
}

@riverpod
AchievementsRepository achievementsRepository(AchievementsRepositoryRef ref) {
  return AchievementsRepository(ref);
}
