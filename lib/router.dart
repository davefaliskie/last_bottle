import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/app.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/google_wallet/views/add_to_wallet_screen.dart';
import 'package:last_bottle/local_data/domain/game_end_state.dart';
import 'package:last_bottle/views/drink_water_screen.dart';
import 'package:last_bottle/views/end_screen.dart';
import 'package:last_bottle/views/error_screen.dart';
import 'package:last_bottle/views/menu_screen.dart';
import 'package:last_bottle/views/recycle_end_screen.dart';

enum AppRoute {
  drinkWater,
  game,
  endTrash,
  endWater,
  endFire,
  endRecycle,
  endWin,
  spinWheel,
  menu,
  addToWallet,
}

final GoRouter router = GoRouter(
  initialLocation: '/spinWheel',
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
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const GameScreen(),
      ),
    ),
    GoRoute(
      path: "/endTrash",
      name: AppRoute.endTrash.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const EndScreen(gameEndState: GameEndState.trash),
      ),
    ),
    GoRoute(
      path: "/endWater",
      name: AppRoute.endWater.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const EndScreen(gameEndState: GameEndState.water),
      ),
    ),
    GoRoute(
      path: "/endFire",
      name: AppRoute.endFire.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const EndScreen(gameEndState: GameEndState.fire),
      ),
    ),
    GoRoute(
      path: "/endRecycle",
      name: AppRoute.endRecycle.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const EndScreen(gameEndState: GameEndState.recycle),
      ),
    ),
    GoRoute(
      path: "/endWin",
      name: AppRoute.endWin.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const EndScreen(gameEndState: GameEndState.win),
      ),
    ),
    GoRoute(
      path: "/spinWheel",
      name: AppRoute.spinWheel.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const RecycleEndScreen(),
      ),
    ),
    GoRoute(
      path: "/menu",
      name: AppRoute.menu.name,
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const MenuScreen(),
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
