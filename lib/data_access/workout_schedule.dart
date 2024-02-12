import 'dart:convert';

import 'package:http/http.dart';
import 'package:pulpout/model/workout_schedule.dart';

Future<WorkoutSchedule> postWorkoutSchedule(WorkoutSchedule workoutSchedule) async {
  final response = await post(Uri.parse('http://localhost:8080/workout/schedule'), body: jsonEncode(workoutSchedule.toJson()));

  if (response.statusCode == 200) {
    WorkoutSchedule workoutSchedule = WorkoutSchedule.fromJson(jsonDecode(response.body));
    return workoutSchedule;
  }

  throw Exception("Failed to add workout schedule");
}
