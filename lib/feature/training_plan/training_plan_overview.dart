import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/data_access/workout_schedule.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/empty.dart';
import 'package:pulpout/ui/header_image.dart';
import 'package:pulpout/ui/title_bar.dart';

import 'new_training_plan.dart';

final reloadWorkoutSchedulesProvider = Provider((ref) => UniqueKey());

class TrainingPlanOverview extends StatelessWidget {
  const TrainingPlanOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderImage(
              image:
                  "https://as2.ftcdn.net/v2/jpg/01/74/21/25/1000_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg"),
          Container(
              margin: const EdgeInsets.only(top: 10, left: 10),
              child: TitleBar(
                title: "Trainingspläne",
                titleDetails: [
                  TitleDetails(title: "ÜBUNGEN", value: "-"),
                  TitleDetails(title: "MUSKELGRUPPEN", value: "-"),
                  TitleDetails(title: "MUSKELN", value: "-"),
                ],
              )),
          Expanded(
              child: FutureBuilder<List<WorkoutSchedule>>(
            future: getWorkoutSchedules(),
            key: ref.watch(reloadWorkoutSchedulesProvider),
            builder: (BuildContext context,
                AsyncSnapshot<List<WorkoutSchedule>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text("Error occurred: ${snapshot.error}");
              }

              final List<WorkoutSchedule> workoutSchedules = snapshot.data!;

              if (workoutSchedules.isEmpty) {
                return const Expanded(
                    child: Empty(
                        title: "Bereit für den ersten Schritt?",
                        subtitle:
                            "Füge einen Trainingsplan hinzu um direkt loszulegen.",
                        offset: Offset(0, -50)));
              } else {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: workoutSchedules.length,
                  itemBuilder: (context, index) {
                    return Text(workoutSchedules[index].id.toString());
                  },
                );
              }
            },
          ))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewTrainingPlan()));
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
