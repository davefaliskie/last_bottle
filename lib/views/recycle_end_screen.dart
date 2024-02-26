import 'package:flutter/material.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/utils/sizes.dart';
import 'package:last_bottle/widgets/wheel.dart';

class RecycleEndScreen extends StatelessWidget {
  const RecycleEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              gapH32,
              Text(
                "♻️ Game Over ♻️",
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                "You recycled!",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              gapH12,
              const Text(
                "But that's not the end, unfortunately only 9% of plastic that's recycled gets reused.",
                textAlign: TextAlign.center,
              ),
              const Expanded(child: Wheel()),
              const Text(
                "Spin the wheel to see if you're bottle will be reused",
                textAlign: TextAlign.center,
              ),
              gapH32,
            ],
          ),
        ),
      ),
    );
  }
}
