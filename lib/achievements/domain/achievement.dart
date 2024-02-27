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
          title: "Getting Dirty",
          hint: "End up in the landfill",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.landscape,
        );

      case PassType.water:
        return Achievement(
          title: "Floating",
          hint: "End up in the Ocean",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.water_drop_outlined,
        );

      case PassType.fire:
        return Achievement(
          title: "Heat Up",
          hint: "End up in the fire",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.local_fire_department,
        );

      case PassType.turtle:
        return Achievement(
          title: "Sea More",
          hint: "Have you seen a turtle",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.water,
        );

      case PassType.recycle:
        return Achievement(
          title: "Close Call",
          hint: "Attempted to recycle but were unsuccessful",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.balance_outlined,
        );

      case PassType.recycleSuccess:
        return Achievement(
          title: "New Life",
          hint: "Get successfully recycled",
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.recycling,
        );
    }
  }
}
