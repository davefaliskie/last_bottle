import 'package:flutter/material.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/theme.dart';

class RecycleApp extends StatefulWidget {
  const RecycleApp({super.key});

  @override
  State<RecycleApp> createState() => _MyAppState();
}

class _MyAppState extends State<RecycleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: themeData,
    );
  }
}
