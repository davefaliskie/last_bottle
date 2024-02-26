import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/app.dart';
import 'package:last_bottle/google_wallet/domain/pass_data.dart';
import 'package:last_bottle/google_wallet/views/add_to_wallet_screen.dart';
import 'package:last_bottle/views/drink_water_screen.dart';
import 'package:last_bottle/views/error_screen.dart';
import 'package:last_bottle/views/fire_end_screen.dart';
import 'package:last_bottle/views/recycle_end_screen.dart';
import 'package:last_bottle/views/trash_end_screen.dart';
import 'package:last_bottle/views/water_end_screen.dart';

enum AppRoute {
  drinkWater,
  game,
  endTrash,
  endWater,
  endFire,
  endRecycle,
  addToWallet,
}

final GoRouter router = GoRouter(
  initialLocation: '/endRecycle',
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
      path: "/endFire",
      name: AppRoute.endFire.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const FireEndScreen(),
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
      path: "/addToWallet",
      name: AppRoute.addToWallet.name,
      pageBuilder: (context, state) {
        if (state.extra != null && state.extra is PassType) {
          final PassType passType = state.extra as PassType;
          return MaterialPage(
            fullscreenDialog: true,
            child: AddToWalletScreen(passType: passType),
          );
        } else {
          return const MaterialPage(
            fullscreenDialog: true,
            child: ErrorScreen(),
          );
        }
      },
    ),
  ],
);
