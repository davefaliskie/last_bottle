import 'package:flutter/material.dart';
import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/localization/app_localizations_provider.dart';

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
    required dynamic ref,
  }) {
    switch (passType) {
      case PassType.trash:
        return Achievement(
          title: ref.watch(appLocalizationsProvider).trashPassTitle,
          hint: ref.watch(appLocalizationsProvider).trashPassHint,
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.timer,
        );

      case PassType.water:
        return Achievement(
          title: ref.watch(appLocalizationsProvider).waterPassTitle,
          hint: ref.watch(appLocalizationsProvider).waterPassHint,
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.waves_sharp,
        );

      case PassType.fire:
        return Achievement(
          title: ref.watch(appLocalizationsProvider).firePassTitle,
          hint: ref.watch(appLocalizationsProvider).firePassHint,
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.local_fire_department,
        );

      case PassType.turtle:
        return Achievement(
          title: ref.watch(appLocalizationsProvider).turtlePassTitle,
          hint: ref.watch(appLocalizationsProvider).turtlePassHint,
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.warning,
        );

      case PassType.recycle:
        return Achievement(
          title: ref.watch(appLocalizationsProvider).recyclePassTitle,
          hint: ref.watch(appLocalizationsProvider).recyclePassHint,
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.emoji_symbols,
        );

      case PassType.recycleSuccess:
        return Achievement(
          title: ref.watch(appLocalizationsProvider).recycleSuccessPassTitle,
          hint: ref.watch(appLocalizationsProvider).recycleSuccessPassHint,
          passContent: PassContent.fromPassType(passType),
          obtained: obtained,
          iconData: Icons.back_hand_outlined,
        );
    }
  }
}
