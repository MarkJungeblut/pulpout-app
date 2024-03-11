import 'package:flutter/cupertino.dart';
import 'package:pulpout/model/exercise.dart';
import 'package:pulpout/model/exercise_group.dart';
import 'package:pulpout/ui/exercise_overview/exercise_group_list_item.dart';

class ExerciseGroupListView extends StatelessWidget {

  final List<ExerciseGroup> exerciseGroups;
  final List<Exercise> exercises;

  const ExerciseGroupListView({super.key, required this.exerciseGroups, required this.exercises});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: exerciseGroups.length,
      itemBuilder: (context, index) {
        final ExerciseGroup exerciseGroup = exerciseGroups[index];
        final Iterable<Exercise> exercisesOfGroup = getExercisesOfExerciseGroup(exerciseGroup, exercises);

        return ExerciseGroupListItem(
          exerciseGroup: exerciseGroup,
          exercises: exercisesOfGroup
        );
      },
    );
  }

  Iterable<Exercise> getExercisesOfExerciseGroup(ExerciseGroup exerciseGroup, Iterable<Exercise> exercises) {
    return exercises.where((element) => element.exerciseGroup.id == exerciseGroup.id);
  }
}
