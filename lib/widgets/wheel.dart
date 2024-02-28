import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/router.dart';

class Wheel extends ConsumerStatefulWidget {
  const Wheel({super.key});

  @override
  ConsumerState<Wheel> createState() => _WheelState();
}

class _WheelState extends ConsumerState<Wheel> {
  StreamController<int> controller = StreamController<int>();
  bool spinWon = false;

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 6,
      child: FortuneWheel(
        key: const Key("wheel"),
        animateFirst: false,
        selected: controller.stream,
        hapticImpact: HapticImpact.medium,
        indicators: const [
          FortuneIndicator(
            alignment: Alignment.topCenter,
            child: TriangleIndicator(
              color: Colors.black45,
              width: 30.0,
              height: 40.0,
              elevation: 10,
            ),
          ),
        ],
        items: [
          FortuneItem(
            child: const RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 25),
                // child: Text("♻️", style: TextStyle(fontSize: 45)),
                child: Icon(
                  Icons.recycling,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ),
            style: FortuneItemStyle(
              color: Colors.blue.shade700.withAlpha(150),
              borderWidth: 0,
            ),
          ),
          ..._losing90(
            imagePath: "assets/images/trash.png",
            color: Colors.white.withAlpha(140),
          ),
        ],
        onFling: () {
          // whatever we add to the controller is the value that will be picked
          int outcome = _getOutcome();
          debugPrint("Outcome: $outcome");

          if (outcome == 0) {
            setState(() => spinWon = true);
          }

          controller.add(outcome);
        },
        onAnimationEnd: () async {
          // Save Outcome to Hive
          ref.read(hiveRepositoryProvider).saveSpin(didWin: spinWon);

          // update hive counts with outcome
          if (spinWon == true) {
            context.goNamed(AppRoute.endWin.name);
          } else {
            context.goNamed(AppRoute.endRecycle.name);
          }
        },
      ),
    );
  }

  int _getOutcome() {
    debugPrint("getting outcome");
    // There are 10 total options of the spinner outcome:
    // 0 => Recycle (Win)
    // 1-8 => Landfill (Lose)
    List<int> outcomes = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    if (ref.read(hiveRepositoryProvider).canWin() == true) {
      debugPrint("WINNING is possible");
      outcomes.add(0);
    }

    // randomly choose one of the options
    return outcomes[Random().nextInt(outcomes.length)];
  }

  List<FortuneItem> _losing90({
    required String imagePath,
    required Color color,
  }) {
    return [
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: RotatedBox(
          quarterTurns: 1,
          child: Image.asset(imagePath, width: 60),
        ),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
      FortuneItem(
        child: const SizedBox.shrink(),
        style: FortuneItemStyle(color: color, borderWidth: 0),
      ),
    ];
  }
}
