import 'package:flutter/material.dart';
import 'package:last_bottle/achievements/domain/achievement.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    super.key,
    required this.achievement,
  });

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: achievement.obtained
          ? achievement.passContent.dartColor
          : Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              achievement.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              achievement.hint,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
