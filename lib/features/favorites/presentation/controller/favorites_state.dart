import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_flutter/core/utils/enums.dart';

import '../../domain/entities/favorite_movie.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(<FavoriteMovie>[]) List<FavoriteMovie> movies,
    @Default(RequestState.loading) RequestState requestState,
    @Default('') String message,
  }) = _FavoritesState;
}
