import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/achievements/domain/achievement.dart';
import 'package:last_bottle/achievements/views/achievement_card.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/local_data/domain/end_screen_data.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';
import 'package:last_bottle/utils/sizes.dart';
import 'package:last_bottle/widgets/floating_component.dart';

class EndScreen extends ConsumerStatefulWidget {
  const EndScreen({
    super.key,
    required this.gameEndState,
  });

  final GameEndState gameEndState;

  @override
  ConsumerState<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends ConsumerState<EndScreen> {
  @override
  void initState() {
    super.initState();
    if (ref.read(hiveRepositoryProvider).playSound) {
      FlameAudio.bgm.initialize();
      if (widget.gameEndState == GameEndState.win) {
        FlameAudio.bgm.play('bg_win.mp3', volume: 0.7);
      } else {
        FlameAudio.bgm.play('bg_end.mp3', volume: 0.5);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // for some game end states there is a potential pass that could be awarded
    final endScreenData = EndScreenData.fromGameEndState(widget.gameEndState);
    bool? award;
    Color bottomColor = Colors.blue.shade300;
    bool winner = widget.gameEndState == GameEndState.win;

    if (endScreenData.passType != null) {
      award = ref
          .watch(hiveRepositoryProvider)
          .getValue("${endScreenData.passType!.name}PassAwarded");
    }

    return Scaffold(
      // appBar: bottleAppBar(context),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TOP HALF
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    endScreenData.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      endScreenData.imagePath,
                      height: 175,
                    ),
                  ),
                  gapH12,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      endScreenData.subtitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            // BOTTOM HALF
            Expanded(
              flex: award == true ? 10 : 6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, bottomColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    if (award == true)
                      Column(
                        children: [
                          FloatingComponent(
                            child: Badge(
                              offset: const Offset(-6, -6),
                              label: const Text(
                                "New",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              largeSize: 26,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 125,
                                child: AchievementCard(
                                  achievement: Achievement.fromPassType(
                                    passType: endScreenData.passType!,
                                    obtained: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          gapH16,
                        ],
                      ),
                    const Spacer(flex: 2),
                    if (!winner)
                      TextButton(
                        onPressed: () {
                          context.goNamed(AppRoute.menu.name);
                        },
                        child: Text(
                          "Main Menu",
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: bottomColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: ElevatedButton(
              onPressed: () {
                if (winner) {
                  context.goNamed(AppRoute.menu.name);
                } else {
                  context.goNamed(AppRoute.game.name);
                }
              },
              style: primaryButtonStyle,
              child: Text(
                winner == true ? "Main Menu" : "Try Again",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
