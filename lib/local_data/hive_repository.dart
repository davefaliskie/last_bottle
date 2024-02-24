import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'hive_repository.g.dart';

class HiveRepository {
  String get userId {
    if (Hive.box("gameData").get("userId") != null) {
      return Hive.box("gameData").get("userId");
    } else {
      final newId = const Uuid().v4();
      Hive.box("gameData").put("userId", newId);
      return newId;
    }
  }
}

@Riverpod(keepAlive: true)
HiveRepository hiveRepository(HiveRepositoryRef ref) {
  return HiveRepository();
}
