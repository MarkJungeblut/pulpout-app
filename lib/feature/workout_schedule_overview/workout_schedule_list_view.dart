import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulpout/feature/workout_schedule_details/workout_schedule_details.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/workout_schedule_overview/workout_schedule_item/workout_schedule_item.dart';

class WorkoutScheduleListView extends StatelessWidget {

  final List<WorkoutSchedule> workoutSchedules;

  const WorkoutScheduleListView({super.key, required this.workoutSchedules});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: workoutSchedules.length,
      itemBuilder: (context, index) {
        return WorkoutScheduleItem(workoutSchedule: workoutSchedules[index], workoutScheduleSelected: (workoutSchedule) => onWorkoutScheduleSelected(workoutSchedule, context));
      },
    );
  }


  void onWorkoutScheduleSelected(WorkoutSchedule workoutSchedule, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutScheduleDetails(workoutSchedule: workoutSchedule)));
  }
}
