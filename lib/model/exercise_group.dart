import 'package:json_annotation/json_annotation.dart';

part 'exercise_group.g.dart';

@JsonSerializable()
class ExerciseGroup {
  @JsonKey(name: 'Id')
  late int id;

  @JsonKey(name: 'Name')
  late String name;

  factory ExerciseGroup.fromJson(Map<String, dynamic> json) =>
      _$ExerciseGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseGroupToJson(this);

  ExerciseGroup(this.id, this.name);
}
