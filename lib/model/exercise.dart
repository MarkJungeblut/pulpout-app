import 'package:json_annotation/json_annotation.dart';

import 'exercise_group.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {

  @JsonKey(name: 'Id')
  late int id;

  @JsonKey(name: 'Name')
  late String name;

  @JsonKey(name: 'Description')
  late String description;

  @JsonKey(name: 'ExerciseGroup')
  late ExerciseGroup exerciseGroup;

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  Exercise(
      this.id,
      this.name,
      this.description,
      this.exerciseGroup
  );
}
