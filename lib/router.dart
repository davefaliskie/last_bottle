import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/app.dart';
import 'package:recycle/views/drink_water_screen.dart';
import 'package:recycle/views/recycle_end_screen.dart';
import 'package:recycle/views/trash_end_screen.dart';
import 'package:recycle/views/water_end_screen.dart';
import 'package:recycle/views/wheel_screen.dart';

enum AppRoute {
  drinkWater,
  game,
  endTrash,
  endWater,
  endRecycle,
  wheel,
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.drinkWater.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const DrinkWaterScreen(),
      ),
    ),
    GoRoute(
      path: '/game',
      name: AppRoute.game.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const GameScreen(),
      ),
    ),
    GoRoute(
      path: "/endTrash",
      name: AppRoute.endTrash.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const TrashEndScreen(),
      ),
    ),
    GoRoute(
      path: "/endWater",
      name: AppRoute.endWater.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const WaterEndScreen(),
      ),
    ),
    GoRoute(
      path: "/endRecycle",
      name: AppRoute.endRecycle.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const RecycleEndScreen(),
      ),
    ),
    GoRoute(
      path: "/wheel",
      name: AppRoute.wheel.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const WheelScreen(),
      ),
    ),
  ],
);
