import 'package:json_annotation/json_annotation.dart';

part 'advice.g.dart';

@JsonSerializable()
class Advice {
  @JsonKey(name: 'Id')
  late int id;

  @JsonKey(name: 'Name')
  late String name;

  @JsonKey(name: 'ExerciseId')
  late int excerciseId;

  factory Advice.fromJson(Map<String, dynamic> json) => _$AdviceFromJson(json);

  Map<String, dynamic> toJson() => _$AdviceToJson(this);

  Advice(this.id, this.name);
}
