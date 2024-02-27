import 'package:flutter/material.dart';
import 'package:last_bottle/utils/sizes.dart';

AppBar bottleAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 75,
    title: Column(
      children: [
        RotationTransition(
          turns: const AlwaysStoppedAnimation(28 / 360),
          child: Image.asset(
            "assets/images/player.png",
            height: 55,
          ),
        ),
        gapH8,
        Text(
          "is this the last bottle?",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  );
}
