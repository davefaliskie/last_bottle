import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/bottle_game/bottle_game.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/router.dart';

class BottleGameScreen extends ConsumerStatefulWidget {
  const BottleGameScreen({super.key});

  @override
  ConsumerState<BottleGameScreen> createState() => _BottleGameScreenState();
}

class _BottleGameScreenState extends ConsumerState<BottleGameScreen> {
  late BottleGame game;

  @override
  void initState() {
    super.initState();
    game = getGame();

    // todo what music do we want.
    // if (ref.read(hiveRepositoryProvider).playSound) {
    //   FlameAudio.bgm.initialize();
    //   FlameAudio.bgm.play('bg_game.mp3', volume: 0.3);
    // }
  }

  // Handle the game's End Logic in this callback to access context & ref
  BottleGame getGame() {
    return BottleGame(
      endAndGo: () {
        // todo save completion to hive & then use it to not show this screen again.
        HapticFeedback.heavyImpact();
        context.goNamed(AppRoute.endTrash.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: SizedBox(
              height: gameHeight,
              width: gameWidth,
              child: GameWidget(game: game),
            ),
          ),
        ),
      ),
    );
  }
}
