import 'package:flutter/material.dart';
import 'package:pulpout/ui/exercise_group_list_item.dart';
import 'package:pulpout/ui/new_training_plan_header.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/model/exercise_group.dart';

import '../../data_access/exercise_groups.dart';
import '../../data_access/exercises.dart';

class NewTrainingPlan extends StatelessWidget {

  const NewTrainingPlan({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NewTrainingPlanHeader(),
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

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: exerciseGroups.length,
                        itemBuilder: (context, index) {
                          final Iterable<Exercise> exercisesOfGroup = exercises.where((element) => element.exerciseGroup.id == exerciseGroups[index].id);
                          return ExerciseGroupListItem(exerciseGroup: exerciseGroups[index], exercises: exercisesOfGroup);
                        },
                      );
                    },
                  );
                },
              )
            )
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
