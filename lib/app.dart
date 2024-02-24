import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/recycle_game/recycle_game.dart';
import 'package:last_bottle/router.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.amber,
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late RecycleGame game;

  RecycleGame getGame() {
    return RecycleGame(
      endAndGo: (appRoute) {
        context.goNamed(appRoute.name);
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
