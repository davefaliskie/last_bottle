import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/router.dart';

class TrashEndScreen extends StatelessWidget {
  const TrashEndScreen({super.key});

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
              "🗑️ Game Over 🗑️",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "You've fallen into a landfill",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Text(
              "This is the same fate as 63% of plastic water bottles",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
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