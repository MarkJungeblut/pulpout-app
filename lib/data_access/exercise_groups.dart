
import 'dart:convert';

import 'package:http/http.dart';

import '../model/exercise_group.dart';

Future<List<ExerciseGroup>> getExerciseGroups() async {
  final response = await get(Uri.parse('http://localhost:8080/exercise/group'));

  if (response.statusCode == 200) {
    Iterable exerciseGroups = jsonDecode(response.body);
    return List<ExerciseGroup>.from(exerciseGroups.map((exerciseGroup) => ExerciseGroup.fromJson(exerciseGroup)));
  }

  throw Exception("Failed to load exercise groups");
}
