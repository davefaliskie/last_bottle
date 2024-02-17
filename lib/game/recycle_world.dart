import 'dart:async';

import 'package:flame/components.dart';
import 'package:recycle/game/sprites/player.dart';

class RecycleWorld extends World with HasGameReference {
  RecycleWorld({super.children});

  late final Player player;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Player();
    add(player);
  }
}
