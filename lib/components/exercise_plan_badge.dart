import 'package:flutter/material.dart';

class ExercisePlanBadge extends StatelessWidget {

  final String planName;
  final int executionCount;

  const ExercisePlanBadge({super.key, required this.planName, required this.executionCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          planName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          executionCount.toString(),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          "times completed",
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }

}
