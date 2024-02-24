import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/router.dart';

class WaterEndScreen extends StatelessWidget {
  const WaterEndScreen({super.key});

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
              "💧 Game Over 💧",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              "You've landed in the water and will be taken out to sea",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Text(
              "This is the same fate as 21% of plastic water bottles",
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
