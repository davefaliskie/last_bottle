import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';

class RecycleApp extends ConsumerStatefulWidget {
  const RecycleApp({super.key});

  @override
  ConsumerState<RecycleApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<RecycleApp> {
  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: themeData,
    );
  }
}
