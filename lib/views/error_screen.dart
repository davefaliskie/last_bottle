import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/localization/app_localizations_context.dart';
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
              context.loc.errorTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            gapH24,
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.menu.name);
              },
              style: primaryButtonStyle,
              child: Text(
                context.loc.goMainMenuBtn,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
