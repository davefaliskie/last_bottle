import 'package:flutter/material.dart';
import 'package:last_bottle/utils/responsive_sizes.dart';

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.label,
    required this.value,
    this.color = Colors.black,
  });

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: ResponsiveSizes(context).statItemContentSize,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutcomeStatCard extends StatelessWidget {
  const OutcomeStatCard({
    super.key,
    required this.image,
    required this.value,
  });

  final String image;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                image,
                height: ResponsiveSizes(context).statItemContentSize,
              ),
              Text(value)
            ],
          ),
        ),
      ),
    );
  }
}
