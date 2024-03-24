import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulpout/model/exercise.dart';

final selectedExerciseProvider =
    NotifierProvider<SelectedExercisesNotifier, List<Exercise>>(SelectedExercisesNotifier.new);

class SelectedExercisesNotifier extends Notifier<List<Exercise>> {
  @override
  List<Exercise> build() {
    return List.empty(growable: true);
  }

  void addExercise(Exercise exercise) {
    if (!exists(exercise)) {
      state = [...state, exercise];
    }

    ref.notifyListeners();
  }

  void removeExercise(Exercise exercise) {
    state = [
      for (final item in state)
        if (item.id != exercise.id) item
    ];

    ref.notifyListeners();
  }

  bool exists(Exercise exercise) {
    return state.any((element) => element.id == exercise.id);
  }
}
