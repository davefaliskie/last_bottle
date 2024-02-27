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
    );
  }
}
