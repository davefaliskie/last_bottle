import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/localization/app_localizations_context.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';
import 'package:last_bottle/utils/sizes.dart';
import 'package:last_bottle/widgets/bottle_app_bar.dart';
import 'package:last_bottle/widgets/mute_button.dart';

enum BottleState {
  closed,
  open,
  spilling,
  empty,
  over,
}

class BottleIntroScreen extends ConsumerStatefulWidget {
  const BottleIntroScreen({super.key});

  @override
  ConsumerState<BottleIntroScreen> createState() => _BottleGameScreenState();
}

class _BottleGameScreenState extends ConsumerState<BottleIntroScreen> {
  BottleState bottleState = BottleState.closed;
  Color actionColors = Colors.transparent;

  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.initialize();
    if (ref.read(hiveRepositoryProvider).playSound) {
      FlameAudio.bgm.play('bg_intro.mp3', volume: 0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bottleState == BottleState.over ? bottleAppBar(context) : null,
      floatingActionButton: const MuteButton(currentSong: "bg_intro.mp3"),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FittedBox(
                  child: SizedBox(
                    width: 500,
                    height: 500,
                    child: _displayBottleWidget(),
                  ),
                ),
                gapH32,
                SizedBox(
                  height: 75,
                  child: Center(
                    child: Text(_hintText()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayBottleWidget() {
    switch (bottleState) {
      case BottleState.closed:
        return _bottleClosed();
      case BottleState.open:
        return _bottleOpened();
      case BottleState.spilling:
        Future.delayed(Duration.zero, () => _startSpillingTimer());
        return _bottleSpilling();
      case BottleState.empty:
        return _bottleEmpty();
      case BottleState.over:
        return _bottleOver();
    }
  }

  String _hintText() {
    switch (bottleState) {
      case BottleState.closed:
        return context.loc.hintBottleClosed;
      case BottleState.open:
        return context.loc.hintBottleOpen;
      case BottleState.spilling:
        return context.loc.hintBottleSpilling;
      case BottleState.empty:
        return context.loc.hintBottleEmpty;
      case BottleState.over:
        return "";
    }
  }

  void _startSpillingTimer() {
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) {
        return;
      }
      HapticFeedback.mediumImpact();
      setState(() {
        bottleState = BottleState.empty;
      });
    });
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
          padding: const EdgeInsets.only(top: 90.0),
          child: InkWell(
            child: Container(
              color: actionColors,
              height: 50,
              width: 70,
            ),
            onTap: () {
              if (ref.read(hiveRepositoryProvider).playSound) {
                FlameAudio.play('pop.mp3');
              }
              setState(() {
                HapticFeedback.heavyImpact();
                bottleState = BottleState.open;
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
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/images/bottles/open.png",
        ),
        GestureDetector(
          child: Container(
            color: actionColors,
            height: 400,
            width: 150,
          ),
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx > 0) {
              if (ref.read(hiveRepositoryProvider).playSound) {
                FlameAudio.play('spilling.mp3', volume: 0.5);
              }
              setState(() {
                bottleState = BottleState.spilling;
              });
            }
          },
        )
      ],
    );
  }

  // this is a 5s Animated Play until it switches to Empty
  Widget _bottleSpilling() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/images/bottles/spilling.png",
        ),
      ],
    );
  }

  // Empty bottle, prompt to start the game
  Widget _bottleEmpty() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/images/bottles/empty.png",
        ),
        GestureDetector(
          child: Container(
            color: actionColors,
            height: 400,
            width: 150,
          ),
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < 0) {
              if (ref.read(hiveRepositoryProvider).playSound) {
                FlameAudio.play('swish.mp3');
              }
              setState(() {
                HapticFeedback.heavyImpact();
                bottleState = BottleState.over;
              });
            }
          },
        )
      ],
    );
  }

  Widget _bottleOver() {
    return Padding(
      padding: const EdgeInsets.all(defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.recycling,
            size: 120,
          ),
          const Spacer(),
          Text(
            context.loc.beginGameTitle,
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          gapH24,
          Text(
            context.loc.beginGameSubTitle,
            style: const TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              ref.read(hiveRepositoryProvider).setIntroComplete();
              HapticFeedback.heavyImpact();
              context.goNamed(AppRoute.game.name);
            },
            style: primaryButtonStyle,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                context.loc.beginGameBtn,
                style: const TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
