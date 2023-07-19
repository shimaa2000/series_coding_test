import 'package:coding_test/training_series/data/data_source/mock_data_source.dart';
import 'package:coding_test/training_series/data/data_source/series_data_source.dart';
import 'package:coding_test/training_series/data/repository/series_repository.dart';
import 'package:coding_test/training_series/domain/repository/base_series_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Repository
    sl.registerLazySingleton<BaseSeriesRepository>(() => SeriesRepository(sl()));

    ///MockDatasource
    sl.registerLazySingleton<BaseSeriesDataSource>(() => MockDataSource());
  }
}
