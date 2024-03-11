import 'package:flutter/cupertino.dart';
import 'package:pulpout/model/workout_schedule.dart';

class WorkoutScheduleItemContent extends StatelessWidget {

  final WorkoutSchedule workoutSchedule;

  const WorkoutScheduleItemContent({super.key, required this.workoutSchedule});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              workoutSchedule.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

}
