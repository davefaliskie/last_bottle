import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/achievements/data/achievements_repository.dart';
import 'package:last_bottle/achievements/views/achievement_card.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/utils/sizes.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievements =
        ref.watch(achievementsRepositoryProvider).getAchievmentsList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Last Bottle"),
      ),
      body: Container(
        margin: const EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRoute.game.name);
                },
                child: const Text("New Game"),
              ),
            ),
            gapH32,
            Text(
              "Trading Cards",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.left,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: defaultMargin),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                return AchievementCard(achievement: achievements[index]);
              },
            ),
            Text(
              "Game Stats",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
