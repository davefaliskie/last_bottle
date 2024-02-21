import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/router.dart';
import 'package:recycle/utils/sizes.dart';
import 'package:recycle/widgets/spin_wheel.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Spin The Wheel",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "You have a 17% chance of being recycled",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            gapH32,
            const SpinWheel(percentage: 25.0),
            gapH32,
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.game.name);
              },
              child: const Text("New Game"),
            ),
          ],
        ),
      ),
    );
  }
}
