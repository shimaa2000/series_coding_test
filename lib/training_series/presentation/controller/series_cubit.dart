import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_test/training_series/domain/entity/series.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repository/base_series_repository.dart';

part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  final BaseSeriesRepository _seriesRepository;

  SeriesCubit(this._seriesRepository) : super(const SeriesState());

  void fetchSeriesDetails() async {
    emit(state.copyWith(seriesRequestState: RequestState.loading));

    final result = await _seriesRepository.fetchSeriesDetails();
    result.fold((l) {
      emit(state.copyWith(
        seriesRequestState: RequestState.error,
        message: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        series: r,
        seriesRequestState: RequestState.loaded,
        message: 'success',
      ));
    });
  }
}
