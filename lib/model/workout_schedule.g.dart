// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSchedule _$WorkoutScheduleFromJson(Map<String, dynamic> json) =>
    WorkoutSchedule(
      json['Id'] as int,
      json['Name'] as String,
      json['Description'] as String,
      json['Notes'] as String,
      (json['Exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutScheduleToJson(WorkoutSchedule instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'Notes': instance.notes,
      'Exercises': instance.exercises,
    };
