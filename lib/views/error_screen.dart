import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';
import 'package:last_bottle/utils/sizes.dart';

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
                context.goNamed(AppRoute.menu.name);
              },
              style: primaryButtonStyle,
              child: const Text(
                "Go To Main Menu",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
