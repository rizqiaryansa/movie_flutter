import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/usecase/base_usecase.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_event.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_state.dart';

@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<NowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<PopularMoviesEvent>(_getPopularMovies);
    on<TopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(
    NowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMovieUseCase(const NoParameters());
    result.fold(
      (error) => emit(
        state.copyWith(
          nowPlaying: state.nowPlaying.copyWith(
            requestState: RequestState.error,
            message: error.message,
          ),
        ),
      ),
      (movies) => emit(
        state.copyWith(
          nowPlaying: state.nowPlaying.copyWith(
            requestState: RequestState.loaded,
            movies: movies,
          ),
        ),
      ),
    );
  }

  Future<void> _getPopularMovies(
    PopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (error) => emit(
        state.copyWith(
          popular: state.popular.copyWith(
            requestState: RequestState.error,
            message: error.message,
          ),
        ),
      ),
      (movies) => emit(
        state.copyWith(
          popular: state.popular.copyWith(
            requestState: RequestState.loaded,
            movies: movies,
          ),
        ),
      ),
    );
  }

  Future<void> _getTopRatedMovies(
    TopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (error) => emit(
        state.copyWith(
          topRated: state.topRated.copyWith(
            requestState: RequestState.error,
            message: error.message,
          ),
        ),
      ),
      (movies) => emit(
        state.copyWith(
          topRated: state.topRated.copyWith(
            requestState: RequestState.loaded,
            movies: movies,
          ),
        ),
      ),
    );
  }
}
