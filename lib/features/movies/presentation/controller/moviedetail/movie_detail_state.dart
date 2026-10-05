import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie_detail.dart';

part 'movie_detail_state.freezed.dart';

@freezed
abstract class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    MovieDetail? movieDetail,
    @Default(RequestState.loading) RequestState movieDetailState,
    @Default('') String movieDetailMessage,
    @Default(false) bool isFavorite,
    @Default(false) bool isFavoriteUpdating,
    @Default('') String favoriteMessage,
  }) = _MovieDetailState;
}
