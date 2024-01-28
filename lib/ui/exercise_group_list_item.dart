import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/model/exercise_group.dart';

import '../model/exercise.dart';
import 'exercise_details.dart';
import 'exercise_list_item.dart';

class ExerciseGroupListItem extends StatelessWidget {

  final ExerciseGroup exerciseGroup;
  final Iterable<Exercise> exercises;
  final ExerciseCallback exerciseAdded;

  const ExerciseGroupListItem({super.key, required this.exerciseGroup, required this.exercises, required this.exerciseAdded});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(exerciseGroup.name),
      children: exercises.map((exercise) {
        return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return ExerciseDetails(exercise: exercise, exerciseAdded: exerciseAdded);
                },
              );
            },
            child: ExerciseListItem(exercise: exercise)
        );
      }).toList(),
    );
  }

}
