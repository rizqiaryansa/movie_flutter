import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_flutter/core/error/failure.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/favorites/domain/entities/favorite_movie.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/watch_favorite_status_usecase.dart';
import 'package:movie_flutter/features/movies/domain/entities/genre.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_flutter/features/movies/presentation/controller/moviedetail/movie_detail_bloc.dart';
import 'package:movie_flutter/features/movies/presentation/controller/moviedetail/movie_detail_event.dart';
import 'package:movie_flutter/features/movies/presentation/controller/moviedetail/movie_detail_state.dart';

class MockGetMovieDetailUseCase extends Mock implements GetMovieDetailUseCase {}

class MockWatchFavoriteStatusUseCase extends Mock
    implements WatchFavoriteStatusUseCase {}

class MockAddFavoriteUseCase extends Mock implements AddFavoriteUseCase {}

class MockRemoveFavoriteUseCase extends Mock implements RemoveFavoriteUseCase {}

void main() {
  const movieDetail = MovieDetail(
    id: 42,
    title: 'Test Detail',
    overview: 'A movie used by the Bloc tests.',
    releaseDate: '2026-01-10',
    runtime: 120,
    backdropPath: '/detail.jpg',
    genres: [Genre(id: 28, name: 'Action')],
    voteAverage: 8.5,
  );
  const newerMovieDetail = MovieDetail(
    id: 84,
    title: 'Newer Detail',
    overview: 'The newest request must win.',
    releaseDate: '2026-02-20',
    runtime: 105,
    backdropPath: '/newer.jpg',
    genres: [Genre(id: 18, name: 'Drama')],
    voteAverage: 7.9,
  );
  const favoriteMovie = FavoriteMovie(
    id: 42,
    title: 'Test Detail',
    backdropPath: '/detail.jpg',
    voteAverage: 8.5,
    releaseDate: '2026-01-10',
  );

  late MockGetMovieDetailUseCase getMovieDetailUseCase;
  late MockWatchFavoriteStatusUseCase watchFavoriteStatusUseCase;
  late MockAddFavoriteUseCase addFavoriteUseCase;
  late MockRemoveFavoriteUseCase removeFavoriteUseCase;

  MovieDetailBloc buildBloc() {
    return MovieDetailBloc(
      getMovieDetailUseCase,
      watchFavoriteStatusUseCase,
      addFavoriteUseCase,
      removeFavoriteUseCase,
    );
  }

  setUpAll(() {
    registerFallbackValue(favoriteMovie);
  });

  setUp(() {
    getMovieDetailUseCase = MockGetMovieDetailUseCase();
    watchFavoriteStatusUseCase = MockWatchFavoriteStatusUseCase();
    addFavoriteUseCase = MockAddFavoriteUseCase();
    removeFavoriteUseCase = MockRemoveFavoriteUseCase();
  });

  test('initial state is loading and not favorite', () async {
    final bloc = buildBloc();

    expect(bloc.state, const MovieDetailState());

    await bloc.close();
  });

  blocTest<MovieDetailBloc, MovieDetailState>(
    'loads the requested movie detail',
    setUp: () {
      when(() => watchFavoriteStatusUseCase(movieDetail.id))
          .thenAnswer((_) => const Stream.empty());
      when(() => getMovieDetailUseCase(movieDetail.id))
          .thenAnswer((_) async => const Right(movieDetail));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(MovieDetailRequested(movieDetail.id)),
    expect: () => const [
      MovieDetailState(),
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
      ),
    ],
    verify: (_) {
      verify(() => watchFavoriteStatusUseCase(movieDetail.id)).called(1);
      verify(() => getMovieDetailUseCase(movieDetail.id)).called(1);
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'emits an error when loading the movie detail fails',
    setUp: () {
      when(() => watchFavoriteStatusUseCase(movieDetail.id))
          .thenAnswer((_) => const Stream.empty());
      when(() => getMovieDetailUseCase(movieDetail.id))
          .thenAnswer((_) async => const Left(ServerFailure('Detail failed.')));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(MovieDetailRequested(movieDetail.id)),
    expect: () => const [
      MovieDetailState(),
      MovieDetailState(
        movieDetailState: RequestState.error,
        movieDetailMessage: 'Detail failed.',
      ),
    ],
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'updates favorite status from the watched Drift stream',
    setUp: () {
      when(() => watchFavoriteStatusUseCase(movieDetail.id))
          .thenAnswer((_) => Stream.value(const Right(true)));
      when(() => getMovieDetailUseCase(movieDetail.id))
          .thenAnswer((_) async => const Right(movieDetail));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(MovieDetailRequested(movieDetail.id)),
    expect: () => const [
      MovieDetailState(),
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
      ),
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
        isFavorite: true,
      ),
    ],
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'adds a non-favorite movie and waits for the watched stream for status',
    setUp: () {
      when(() => addFavoriteUseCase(favoriteMovie))
          .thenAnswer((_) async => const Right(unit));
    },
    build: buildBloc,
    seed: () => const MovieDetailState(
      movieDetail: movieDetail,
      movieDetailState: RequestState.loaded,
    ),
    act: (bloc) => bloc.add(const MovieFavoriteToggled()),
    expect: () => const [
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
        isFavoriteUpdating: true,
      ),
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
        favoriteMessage: 'Added to favorites.',
      ),
    ],
    verify: (_) {
      verify(() => addFavoriteUseCase(favoriteMovie)).called(1);
      verifyNever(() => removeFavoriteUseCase(any()));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'removes an existing favorite movie',
    setUp: () {
      when(() => removeFavoriteUseCase(movieDetail.id))
          .thenAnswer((_) async => const Right(unit));
    },
    build: buildBloc,
    seed: () => const MovieDetailState(
      movieDetail: movieDetail,
      movieDetailState: RequestState.loaded,
      isFavorite: true,
    ),
    act: (bloc) => bloc.add(const MovieFavoriteToggled()),
    expect: () => const [
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
        isFavorite: true,
        isFavoriteUpdating: true,
      ),
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
        isFavorite: true,
        favoriteMessage: 'Removed from favorites.',
      ),
    ],
    verify: (_) {
      verify(() => removeFavoriteUseCase(movieDetail.id)).called(1);
      verifyNever(() => addFavoriteUseCase(any()));
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'exposes a favorite persistence failure and keeps the previous status',
    setUp: () {
      when(() => addFavoriteUseCase(favoriteMovie)).thenAnswer(
        (_) async => const Left(DatabaseFailure('Unable to save favorite.')),
      );
    },
    build: buildBloc,
    seed: () => const MovieDetailState(
      movieDetail: movieDetail,
      movieDetailState: RequestState.loaded,
    ),
    act: (bloc) => bloc.add(const MovieFavoriteToggled()),
    expect: () => const [
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
        isFavoriteUpdating: true,
      ),
      MovieDetailState(
        movieDetail: movieDetail,
        movieDetailState: RequestState.loaded,
        favoriteMessage: 'Unable to save favorite.',
      ),
    ],
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'restartable keeps the newer detail when an older request finishes later',
    setUp: () {
      when(() => watchFavoriteStatusUseCase(any()))
          .thenAnswer((_) => const Stream.empty());
    },
    build: buildBloc,
    act: (bloc) async {
      final olderRequest = Completer<Either<Failure, MovieDetail>>();

      when(() => getMovieDetailUseCase(movieDetail.id))
          .thenAnswer((_) => olderRequest.future);
      when(() => getMovieDetailUseCase(newerMovieDetail.id))
          .thenAnswer((_) async => const Right(newerMovieDetail));

      bloc.add(MovieDetailRequested(movieDetail.id));
      await Future<void>.delayed(Duration.zero);
      bloc.add(MovieDetailRequested(newerMovieDetail.id));
      await Future<void>.delayed(Duration.zero);
      olderRequest.complete(const Right(movieDetail));
    },
    expect: () => const [
      MovieDetailState(),
      MovieDetailState(
        movieDetail: newerMovieDetail,
        movieDetailState: RequestState.loaded,
      ),
    ],
    verify: (_) {
      verify(() => getMovieDetailUseCase(movieDetail.id)).called(1);
      verify(() => getMovieDetailUseCase(newerMovieDetail.id)).called(1);
    },
  );
}
