import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';

class EndScreenData {
  EndScreenData({required this.title, this.passType});

  final String title;
  final PassType? passType;

  factory EndScreenData.fromGameEndState(GameEndState endState) {
    switch (endState) {
      case GameEndState.trash:
        return EndScreenData(
          title: "Trash",
          passType: PassType.trash,
        );

      case GameEndState.water:
        return EndScreenData(
          title: "Water",
          passType: PassType.water,
        );

      case GameEndState.fire:
        return EndScreenData(
          title: "Fire",
          passType: PassType.fire,
        );

      case GameEndState.turtle:
        return EndScreenData(
          title: "Turtle",
          passType: PassType.turtle,
        );

      default:
        return EndScreenData(
          title: "Game over",
        );
    }
  }
}
