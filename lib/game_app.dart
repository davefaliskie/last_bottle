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
  late RecycleGame game;

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
        scaffoldBackgroundColor: Colors.blue.shade300,
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("restart");
                setState(() {
                  game = RecycleGame();
                });
              },
              icon: const Icon(Icons.restart_alt),
            )
          ],
        ),
        body: SafeArea(
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
