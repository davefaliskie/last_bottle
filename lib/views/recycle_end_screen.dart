import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/localization/app_localizations_context.dart';
import 'package:last_bottle/widgets/wheel.dart';

class RecycleEndScreen extends StatelessWidget {
  const RecycleEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade800],
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
                AutoSizeText(
                  context.loc.wheelScreenTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  child: AutoSizeText(
                    context.loc.wheelScreenSubTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16.0),
                    maxLines: 2,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: const Wheel(),
                ),
                const Spacer(flex: 2),
                AutoSizeText(
                  context.loc.spinHint,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
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
