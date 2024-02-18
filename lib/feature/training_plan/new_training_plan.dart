import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/feature/training_plan/complete_workout_schedule.dart';
import 'package:pulpout/feature/training_plan/training_plan_overview.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/model/exercise_group.dart';
import 'package:pulpout/model/workout_schedule.dart';
import 'package:pulpout/ui/exercise_group_list_item.dart';
import 'package:pulpout/ui/header_image.dart';
import 'package:pulpout/ui/new_training_plan_header.dart';

import '../../data_access/exercise_groups.dart';
import '../../data_access/exercises.dart';
import '../../data_access/workout_schedule.dart';
import '../../state/training_plan_exercise_notifier.dart';

class NewTrainingPlan extends StatelessWidget {

  const NewTrainingPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderImage(
              image: "https://as2.ftcdn.net/v2/jpg/01/79/81/77/1000_F_179817756_QzTocli57q9G6a1Oe7kJtoMS5dNMU8cl.jpg"),
            // NewTrainingPlanHeader(
            //   nameChanged: (name) => scheduleName = name,
            // ),
            Expanded(
              child: FutureBuilder<List<ExerciseGroup>>(
              future: getExerciseGroups(),
              builder: (BuildContext context, AsyncSnapshot<List<ExerciseGroup>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text("Error occurred: ${snapshot.error}");
                }

                final List<ExerciseGroup> exerciseGroups = snapshot.data!;

                return FutureBuilder<List<Exercise>>(
                  future: getExercises(),
                  builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text("Error occurred: ${snapshot.error}");
                    }

                    final List<Exercise> exercises = snapshot.data!;

                    return Container(
                      padding: EdgeInsets.only(bottom: 130),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: exerciseGroups.length,
                        itemBuilder: (context, index) {
                          final Iterable<Exercise> exercisesOfGroup =
                          exercises.where((element) =>
                          element.exerciseGroup.id ==
                              exerciseGroups[index].id);
                          return ExerciseGroupListItem(
                              exerciseGroup: exerciseGroups[index],
                              exercises: exercisesOfGroup);
                        },
                      ),
                    );
                  },
                );
              },
            )
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: ref.watch(trainingPlanExerciseProvider).isEmpty ? null : () async {
            List<Exercise> exercises = ref.read(trainingPlanExerciseProvider);
            print("List of exercises ${exercises.length}");

            WorkoutSchedule workoutSchedule =
                WorkoutSchedule(0, "", "", "", exercises);

            Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteWorkoutSchedule(workoutSchedule: workoutSchedule)));
          },
          //backgroundColor: ref.watch(trainingPlanExerciseProvider).isEmpty ? Colors.grey : null,
          foregroundColor: ref.watch(trainingPlanExerciseProvider).isEmpty ? Colors.grey : null,
          child: const Icon(Icons.arrow_forward),
        ),
      );
    });
  }
}
