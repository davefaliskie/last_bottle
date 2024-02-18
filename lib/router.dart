import 'package:go_router/go_router.dart';
import 'package:recycle/app.dart';
import 'package:recycle/views/trash_end_screen.dart';

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
      builder: (context, state) {
        return const GameScreen();
      },
    ),
    GoRoute(
      path: "/endTrash",
      name: AppRoute.endTrash.name,
      builder: (context, state) {
        return const TrashEndScreen();
      },
    ),
  ],
);
