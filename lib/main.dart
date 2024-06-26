import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:last_bottle/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  await initHive();

  runApp(
    const ProviderScope(
      child: RecycleApp(),
    ),
  );
}

Future<void> initHive() async {
  // Initialize Hive & open gameData box
  await Hive.initFlutter();
  await Hive.openBox('gameData');
}
