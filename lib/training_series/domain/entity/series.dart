import 'package:equatable/equatable.dart';

import 'series_class.dart';

class Series extends Equatable {
  final String description;
  final String imageUrl;
  final String title;
  final String id;
  final String overviewVideoUrl;
  final InstructorInfo instructorInfo;
  final int totalRunTime;
  final Difficulty difficulty;
  final String intensity;
  final List<SeriesClass> classes;

  const Series({
    required this.description,
    required this.overviewVideoUrl,
    required this.instructorInfo,
    required this.totalRunTime,
    required this.difficulty,
    required this.intensity,
    required this.classes,
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
      ];
}

enum Difficulty { beginner, intermediate, advanced }

class InstructorInfo {
  final String name;
  final String imageUrl;
  final String jobTitle;
  final String about;

  const InstructorInfo({
    required this.name,
    required this.imageUrl,
    required this.jobTitle,
    required this.about,
  });
}
