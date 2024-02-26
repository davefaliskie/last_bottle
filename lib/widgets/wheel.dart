import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';

class Wheel extends ConsumerStatefulWidget {
  const Wheel({super.key});

  @override
  ConsumerState<Wheel> createState() => _WheelState();
}

class _WheelState extends ConsumerState<Wheel> {
  StreamController<int> controller = StreamController<int>();

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      key: const Key("wheel"),
      animateFirst: false,
      selected: controller.stream,
      hapticImpact: HapticImpact.medium,
      indicators: [
        FortuneIndicator(
          alignment: Alignment.topCenter,
          child: TriangleIndicator(
            color: Colors.green.shade700,
            width: 40.0,
            height: 40.0,
            elevation: 5,
          ),
        ),
      ],
      items: [
        FortuneItem(
          child: const RotatedBox(
            quarterTurns: 1,
            child: Text("♻️", style: TextStyle(fontSize: 55)),
          ),
          style: FortuneItemStyle(
            color: Colors.green.shade200,
            borderWidth: 0,
          ),
        ),
        ...centeredThird(
          imagePath: "assets/images/trash.png",
          color: Colors.brown.shade700,
        ),
      ],
      onFling: () {
        // whatever we add to the controller is the value that will be picked
        // key:
        // 0 => Recycle
        // 1-8 => Landfill
        List<int> outcomes = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        if (ref.read(hiveRepositoryProvider).canWin() == true) {
          debugPrint("WINNING is possible");
          outcomes.add(0);
        }

        // randomly choose one of the options
        int outcome = outcomes[Random().nextInt(outcomes.length)];
        debugPrint("Outcome: $outcome");

        controller.add(outcome);
      },
      onAnimationEnd: () {
        debugPrint("Done");

        // change state for win/lose

        // update hive counts with outcome
      },
    );
  }

  List<FortuneItem> centeredThird({
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
