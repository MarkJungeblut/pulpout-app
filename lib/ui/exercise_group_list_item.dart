import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/model/exercise_group.dart';

import '../model/exercise.dart';
import 'exercise_details.dart';
import 'exercise_list_item.dart';

class ExerciseGroupListItem extends StatelessWidget {
  final ExerciseGroup exerciseGroup;
  final Iterable<Exercise> exercises;

  const ExerciseGroupListItem({super.key, required this.exerciseGroup, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(exerciseGroup.name),
      children: exercises.map((exercise) {
        return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return ExerciseDetails(exercise: exercise);
                },
              );
            },
            child: ExerciseListItem(exercise: exercise));
      }).toList(),
    );
  }
}
