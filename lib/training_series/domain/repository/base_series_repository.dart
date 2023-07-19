import 'package:coding_test/training_series/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/series.dart';

abstract class BaseSeriesRepository {
  Future<Either<Failure, Series>> fetchSeriesDetails();
}
