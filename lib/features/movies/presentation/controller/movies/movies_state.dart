import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movie_section_state.dart';

part 'movies_state.freezed.dart';

@freezed
abstract class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default(MovieSectionState()) MovieSectionState nowPlaying,
    @Default(MovieSectionState()) MovieSectionState popular,
    @Default(MovieSectionState()) MovieSectionState topRated,
  }) = _MoviesState;
}
