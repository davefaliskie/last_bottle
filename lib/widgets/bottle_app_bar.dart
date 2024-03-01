import 'package:flutter/material.dart';

AppBar bottleAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    toolbarHeight: 55,
    title: Column(
      children: [
        RotationTransition(
          turns: const AlwaysStoppedAnimation(28 / 360),
          child: Image.asset(
            "assets/images/player.png",
            height: 55,
          ),
        ),
      ],
    ),
  );
}
