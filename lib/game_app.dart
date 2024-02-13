import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/game/recycle_game.dart';

class RecycleApp extends StatefulWidget {
  const RecycleApp({super.key});

  @override
  State<RecycleApp> createState() => _MyAppState();
}

class _MyAppState extends State<RecycleApp> {
  late final RecycleGame game;

  @override
  void initState() {
    super.initState();
    game = RecycleGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.yellow,
      ),
      home: Scaffold(
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
      ),
    );
  }
}
