import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/bottle_game/bottle_game.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/router.dart';

enum BottleState {
  closed,
  opened,
  spilling,
  empty,
}

class BottleGameScreen extends ConsumerStatefulWidget {
  const BottleGameScreen({super.key});

  @override
  ConsumerState<BottleGameScreen> createState() => _BottleGameScreenState();
}

class _BottleGameScreenState extends ConsumerState<BottleGameScreen> {
  // late BottleGame game;
  BottleState bottleState = BottleState.closed;
  // Widget? displayBottleWidget;

  @override
  void initState() {
    super.initState();
    // game = getGame();
    // displayBottleWidget = _bottleClosed();

    // todo what music do we want.
    // if (ref.read(hiveRepositoryProvider).playSound) {
    //   FlameAudio.bgm.initialize();
    //   FlameAudio.bgm.play('bg_game.mp3', volume: 0.3);
    // }
  }

  // Handle the game's End Logic in this callback to access context & ref
  // BottleGame getGame() {
  //   return BottleGame(
  //     endAndGo: () {
  //       // todo save completion to hive & then use it to not show this screen again.
  //       HapticFeedback.heavyImpact();
  //       context.goNamed(AppRoute.endTrash.name);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bottleState.name),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 75,
          color: Colors.green,
          child: Center(
            child: Text(_hintText()),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              color: Colors.white,
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 2),
                child: _displayBottleWidget(),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _displayBottleWidget() {
    switch (bottleState) {
      case BottleState.opened:
        return _bottleOpened();
      default:
        // BottleState.closed
        return _bottleClosed();
    }
  }

  String _hintText() {
    switch (bottleState) {
      case BottleState.opened:
        return "Drink The Water";
      default:
        // BottleState.closed
        return "Open The Bottle";
    }
  }

  // Closed bottle action -> Open Bottle
  Widget _bottleClosed() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/images/bottles/closed.png",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: InkWell(
            child: Container(
              // color: Colors.green.withOpacity(0.3),
              color: Colors.transparent,
              height: 40,
              width: 60,
            ),
            onTap: () async {
              debugPrint("Opening Bottle");
              if (true || ref.read(hiveRepositoryProvider).playSound) {
                await FlameAudio.play('pop.mp3');
              }
              setState(() {
                bottleState = BottleState.opened;
              });
            },
          ),
        )
      ],
    );
  }

  // Opened bottle action -> Spilling Bottle
  Widget _bottleOpened() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/images/bottles/opened.png",
        ),
        // InkWell(
        //   child: Container(
        //     color: Colors.red.withOpacity(0.3),
        //     height: 50,
        //     width: 70,
        //   ),
        //   onTap: () {
        //     debugPrint("Opening Bottle");
        //     setState(() {
        //       bottleState = BottleState.opened;
        //     });
        //   },
        // )
      ],
    );
  }
}
