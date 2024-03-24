import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/workout_schedule_overview/workout_schedule_item/workout_schedule_item_content.dart';
import 'package:pulpout/ui/workout_schedule_overview/workout_schedule_item/workout_schedule_item_image.dart';

class WorkoutScheduleItem extends StatelessWidget {
  final void Function(WorkoutSchedule workoutSchedule) workoutScheduleSelected;

  final WorkoutSchedule workoutSchedule;

  const WorkoutScheduleItem({super.key, required this.workoutSchedule, required this.workoutScheduleSelected});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ListTile(
          onTap: () => workoutScheduleSelected(workoutSchedule),
          title: Container(
              height: 60,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const WorkoutScheduleItemImage(image: "https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
                  WorkoutScheduleItemContent(workoutSchedule: workoutSchedule),
                  IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert))
                ],
              )
          ),
        );
      },
    );
  }
}
