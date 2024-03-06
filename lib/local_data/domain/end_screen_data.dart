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
              "You weren't recycled and ended up in the landfill. This is sadly the fate of most plastic that's produced.",
          imagePath: "assets/images/display/trash.png",
        );

      case GameEndState.water:
        return EndScreenData(
          title: "The Ocean Is Where You'll Be",
          passType: PassType.water,
          subtitle:
              "You're not alone, at least 14 million tons of plastic end up in the ocean every year",
          imagePath: "assets/images/display/water.png",
        );

      case GameEndState.fire:
        return EndScreenData(
          title: "To The Furnace For You",
          passType: PassType.fire,
          subtitle: "About 12% of all plastic waste generated is incinerated",
          imagePath: "assets/images/display/fire.png",
        );

      case GameEndState.turtle:
        return EndScreenData(
          title: "You Were Mistaken As Food",
          passType: PassType.turtle,
          // https://www.seeturtles.org/ocean-plastic
          subtitle:
              "Sea turtles and other marine creatures often mistake plastics and other garbage as food and ingest it.",
          imagePath: "assets/images/display/turtle.png",
        );

      case GameEndState.recycle:
        return EndScreenData(
          title: "All That Effort For The Trash",
          passType: PassType.recycle,
          subtitle:
              "Only 9% of plastic produced is recycled successfully, the rest goes to landfills or is burned.",
          imagePath: "assets/images/display/bin_recycle.png",
        );

      case GameEndState.win:
        return EndScreenData(
          title: "Congratulations",
          passType: PassType.recycleSuccess,
          subtitle:
              "You're among the 9% of plastic that's successfully recycled, highlighting recycling's inadequacy in solving the global plastic issue.",
          imagePath: "assets/images/display/bottle_full.png",
        );
    }
  }
}
