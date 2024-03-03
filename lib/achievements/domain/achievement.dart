import 'package:flutter/material.dart';
import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';

class Achievement {
  Achievement({
    required this.title,
    required this.hint,
    required this.passContent,
    required this.obtained,
    required this.iconData,
  });

  final String title;
  final String hint;
  final PassContent passContent;
  final bool obtained;
  final IconData iconData;

  factory Achievement.fromPassType({
    required PassType passType,
    required bool obtained,
  }) {
    switch (passType) {
      case PassType.trash:
        return Achievement(
          title: "Stay Awhile",
          hint: "End up in the landfill",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.timer,
        );

      case PassType.water:
        return Achievement(
          title: "Float On",
          hint: "End up in the water",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.waves_sharp,
        );

      case PassType.fire:
        return Achievement(
          title: "Toxic",
          hint: "Try getting burned",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.local_fire_department,
        );

      case PassType.turtle:
        return Achievement(
          title: "Hazord",
          hint: "Have you seen a turtle",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.warning,
        );

      case PassType.recycle:
        return Achievement(
          title: "Mislead",
          hint: "Attempt to recycle 5x",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.emoji_symbols,
        );

      case PassType.recycleSuccess:
        return Achievement(
          title: "End It",
          hint: "Successfully recycle",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.back_hand_outlined,
        );
    }
  }
}
