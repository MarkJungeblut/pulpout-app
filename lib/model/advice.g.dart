// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advice _$AdviceFromJson(Map<String, dynamic> json) => Advice(
      json['Id'] as int,
      json['Name'] as String,
    )..excerciseId = json['ExerciseId'] as int;

Map<String, dynamic> _$AdviceToJson(Advice instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'ExerciseId': instance.excerciseId,
    };
