import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/localization/app_localizations_context.dart';
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
              title: Text(
                context.loc.resetGameTitle,
              ),
              content: Text(
                context.loc.resetGameBody,
                style: const TextStyle(fontSize: 18),
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(context.loc.resetGameCancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(hiveRepositoryProvider).resetGame();
                    HapticFeedback.mediumImpact();
                    context.goNamed(AppRoute.bottleIntro.name);
                  },
                  style: primaryButtonStyle,
                  child: Text(
                    context.loc.resetGameConfirm,
                    style: const TextStyle(
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
