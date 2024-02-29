import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';

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

  factory EndScreenData.fromGameEndState(GameEndState endState) {
    switch (endState) {
      case GameEndState.trash:
        return EndScreenData(
          title: "A Landfill Is Your Fate",
          passType: PassType.trash,
          subtitle:
              "You weren't recycled and ended up in the landfill. This is the fate of xx% of plastic that's produced.",
          imagePath: "assets/images/display/trash.png",
        );

      case GameEndState.water:
        return EndScreenData(
          title: "The Ocean Is Where You'll Be",
          passType: PassType.water,
          subtitle:
              "You weren't recycled and ended up in the ocean. This is the fate of xx% of plastic that's produced.",
          imagePath: "assets/images/display/water.png",
        );

      case GameEndState.fire:
        return EndScreenData(
          title: "To The Furnace For You",
          passType: PassType.fire,
          subtitle: "This is the fate of xx% of plastic",
          imagePath: "assets/images/display/fire.png",
        );

      case GameEndState.turtle:
        return EndScreenData(
          title: "A Turtle Ate Your Bottle",
          passType: PassType.turtle,
          subtitle:
              "Turtles and other sea life are constantly mistaking plastic for food",
          imagePath: "assets/images/display/turtle.png",
        );

      case GameEndState.recycle:
        return EndScreenData(
          title: "All that effort for nothing",
          passType: PassType.recycle,
          subtitle: "Only 9% of plastic producted is recycled",
          imagePath: "assets/images/display/bin_recycle.png",
        );

      case GameEndState.win:
        return EndScreenData(
          title: "Congratulations",
          passType: PassType.recycleSuccess,
          subtitle: "You were one of the lucky 9% that was recycled",
          imagePath: "assets/images/display/bottle_full.png",
        );
    }
  }
}
