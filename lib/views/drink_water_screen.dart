import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DrinkWaterScreen extends StatefulWidget {
  const DrinkWaterScreen({super.key});

  @override
  State<DrinkWaterScreen> createState() => _DrinkWaterScreenState();
}

class _DrinkWaterScreenState extends State<DrinkWaterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/bottle.png"),
              ValueListenableBuilder(
                valueListenable:
                    Hive.box("gameData").listenable(keys: ['appStartTime']),
                builder: ((context, box, child) {
                  final time = box.get("appStartTime");
                  return Text("start time: $time");
                }),
              ),
              ElevatedButton(
                onPressed: () {
                  Hive.box("gameData").put("appStartTime", DateTime.now());
                },
                child: const Text("update start time"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
