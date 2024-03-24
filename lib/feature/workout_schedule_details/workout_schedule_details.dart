import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/workout_schedule_overview/workout_schedule_overview_header.dart';

class WorkoutScheduleDetails extends StatelessWidget {

  final WorkoutSchedule workoutSchedule;

  const WorkoutScheduleDetails({super.key, required this.workoutSchedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WorkoutScheduleOverviewHeader(),
            Expanded(
              child: Text(workoutSchedule.name)
            )
          ]
      ),
    );
  }

}
