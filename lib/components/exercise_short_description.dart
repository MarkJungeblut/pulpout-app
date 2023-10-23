import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseShortDescription extends StatelessWidget {

  final String title;
  final String subtitle;

  const ExerciseShortDescription({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
