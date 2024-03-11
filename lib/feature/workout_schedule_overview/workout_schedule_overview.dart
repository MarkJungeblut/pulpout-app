import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/feature/workout_schedule_overview/workout_schedule_future_builder.dart';

import '../../ui/workout_schedule_overview/workout_schedule_overview_header.dart';
import '../new_workout_schedule/new_workout_schedule.dart';

final reloadWorkoutSchedulesProvider = Provider((ref) => UniqueKey());

class WorkoutScheduleOverview extends StatelessWidget {
  const WorkoutScheduleOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkoutScheduleOverviewHeader(),
            Expanded(
              child: WorkoutScheduleFutureBuilder()
            )
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NewWorkoutSchedule()));
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
