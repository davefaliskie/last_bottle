import 'dart:math';

import 'package:flutter/material.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({super.key, required this.percentage});

  final double percentage;
  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  // final _random = Random();
  final double _percentage = 10.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _checkWinOrLose();
        }
      });
  }

  void _spin() {
    // Calculate a random number of spins (full rotations) plus an extra angle for the final position
    final totalSpins =
        Random().nextDouble() * 5 + 2; // Ensures at least 2 full spins
    final targetValue = totalSpins + (360 * _percentage / 100) / 360;

    // Animate to the target value, which represents the spins plus the percentage-based final angle
    _controller.animateTo(targetValue,
        duration: Duration(seconds: Random().nextInt(5) + 2),
        curve: Curves.decelerate);
  }

  void _checkWinOrLose() {
    // Calculate the final angle at which the wheel stopped
    final angle = (_controller.value * 360) % 360;
    const winStartAngle =
        0; // Assuming the green (win) section starts at 0 degrees
    final winEndAngle =
        360 * _percentage / 100; // Calculate the end angle of the win section

    // Check if the final angle is within the win section
    if (angle >= winStartAngle && angle <= winEndAngle) {
      debugPrint("WIN");
    } else {
      debugPrint("LOSE");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _spin,
        child: Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: CustomPaint(
            painter: WheelPainter(percentage: _percentage),
            size: const Size(300, 300),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WheelPainter extends CustomPainter {
  final double percentage;
  WheelPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..style = PaintingStyle.fill;

    // Draw lose sections
    paint.color = Colors.grey;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    // Draw win section
    paint.color = Colors.green;
    double sweepAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -pi / 2,
      sweepAngle,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
