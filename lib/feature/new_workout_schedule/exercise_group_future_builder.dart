import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/data_access/exercise_groups.dart';
import 'package:pulpout/feature/new_workout_schedule/exercise_future_builder.dart';
import 'package:pulpout/model/exercise_group.dart';

class ExerciseGroupFutureBuilder extends StatelessWidget {
  const ExerciseGroupFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExerciseGroup>>(
      future: getExerciseGroups(),
      builder: (BuildContext context, AsyncSnapshot<List<ExerciseGroup>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text("Error occurred: ${snapshot.error}");
        }

        final List<ExerciseGroup> exerciseGroups = snapshot.data!;

        return ExerciseFutureBuilder(exerciseGroups: exerciseGroups);
      },
    );

  }

}
