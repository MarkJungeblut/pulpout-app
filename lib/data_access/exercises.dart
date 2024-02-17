import 'dart:convert';

import 'package:http/http.dart';

import '../model/exercise.dart';

Future<List<Exercise>> getExercises() async {
  final response = await get(Uri.parse('http://localhost:8080/exercise'));

  if (response.statusCode == 200) {
    Iterable exercises = jsonDecode(response.body);
    return List<Exercise>.from(
        exercises.map((exercise) => Exercise.fromJson(exercise)));
  }

  throw Exception("Failed to load exercises");
}
