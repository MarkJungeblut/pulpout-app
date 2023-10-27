import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseShortDescription extends StatelessWidget {

  final String title;
  final String subtitle;
  final EdgeInsetsGeometry? padding;

  const ExerciseShortDescription({super.key, required this.title, required this.subtitle, this.padding });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
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
      )
    );
  }
}
