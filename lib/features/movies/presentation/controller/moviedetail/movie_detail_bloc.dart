import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/error/failure.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/favorites/domain/entities/favorite_movie.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/watch_favorite_status_usecase.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_movie_detail_usecase.dart';

import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

@injectable
class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final WatchFavoriteStatusUseCase watchFavoriteStatusUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  StreamSubscription<Either<Failure, bool>>? _favoriteStatusSubscription;

  MovieDetailBloc(
    this.getMovieDetailUseCase,
    this.watchFavoriteStatusUseCase,
    this.addFavoriteUseCase,
    this.removeFavoriteUseCase,
  ) : super(const MovieDetailState()) {
    on<MovieDetailRequested>(
      _onMovieDetailRequested,
      // this restartable to allow cancel the previous handler and process the newest event
      transformer: restartable(),
    );
    on<MovieFavoriteToggled>(_onMovieFavoriteToggled);
    on<MovieFavoriteStatusChanged>(_onMovieFavoriteStatusChanged);
    on<MovieFavoriteStatusFailed>(_onMovieFavoriteStatusFailed);
  }

  Future<void> _onMovieDetailRequested(
    MovieDetailRequested event,
    Emitter<MovieDetailState> emit,
  ) async {
    await _favoriteStatusSubscription?.cancel();
    _favoriteStatusSubscription = watchFavoriteStatusUseCase(event.movieId)
        .listen(
          (result) => result.fold(
            (failure) => add(MovieFavoriteStatusFailed(failure.message)),
            (isFavorite) => add(MovieFavoriteStatusChanged(isFavorite)),
          ),
        );

    emit(
      state.copyWith(
        movieDetailState: RequestState.loading,
        movieDetailMessage: '',
        favoriteMessage: '',
      ),
    );

    final result = await getMovieDetailUseCase(event.movieId);

    result.fold(
      (error) => emit(
        state.copyWith(
          movieDetailState: RequestState.error,
          movieDetailMessage: error.message,
        ),
      ),
      (movieDetail) => emit(
        state.copyWith(
          movieDetailState: RequestState.loaded,
          movieDetail: movieDetail,
          movieDetailMessage: '',
        ),
      ),
    );
  }

  Future<void> _onMovieFavoriteToggled(
    MovieFavoriteToggled event,
    Emitter<MovieDetailState> emit,
  ) async {
    final movie = state.movieDetail;
    if (movie == null || state.isFavoriteUpdating) return;

    final wasFavorite = state.isFavorite;
    emit(state.copyWith(isFavoriteUpdating: true, favoriteMessage: ''));

    final result = wasFavorite
        ? await removeFavoriteUseCase(movie.id)
        : await addFavoriteUseCase(
            FavoriteMovie(
              id: movie.id,
              title: movie.title,
              backdropPath: movie.backdropPath,
              voteAverage: movie.voteAverage,
              releaseDate: movie.releaseDate,
            ),
          );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isFavoriteUpdating: false,
          favoriteMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          isFavoriteUpdating: false,
          favoriteMessage: wasFavorite
              ? 'Removed from favorites.'
              : 'Added to favorites.',
        ),
      ),
    );
  }

  void _onMovieFavoriteStatusChanged(
    MovieFavoriteStatusChanged event,
    Emitter<MovieDetailState> emit,
  ) {
    emit(state.copyWith(isFavorite: event.isFavorite));
  }

  void _onMovieFavoriteStatusFailed(
    MovieFavoriteStatusFailed event,
    Emitter<MovieDetailState> emit,
  ) {
    emit(state.copyWith(favoriteMessage: event.message));
  }

  @override
  Future<void> close() async {
    await _favoriteStatusSubscription?.cancel();
    return super.close();
  }
}
