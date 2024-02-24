import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/router.dart';
import 'package:recycle/utils/sizes.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Something Went Wrong",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            gapH24,
            ElevatedButton(
              onPressed: () {
                // todo send to a main menu
                context.goNamed(AppRoute.drinkWater.name);
              },
              child: const Text("Restart Game"),
            )
          ],
        ),
      ),
    );
  }
}
