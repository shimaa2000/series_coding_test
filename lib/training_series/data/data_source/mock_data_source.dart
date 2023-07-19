import 'package:coding_test/training_series/data/data_source/series_data_source.dart';
import 'package:coding_test/training_series/data/model/series_model.dart';
import 'package:dio/dio.dart';

import '../../core/errors/server_exception.dart';
import '../../core/network/error_message_model.dart';

class MockDataSource implements BaseSeriesDataSource{
  @override
  Future<SeriesModel> fetchSeriesDetails() async{
    try{
      return SeriesModel.fromJson(const {
        'id': '1',
        'description': 'Series Description',
        'imageUrl': 'https://loremflickr.com/320/240',
        'title': 'Series Title',
        'overviewVideoUrl': 'https://loremflickr.com/320/240',
        'instructorInfo': {
          'name': 'John Doe',
          'imageUrl': 'https://loremflickr.com/320/240',
          'jobTitle': 'Instructor',
          'about': ' lorem ipsum',
        },
        'totalRunTime': 1800,
        'difficulty': 'beginner',
        'intensity': 'Level 1',
        'classes': [
          {
            'videoUrl': 'https://loremflickr.com/320/240',
            'title': 'Class Title',
            'duration': '12',
            'description': 'Class Description'
          },
          {
            'videoUrl': 'https://loremflickr.com/320/240',
            'title': 'Class Title 2',
            'duration': '12',
            'description': 'Class Description'
          }
        ]
      });
    }on DioException catch (e) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
    }
  }

}