import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/achievements/data/achievements_repository.dart';
import 'package:last_bottle/achievements/views/achievement_card.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';
import 'package:last_bottle/utils/sizes.dart';
import 'package:last_bottle/widgets/bottle_app_bar.dart';
import 'package:last_bottle/widgets/mute_button.dart';
import 'package:last_bottle/widgets/reset_game_button.dart';
import 'package:last_bottle/widgets/stat_item.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.initialize();
    if (ref.read(hiveRepositoryProvider).playSound) {
      FlameAudio.bgm.play('bg_menu.mp3', volume: 0.2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final achievements =
        ref.watch(achievementsRepositoryProvider).getAchievmentsList();

    final db = ref.read(hiveRepositoryProvider);

    return Scaffold(
      appBar: bottleAppBar(context),
      body: Container(
        margin: const EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
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
            const Spacer(),
            Text(
              "Recycle Outcomes",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.left,
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatItem(
                  label: "Bottles Used",
                  value: db.getValue("totalAttempts").toString(),
                ),
                StatItem(
                  label: "Recycled",
                  value: db.percentOfTotalAttempts("winEndCount"),
                  color: Colors.red.shade900,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutcomeStatCard(
                  image: "assets/images/trash.png",
                  value: db.percentOfTotalAttempts("trashEndCount"),
                ),
                OutcomeStatCard(
                  image: "assets/images/water.png",
                  value: db.percentOfTotalAttempts("waterEndCount"),
                ),
                OutcomeStatCard(
                  image: "assets/images/fire.png",
                  value: db.percentOfTotalAttempts("fireEndCount"),
                ),
                OutcomeStatCard(
                  image: "assets/images/turtle_sq.png",
                  value: db.percentOfTotalAttempts("turtleEndCount"),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MuteButton(currentSong: 'bg_menu.mp3'),
                gapW12,
                ResetGameButton(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
          child: ElevatedButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              context.goNamed(AppRoute.game.name);
            },
            style: primaryButtonStyle,
            child: const Text(
              "Start New Game",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
