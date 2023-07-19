import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../../core/errors/server_exception.dart';
import '../../domain/entity/series.dart';
import '../../domain/repository/base_series_repository.dart';
import '../data_source/series_data_source.dart';

class SeriesRepository extends BaseSeriesRepository {
  final BaseSeriesDataSource baseSeriesRemoteDataSource;

  SeriesRepository(this.baseSeriesRemoteDataSource);

  @override
  Future<Either<Failure, Series>> fetchSeriesDetails() async {
    try {
      final result = await baseSeriesRemoteDataSource.fetchSeriesDetails();

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
