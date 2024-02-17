import 'package:json_annotation/json_annotation.dart';

import 'exercise.dart';

part 'workout_schedule.g.dart';

@JsonSerializable()
class WorkoutSchedule {
  @JsonKey(name: 'Id')
  late int id;

  @JsonKey(name: 'Name')
  late String name;

  @JsonKey(name: 'Description')
  late String description;

  @JsonKey(name: 'Notes')
  late String notes;

  @JsonKey(name: 'Exercises')
  late List<Exercise> exercises;

  factory WorkoutSchedule.fromJson(Map<String, dynamic> json) => _$WorkoutScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutScheduleToJson(this);

  WorkoutSchedule(this.id, this.name, this.description, this.notes, this.exercises);
}
