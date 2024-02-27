import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/local_data/domain/end_screen_date.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/widgets/bottle_app_bar.dart';

class EndScreen extends ConsumerWidget {
  const EndScreen({
    super.key,
    required this.gameEndState,
  });

  final GameEndState gameEndState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // for some game end states there is a potential pass that could be awarded
    final endScreenData = EndScreenData.fromGameEndState(gameEndState);
    bool? award;

    if (endScreenData.passType != null) {
      award = ref
          .watch(hiveRepositoryProvider)
          .getValue("${endScreenData.passType!.name}PassAwarded");
    }

    return Scaffold(
      appBar: bottleAppBar(context),
      body: SafeArea(
        child: Padding(
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
                endScreenData.title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const Text(
                "This is the same fate as 63% of plastic water bottles",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              if (award == true)
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(
                      AppRoute.addToWallet.name,
                      extra: endScreenData.passType,
                    );
                  },
                  child: const Text("♻️ Achievement Unlocked ♻️"),
                ),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoute.menu.name);
                },
                child: const Text("Main Menu"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoute.game.name);
            },
            child: const Text("Start New Game"),
          ),
        ),
      ),
    );
  }
}
