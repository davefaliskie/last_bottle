import 'dart:io';

import 'package:flutter/foundation.dart';

const gameWidth = 1080.0;
const gameHeight = 1920.0;

const extendedHeight = gameHeight * 4;

// player's image size is 70x200
const playerWidth = 52.5;
const playerHeight = 150.0;

// obstacle's image size are 200x200
const obstacleSize = 200.0;

const defaultMargin = 12.0;

String get backendBaseUrl {
  if (kReleaseMode) {
    return "https://api.lastbottle.app";
  } else if (Platform.isAndroid) {
    return "http://10.0.2.2:3000";
  } else {
    return "http://0.0.0.0:3000";
  }
}
