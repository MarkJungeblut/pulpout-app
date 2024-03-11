import 'package:flutter/cupertino.dart';
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
        return WorkoutScheduleItem(workoutSchedule: workoutSchedules[index]);
      },
    );
  }

}
