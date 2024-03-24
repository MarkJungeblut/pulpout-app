import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/data_access/workout_schedule.dart';
import 'package:pulpout/feature/complete_workout_schedule/complete_workout_schedule_input.dart';
import 'package:pulpout/feature/workout_schedule_overview/workout_schedule_overview.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/state/workout_schedule_exercise_notifier.dart';
import 'package:pulpout/ui/complete_workout_schedule/complete_workout_schedule_description.dart';
import 'package:pulpout/ui/complete_workout_schedule/complete_workout_schedule_header.dart';

class CompleteWorkoutSchedule extends StatelessWidget {

  final WorkoutSchedule workoutSchedule;

  const CompleteWorkoutSchedule({super.key, required this.workoutSchedule});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CompleteWorkoutScheduleHeader(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CompleteWorkoutScheduleDescription(),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: CompleteWorkoutScheduleInput(),
                )
              ],
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            workoutSchedule.name = ref.read(titleProvider);

            // TODO: Add error handling
            try {
              await postWorkoutSchedule(workoutSchedule);
            } catch (error) {
              print("Error on inserting workout schedule: $error");
            }

            ref.invalidate(selectedExerciseProvider);
            ref.invalidate(reloadWorkoutSchedulesProvider);

            Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutScheduleOverview()));
          },
          child: const Icon(Icons.check),
        ),
      );
    });
  }

}
