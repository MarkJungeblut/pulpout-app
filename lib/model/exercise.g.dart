// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      json['Id'] as int,
      json['Name'] as String,
      json['Description'] as String,
      ExerciseGroup.fromJson(json['ExerciseGroup'] as Map<String, dynamic>),
    )..advices = (json['Advices'] as List<dynamic>).map((e) => Advice.fromJson(e as Map<String, dynamic>)).toList();

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'ExerciseGroup': instance.exerciseGroup,
      'Advices': instance.advices,
    };
