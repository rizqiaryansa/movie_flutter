import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie.dart';

part 'movie_section_state.freezed.dart';

@freezed
abstract class MovieSectionState with _$MovieSectionState {
  const factory MovieSectionState({
    @Default(<Movie>[]) List<Movie> movies,
    @Default(RequestState.loading) RequestState requestState,
    @Default('') String message,
  }) = _MovieSectionState;
}
