import 'package:flutter/material.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/widgets/wheel.dart';

class RecycleEndScreen extends StatelessWidget {
  const RecycleEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Landed In The Recycle Bin",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Text(
                    "But that's not the end, unfortunately most plastic doesn't get reused",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: const Wheel(),
                ),
                const Spacer(flex: 2),
                const Text(
                  "Spin the wheel to see if your bottle will be reused",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
