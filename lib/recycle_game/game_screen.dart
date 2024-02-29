import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/router.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late RecycleGame game;

  @override
  void initState() {
    super.initState();
    game = getGame();

    if (ref.read(hiveRepositoryProvider).playSound) {
      FlameAudio.bgm.initialize();
      FlameAudio.bgm.play('bg_game.mp3', volume: 0.5);
    }
  }

  // Handle the game's End Logic in this callback to access context & ref
  RecycleGame getGame() {
    return RecycleGame(
      level: ref.read(hiveRepositoryProvider).setLevel(),
      endAndGo: (GameEndState endState) {
        // save attempt
        ref.read(hiveRepositoryProvider).saveAttempt(endState);

        // redirect
        switch (endState) {
          case GameEndState.trash:
            context.goNamed(AppRoute.endTrash.name);
            break;
          case GameEndState.water:
            context.goNamed(AppRoute.endWater.name);
            break;
          case GameEndState.fire:
            context.goNamed(AppRoute.endFire.name);
            break;
          case GameEndState.turtle:
            context.goNamed(AppRoute.endTurtle.name);
            break;
          case GameEndState.recycle:
            // go to spin wheel which will redirect to Win/Lose
            context.goNamed(AppRoute.spinWheel.name);
            break;
          case GameEndState.win:
            context.goNamed(AppRoute.endWin.name);
            break;
        }
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
