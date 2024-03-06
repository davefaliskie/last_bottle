import 'package:flutter/material.dart';

enum ScreenSize {
  mSmall,
  mLarge,
  mXLarge,
}

// (WIDTH, HEIGHT)
// iPhone SE: (375, 667)
// iPhone 12 mini: (375, 812)
// iPhone 14: (390, 844)
// iPhone 14 Pro Max: (430, 932)
class ResponsiveSizes {
  ResponsiveSizes(this.context);
  final BuildContext context;

  ScreenSize getScreenSize() {
    final height = MediaQuery.of(context).size.height;
    if (height <= 700) {
      return ScreenSize.mSmall;
    }
    if (height <= 850) {
      return ScreenSize.mLarge;
    }
    return ScreenSize.mXLarge;
  }

  double get statItemContentSize {
    if (getScreenSize() == ScreenSize.mSmall) {
      return 30.0;
    }
    return 45.0;
  }
}
