import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/components/count_item.dart';
import 'package:pulpout/components/exercise_short_description.dart';

import 'pulpout_box_decoration.dart';

class ExerciseItem extends StatelessWidget {

  final double weight;
  final double repetition;

  const ExerciseItem({super.key, required this.weight, required this.repetition});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: pulpoutBoxDecoration,
      child: Row(
        children: [
          CountItem(count: weight, unit: "kg", padding: const EdgeInsets.all(15)),
          CountItem(count: repetition, unit: "wdh.", padding: const EdgeInsets.all(15)),
          const ExerciseShortDescription(title: "Kurzhantel: Bankdrücken", subtitle: "Lorem Ipsum")
        ],
      ),
    );
  }

}
