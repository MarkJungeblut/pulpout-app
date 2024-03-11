import 'package:flutter/material.dart';
import 'package:pulpout/data_access/exercises.dart';
import 'package:pulpout/feature/new_workout_schedule/exercise_group_list_view.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/model/exercise_group.dart';

class ExerciseFutureBuilder extends StatelessWidget {

  final List<ExerciseGroup> exerciseGroups;

  const ExerciseFutureBuilder({super.key, required this.exerciseGroups});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Exercise>>(
      future: getExercises(),
      builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text("Error occurred: ${snapshot.error}");
        }

        final List<Exercise> exercises = snapshot.data!;

        return Container(
          padding: const EdgeInsets.only(bottom: 130),
          child: ExerciseGroupListView(exerciseGroups: exerciseGroups, exercises: exercises)
        );
      },
    );
  }

}
