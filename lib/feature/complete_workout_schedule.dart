import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/data_access/workout_schedule.dart';
import 'package:pulpout/feature/workout_schedule_overview/workout_schedule_overview.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/state/workout_schedule_exercise_notifier.dart';

import '../ui/header_image.dart';

class CompleteWorkoutSchedule extends StatelessWidget {
  final isTitleSetProvider = StateProvider<bool>((ref) => false);
  final titleProvider = StateProvider<String>((ref) => "Mein Trainingsplan");

  final TextEditingController _controller = TextEditingController();

  final WorkoutSchedule workoutSchedule;

  CompleteWorkoutSchedule({super.key, required this.workoutSchedule});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderImage(
            image: "https://as2.ftcdn.net/v2/jpg/01/74/21/25/1000_F_174212531_cerVf4uP6vinBWieBB46p2P5xVhnsNSK.jpg"),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fast geschafft!", style: TextStyle(fontSize: 32)),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text("🎉", style: TextStyle(fontSize: 64)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text("Nun fehlt nur noch der Name:", style: TextStyle(fontSize: 22)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Name des Trainingsplans",
                      suffixIcon: ref.watch(isTitleSetProvider) ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          // Clear the text when the clear button is pressed
                          ref.invalidate(isTitleSetProvider);
                          _controller.clear();
                        },
                      ) : null,
                    ),
                    onChanged: (String value) {
                      ref.read(isTitleSetProvider.notifier).state = value.isNotEmpty;
                      ref.read(titleProvider.notifier).state = value;
                    },
                  ),
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

            ref.invalidate(trainingPlanExerciseProvider);
            // TODO: Move to corresponding file
            ref.invalidate(reloadWorkoutSchedulesProvider);

            Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkoutScheduleOverview()));
          },
          child: const Icon(Icons.check),
        ),
      );
    });
  }

}
