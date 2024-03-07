import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/localization/app_localizations_provider.dart';

class EndScreenData {
  EndScreenData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.passType,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final PassType? passType;

  factory EndScreenData.fromGameEndState({
    required GameEndState endState,
    required WidgetRef ref,
  }) {
    switch (endState) {
      case GameEndState.trash:
        return EndScreenData(
          title: ref.watch(appLocalizationsProvider).endTrashTitle,
          passType: PassType.trash,
          subtitle: ref.watch(appLocalizationsProvider).endTrashSubTitle,
          imagePath: "assets/images/display/trash.png",
        );

      case GameEndState.water:
        return EndScreenData(
          title: ref.watch(appLocalizationsProvider).endWaterTitle,
          passType: PassType.water,
          subtitle: ref.watch(appLocalizationsProvider).endWaterSubTitle,
          imagePath: "assets/images/display/water.png",
        );

      case GameEndState.fire:
        return EndScreenData(
          title: ref.watch(appLocalizationsProvider).endFireTitle,
          passType: PassType.fire,
          subtitle: ref.watch(appLocalizationsProvider).endFireSubTitle,
          imagePath: "assets/images/display/fire.png",
        );

      case GameEndState.turtle:
        return EndScreenData(
          title: ref.watch(appLocalizationsProvider).endTurtleTitle,
          passType: PassType.turtle,
          // https://www.seeturtles.org/ocean-plastic
          subtitle: ref.watch(appLocalizationsProvider).endTurtleSubTitle,
          imagePath: "assets/images/display/turtle.png",
        );

      case GameEndState.recycle:
        return EndScreenData(
          title: ref.watch(appLocalizationsProvider).endRecycleTitle,
          passType: PassType.recycle,
          subtitle: ref.watch(appLocalizationsProvider).endRecycleSubTitle,
          imagePath: "assets/images/display/bin_recycle.png",
        );

      case GameEndState.win:
        return EndScreenData(
          title: ref.watch(appLocalizationsProvider).endWinTitle,
          passType: PassType.recycleSuccess,
          subtitle: ref.watch(appLocalizationsProvider).endWinSubTitle,
          imagePath: "assets/images/display/bottle_full.png",
        );
    }
  }
}
