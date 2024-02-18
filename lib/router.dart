import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/app.dart';
import 'package:recycle/views/trash_end_screen.dart';
import 'package:recycle/views/water_end_screen.dart';

enum AppRoute {
  game,
  endTrash,
  endWater,
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
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
  ],
);
