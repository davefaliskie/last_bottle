import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:recycle/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  runApp(const RecycleApp());
}
