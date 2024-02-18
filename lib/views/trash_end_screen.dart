import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/router.dart';

class TrashEndScreen extends StatelessWidget {
  const TrashEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Game Over 123",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "You've fallen into a landfill",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              "This is the same fate as 63% of plastic water bottles",
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
