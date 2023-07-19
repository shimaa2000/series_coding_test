// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesModel _$SeriesModelFromJson(Map<String, dynamic> json) => SeriesModel(
      description: json['description'] as String,
      overviewVideoUrl: json['overviewVideoUrl'] as String,
      instructorInfo: InstructorInfoModel.fromJson(
          json['instructorInfo'] as Map<String, dynamic>),
      totalRunTime: json['totalRunTime'] as int,
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
      intensity: json['intensity'] as String,
      classes: (json['classes'] as List<dynamic>)
          .map((e) => SeriesClassModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$SeriesModelToJson(SeriesModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'id': instance.id,
      'overviewVideoUrl': instance.overviewVideoUrl,
      'totalRunTime': instance.totalRunTime,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'intensity': instance.intensity,
      'instructorInfo': instance.instructorInfo,
      'classes': instance.classes,
    };

const _$DifficultyEnumMap = {
  Difficulty.beginner: 'beginner',
  Difficulty.intermediate: 'intermediate',
  Difficulty.advanced: 'advanced',
};

InstructorInfoModel _$InstructorInfoModelFromJson(Map<String, dynamic> json) =>
    InstructorInfoModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      jobTitle: json['jobTitle'] as String,
      about: json['about'] as String,
    );

Map<String, dynamic> _$InstructorInfoModelToJson(
        InstructorInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'jobTitle': instance.jobTitle,
      'about': instance.about,
    };

SeriesClassModel _$SeriesClassModelFromJson(Map<String, dynamic> json) =>
    SeriesClassModel(
      videoUrl: json['videoUrl'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SeriesClassModelToJson(SeriesClassModel instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'title': instance.title,
      'duration': instance.duration,
      'description': instance.description,
    };
