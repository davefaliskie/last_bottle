import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:last_bottle/achievements/data/achievements_repository.dart';
import 'package:last_bottle/achievements/views/achievement_card.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';
import 'package:last_bottle/utils/sizes.dart';
import 'package:last_bottle/widgets/bottle_app_bar.dart';

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
    bool playSound = ref.watch(hiveRepositoryProvider).playSound;
    return Scaffold(
      appBar: bottleAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH12,
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
              ElevatedButton(
                onPressed: () {
                  Hive.box("gameData").clear();
                  HapticFeedback.mediumImpact();
                  context.goNamed(AppRoute.game.name);
                },
                child: const Text("Reset Game"),
              ),
              IconButton(
                onPressed: () {
                  // playSound in hive won't react to the update, so useing a state
                  // in this view this is only since leaving this screen will recheck
                  // if sound show play in it's init.
                  if (ref.read(hiveRepositoryProvider).playSound == true) {
                    // we will now mute
                    FlameAudio.bgm.stop();
                    setState(() => playSound = false);
                  } else {
                    // we now will play
                    FlameAudio.bgm.play('bg_menu.mp3', volume: 0.2);
                    setState(() => playSound = true);
                  }
                  ref.read(hiveRepositoryProvider).togglePlaySound();
                },
                icon: playSound
                    ? const Icon(Icons.music_note_rounded)
                    : const Icon(Icons.music_off_rounded),
              ),
              // todo add game stats
              // Text(
              //   "Game Stats",
              //   style: Theme.of(context).textTheme.titleLarge,
              //   textAlign: TextAlign.left,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: ElevatedButton(
            onPressed: () {
              HapticFeedback.mediumImpact();
              context.goNamed(AppRoute.game.name);
            },
            style: primaryButtonStyle,
            child: const Text(
              "Start New Game",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
