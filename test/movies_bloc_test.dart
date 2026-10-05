import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_flutter/core/error/failure.dart';
import 'package:movie_flutter/core/usecase/base_usecase.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_flutter/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movie_section_state.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_bloc.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_event.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_state.dart';

class MockGetNowPlayingMovieUseCase extends Mock
    implements GetNowPlayingMovieUseCase {}

class MockGetPopularMoviesUseCase extends Mock
    implements GetPopularMoviesUseCase {}

class MockGetTopRatedMoviesUseCase extends Mock
    implements GetTopRatedMoviesUseCase {}

void main() {
  const movie = Movie(
    id: 1,
    title: 'Test Movie',
    backdropPath: '/test.jpg',
    voteAverage: 8.2,
    genreIds: [12, 28],
  );

  late MockGetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  late MockGetPopularMoviesUseCase getPopularMoviesUseCase;
  late MockGetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc buildBloc() {
    return MoviesBloc(
      getNowPlayingMovieUseCase,
      getPopularMoviesUseCase,
      getTopRatedMoviesUseCase,
    );
  }

  setUpAll(() {
    registerFallbackValue(const NoParameters());
  });

  setUp(() {
    getNowPlayingMovieUseCase = MockGetNowPlayingMovieUseCase();
    getPopularMoviesUseCase = MockGetPopularMoviesUseCase();
    getTopRatedMoviesUseCase = MockGetTopRatedMoviesUseCase();
  });

  test('initial state has three loading sections', () async {
    final bloc = buildBloc();

    expect(bloc.state, const MoviesState());

    await bloc.close();
  });

  blocTest<MoviesBloc, MoviesState>(
    'loads now-playing movies without changing the other sections',
    setUp: () {
      when(() => getNowPlayingMovieUseCase(any()))
          .thenAnswer((_) async => const Right([movie]));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const NowPlayingMoviesEvent()),
    expect: () => const [
      MoviesState(
        nowPlaying: MovieSectionState(
          movies: [movie],
          requestState: RequestState.loaded,
        ),
      ),
    ],
    verify: (_) {
      verify(() => getNowPlayingMovieUseCase(any())).called(1);
      verifyNever(() => getPopularMoviesUseCase(any()));
      verifyNever(() => getTopRatedMoviesUseCase(any()));
    },
  );

  blocTest<MoviesBloc, MoviesState>(
    'emits the now-playing error message when loading fails',
    setUp: () {
      when(() => getNowPlayingMovieUseCase(any())).thenAnswer(
        (_) async => const Left(ServerFailure('Now playing failed.')),
      );
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const NowPlayingMoviesEvent()),
    expect: () => const [
      MoviesState(
        nowPlaying: MovieSectionState(
          requestState: RequestState.error,
          message: 'Now playing failed.',
        ),
      ),
    ],
  );

  blocTest<MoviesBloc, MoviesState>(
    'loads popular movies without changing the other sections',
    setUp: () {
      when(() => getPopularMoviesUseCase(any()))
          .thenAnswer((_) async => const Right([movie]));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const PopularMoviesEvent()),
    expect: () => const [
      MoviesState(
        popular: MovieSectionState(
          movies: [movie],
          requestState: RequestState.loaded,
        ),
      ),
    ],
  );

  blocTest<MoviesBloc, MoviesState>(
    'emits the popular error message when loading fails',
    setUp: () {
      when(
        () => getPopularMoviesUseCase(any()),
      ).thenAnswer((_) async => const Left(ServerFailure('Popular failed.')));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const PopularMoviesEvent()),
    expect: () => const [
      MoviesState(
        popular: MovieSectionState(
          requestState: RequestState.error,
          message: 'Popular failed.',
        ),
      ),
    ],
  );

  blocTest<MoviesBloc, MoviesState>(
    'loads top-rated movies without changing the other sections',
    setUp: () {
      when(() => getTopRatedMoviesUseCase(any()))
          .thenAnswer((_) async => const Right([movie]));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const TopRatedMoviesEvent()),
    expect: () => const [
      MoviesState(
        topRated: MovieSectionState(
          movies: [movie],
          requestState: RequestState.loaded,
        ),
      ),
    ],
  );

  blocTest<MoviesBloc, MoviesState>(
    'emits the top-rated error message when loading fails',
    setUp: () {
      when(
        () => getTopRatedMoviesUseCase(any()),
      ).thenAnswer((_) async => const Left(ServerFailure('Top rated failed.')));
    },
    build: buildBloc,
    act: (bloc) => bloc.add(const TopRatedMoviesEvent()),
    expect: () => const [
      MoviesState(
        topRated: MovieSectionState(
          requestState: RequestState.error,
          message: 'Top rated failed.',
        ),
      ),
    ],
  );
}
