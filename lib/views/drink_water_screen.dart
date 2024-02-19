import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/router.dart';

class DrinkWaterScreen extends StatefulWidget {
  const DrinkWaterScreen({super.key});

  @override
  State<DrinkWaterScreen> createState() => _DrinkWaterScreenState();
}

class _DrinkWaterScreenState extends State<DrinkWaterScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  double _waterLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller!.addListener(() {
      setState(() {
        _waterLevel = _animation!.value;
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _spillWater() {
    _animation =
        Tween<double>(begin: _waterLevel, end: 0.0).animate(_controller!);
    _controller!.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _spillWater,
                  child: Center(
                    child: CustomPaint(
                      size: const Size(200, 400),
                      painter: WaterBottlePainter(_waterLevel),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
                // color: Colors.indigoAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_controller?.isCompleted == true) ...[
                      ElevatedButton(
                        onPressed: () {
                          context.goNamed(AppRoute.game.name);
                        },
                        child: const Text("Recycle The Bottle"),
                      )
                    ] else ...[
                      Text(
                        "Drink",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaterBottlePainter extends CustomPainter {
  final double waterLevel;

  WaterBottlePainter(this.waterLevel);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the bottle
    var bottlePaint = Paint()..color = Colors.blueGrey;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bottlePaint);

    // Draw the water
    var waterPaint = Paint()..color = Colors.blue;
    double waterHeight = size.height * waterLevel;
    canvas.drawRect(
        Rect.fromLTWH(0, size.height - waterHeight, size.width, waterHeight),
        waterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
