import '../model/series_model.dart';

abstract class BaseSeriesDataSource{
  Future<SeriesModel> fetchSeriesDetails();
}