import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';

class Achievement {
  Achievement({
    required this.title,
    required this.hint,
    required this.passContent,
    required this.obtained,
  });

  final String title;
  final String hint;
  final PassContent passContent;
  final bool obtained;

  factory Achievement.fromPassType({
    required PassType passType,
    required bool obtained,
  }) {
    switch (passType) {
      case PassType.trash:
        return Achievement(
            title: "Trashed",
            hint: "End up in the landfill",
            passContent: PassContent.fromPassType(passType),
            obtained: obtained);

      case PassType.water:
        return Achievement(
          title: "Water",
          hint: "End up in the Ocean",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
        );

      case PassType.fire:
        return Achievement(
          title: "Fire",
          hint: "End up in the fire",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
        );

      case PassType.turtle:
        return Achievement(
          title: "Turtle",
          hint: "Have you seen a turtle",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
        );

      case PassType.recycle:
        return Achievement(
          title: "Recycled But...",
          hint: "Attempted to recycle but were unsuccessful",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
        );

      case PassType.recycleSuccess:
        return Achievement(
          title: "Recycled",
          hint: "Get successfully recycled",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
        );
    }
  }
}
