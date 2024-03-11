import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/data_access/workout_schedule.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/empty.dart';
import 'package:pulpout/ui/header_image.dart';
import 'package:pulpout/ui/title_bar.dart';
import 'package:pulpout/ui/workout_schedule_overview/workout_schedule_item.dart';

import '../ui/workout_schedule_overview/workout_schedule_overview_header.dart';
import 'new_workout_schedule.dart';

final reloadWorkoutSchedulesProvider = Provider((ref) => UniqueKey());

class WorkoutScheduleOverview extends StatelessWidget {
  const WorkoutScheduleOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const WorkoutScheduleOverviewHeader(),
          Expanded(
            child: FutureBuilder<List<WorkoutSchedule>>(
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
                  return const Empty(
                      title: "Bereit für den ersten Schritt?",
                      subtitle: "Füge einen Trainingsplan hinzu um direkt loszulegen.",
                      offset: Offset(0, -50)
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(bottom: 130),
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
            )
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewTrainingPlan()));
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
