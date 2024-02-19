import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/router.dart';

class RecycleEndScreen extends StatelessWidget {
  const RecycleEndScreen({super.key});

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
              "♻️ Game Over ♻️",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "You were recycled!",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Text(
              "Unfortunately only 9% of single use bottles are actually reborn",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            const Text(
              "Let's increase your chances",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("TODO need to setup mini game.");
              },
              child: const Text("Start"),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.game.name);
              },
              child: const Text("Try Again"),
            ),
          ],
        ),
      ),
    );
  }
}
