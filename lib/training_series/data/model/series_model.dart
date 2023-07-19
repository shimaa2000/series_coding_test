import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/series.dart';
import '../../domain/entity/series_class.dart';

part 'series_model.g.dart';

@JsonSerializable()
class SeriesModel extends Series {
  const SeriesModel(

      {required super.description,
      required super.overviewVideoUrl,
      required InstructorInfoModel super.instructorInfo,
      required super.totalRunTime,
      required super.difficulty,
      required super.intensity,
      required List<SeriesClassModel> super.classes,
      required super.imageUrl,
      required super.title,
      required super.id});

  factory SeriesModel.fromJson(Map<String, dynamic> json) => _$SeriesModelFromJson(json);
  @override
  InstructorInfoModel get instructorInfo => super.instructorInfo as InstructorInfoModel;

  @override
  List<SeriesClassModel> get classes => super.classes as List<SeriesClassModel>;
}

@JsonSerializable()
class InstructorInfoModel extends InstructorInfo {
  InstructorInfoModel({
    required super.name,
    required super.imageUrl,
    required super.jobTitle,
    required super.about,
  });

  factory InstructorInfoModel.fromJson(Map<String, dynamic> json) => _$InstructorInfoModelFromJson(json);
}

@JsonSerializable()
class SeriesClassModel extends SeriesClass {
  SeriesClassModel(
      {required super.videoUrl,
      required super.title,
      required super.duration,
      required super.description});
  factory SeriesClassModel.fromJson(Map<String, dynamic> json) => _$SeriesClassModelFromJson(json);
}
