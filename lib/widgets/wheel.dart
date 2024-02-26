import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
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

        if (outcome == 0) {
          setState(() => spinWon = true);
        }

        controller.add(outcome);
      },
      onAnimationEnd: () {
        // Save Outcome to Hive
        ref.read(hiveRepositoryProvider).saveSpin(didWin: spinWon);

        // update hive counts with outcome
        if (spinWon == true) {
          _winDialog();
        } else {
          _landfillDialog();
        }
      },
    );
  }

  // todo consider combining the Dialogs
  Future<void> _landfillDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          children: [
            AlertDialog(
              insetPadding: const EdgeInsets.all(defaultMargin),
              title: const Text('Oh No, Landfill'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'This happens all the time, just because something was recycled does not mean it will be recycled successfully.',
                    ),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(AppRoute.game.name);
                  },
                  child: const Text("Play Again"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _winDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          children: [
            AlertDialog(
              insetPadding: const EdgeInsets.all(defaultMargin),
              title: const Text('You got reused!'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      "Did you know the vast majority of all plastic produced can't be or won't be recycled. The plastics industry promoted recycling to keep plastic bans at bay.",
                    ),
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: <Widget>[
                // todo update
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(AppRoute.game.name);
                  },
                  child: const Text("See Your Stats"),
                ),
              ],
            ),
          ],
        );
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
