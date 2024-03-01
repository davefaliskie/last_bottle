import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';

class ResetGameButton extends ConsumerWidget {
  const ResetGameButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              insetPadding: const EdgeInsets.all(defaultMargin),
              title: const Text("Reset The Game"),
              content: const Text(
                "Are you sure? You will lose all progress and everything will be reset. This can't be undone.",
                style: TextStyle(fontSize: 18),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("No, Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(hiveRepositoryProvider).resetGame();
                    HapticFeedback.mediumImpact();
                    context.goNamed(AppRoute.game.name);
                  },
                  style: primaryButtonStyle,
                  child: const Text(
                    "Yes, Reset Game",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.restart_alt_rounded),
    );
  }
}
