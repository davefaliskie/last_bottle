import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';

class RecycleApp extends StatefulWidget {
  const RecycleApp({super.key});

  @override
  State<RecycleApp> createState() => _MyAppState();
}

class _MyAppState extends State<RecycleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: themeData,
    );
  }
}

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late RecycleGame game;

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
          case GameEndState.recycle:
            context.goNamed(AppRoute.endRecycle.name);
            break;
          default:
          // todo default would be some generic retry page?
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    game = getGame();
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
