import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/achievements/domain/achievement.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/router.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.achievement,
  });

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final bool active = achievement.obtained;

    return InkWell(
      onTap: () {
        if (active) {
          context.pushNamed(
            AppRoute.addToWallet.name,
            extra: achievement.passContent.passType,
          );
        } else {
          _hintDialog(context, achievement.hint);
        }
      },
      child: Card(
        shadowColor: Colors.lightBlue,
        elevation: active ? 5 : 0,
        color: active
            ? achievement.passContent.dartColor
            : Colors.blueGrey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                achievement.title,
                style: TextStyle(
                  color: active ? Colors.white : Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(
                active ? achievement.iconData : Icons.lock,
                color: active ? Colors.white : Colors.black,
                size: 55.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _hintDialog(BuildContext context, String hint) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(defaultMargin),
          title: const Text("Here's a Hint"),
          content: Text(
            hint,
            style: const TextStyle(fontSize: 18),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
