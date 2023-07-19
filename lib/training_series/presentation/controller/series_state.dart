part of 'series_cubit.dart';

class SeriesState extends Equatable {
  final RequestState seriesRequestState;
  final Series? series;
  final String message;

  const SeriesState({
    this.seriesRequestState = RequestState.initial,
    this.message = '',
    this.series,
  });

  SeriesState copyWith({Series? series, String? message, RequestState? seriesRequestState}) =>
      SeriesState(
        series: series ?? this.series,
        seriesRequestState: seriesRequestState ?? this.seriesRequestState,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        series,
      ];
}

enum RequestState { initial, loading, loaded, error }
