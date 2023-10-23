import 'package:flutter/material.dart';

class TimeSpentBadge extends StatelessWidget {

  final int seconds;

  const TimeSpentBadge({ super.key, required this.seconds });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Time spent",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          secondsToHours(seconds).toString(),
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }


  int secondsToHours(int seconds) {
    return (seconds / 3600.0).round();
  }
}
