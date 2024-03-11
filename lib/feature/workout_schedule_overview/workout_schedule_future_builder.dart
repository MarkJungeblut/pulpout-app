import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/data_access/workout_schedule.dart';
import 'package:pulpout/ui/workout_schedule_overview/workout_schedule_empty.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/workout_schedule_overview/workout_schedule_item/workout_schedule_item.dart';

final reloadWorkoutSchedulesProvider = Provider((ref) => UniqueKey());

class WorkoutScheduleFutureBuilder extends ConsumerWidget {

  const WorkoutScheduleFutureBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<WorkoutSchedule>>(
      future: getWorkoutSchedules(),
      key: ref.watch(reloadWorkoutSchedulesProvider),
      builder: (BuildContext context, AsyncSnapshot<List<WorkoutSchedule>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text("Error occurred: ${snapshot.error}");
        }

        final List<WorkoutSchedule> workoutSchedules = snapshot.data!;

        if (workoutSchedules.isEmpty) {
          return const WorkoutScheduleEmpty();
        } else {
          return Container(
            padding: const EdgeInsets.only(bottom: 130),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: workoutSchedules.length,
              itemBuilder: (context, index) {
                return WorkoutScheduleItem(workoutSchedule: workoutSchedules[index]);
              },
            ),
          );
        }
      },
    );
  }

}
