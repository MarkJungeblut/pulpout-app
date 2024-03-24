import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/feature/complete_workout_schedule/complete_workout_schedule.dart';
import 'package:pulpout/feature/new_workout_schedule/exercise_group_future_builder.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/new_workout_schedule/new_workout_schedule_header.dart';

import '../../state/workout_schedule_exercise_notifier.dart';

class NewWorkoutSchedule extends ConsumerWidget {

  const NewWorkoutSchedule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewWorkoutScheduleHeader(),
          Expanded(
            child: ExerciseGroupFutureBuilder()
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.watch(selectedExerciseProvider).isEmpty ? null : () async {
          List<Exercise> exercises = ref.read(selectedExerciseProvider);
          print("List of exercises ${exercises.length}");

          WorkoutSchedule workoutSchedule =
              WorkoutSchedule(0, "", "", "", exercises);

          Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteWorkoutSchedule(workoutSchedule: workoutSchedule)));
        },
        foregroundColor: ref.watch(selectedExerciseProvider).isEmpty ? Colors.grey : null,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
