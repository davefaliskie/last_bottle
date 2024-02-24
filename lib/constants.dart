import 'dart:io';

import 'package:flutter/foundation.dart';

const gameWidth = 1080.0;
const gameHeight = 1920.0;

const extendedHeight = gameHeight * 4;

const obstacleWidth = 200.0;
const obstacleHeight = 200.0;

const defaultMargin = 12.0;

String get backendBaseUrl {
  if (kReleaseMode) {
    // todo set this correctly
    return "https://api.recycleapp.com";
  } else if (Platform.isAndroid) {
    return "http://10.0.2.2:3000";
  } else {
    return "http://0.0.0.0:3000";
  }
}
