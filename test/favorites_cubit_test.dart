import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_flutter/core/error/failure.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/favorites/domain/entities/favorite_movie.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/watch_favorites_usecase.dart';
import 'package:movie_flutter/features/favorites/presentation/controller/favorites_cubit.dart';
import 'package:movie_flutter/features/favorites/presentation/controller/favorites_state.dart';

class MockWatchFavoritesUseCase extends Mock implements WatchFavoritesUseCase {}

class MockRemoveFavoriteUseCase extends Mock implements RemoveFavoriteUseCase {}

void main() {
  const favorite = FavoriteMovie(
    id: 7,
    title: 'Saved Movie',
    backdropPath: '/saved.jpg',
    voteAverage: 7.8,
    releaseDate: '2025-05-12',
  );

  late MockWatchFavoritesUseCase watchFavoritesUseCase;
  late MockRemoveFavoriteUseCase removeFavoriteUseCase;

  FavoritesCubit buildCubit() {
    return FavoritesCubit(watchFavoritesUseCase, removeFavoriteUseCase);
  }

  setUp(() {
    watchFavoritesUseCase = MockWatchFavoritesUseCase();
    removeFavoriteUseCase = MockRemoveFavoriteUseCase();
  });

  test('initial state is loading with an empty movie list', () async {
    final cubit = buildCubit();

    expect(cubit.state, const FavoritesState());

    await cubit.close();
  });

  blocTest<FavoritesCubit, FavoritesState>(
    'emits loaded favorites when the watched stream succeeds',
    setUp: () {
      when(() => watchFavoritesUseCase())
          .thenAnswer((_) => Stream.value(const Right([favorite])));
    },
    build: buildCubit,
    act: (cubit) => cubit.watchFavorites(),
    expect: () => const [
      FavoritesState(requestState: RequestState.loading),
      FavoritesState(movies: [favorite], requestState: RequestState.loaded),
    ],
    verify: (_) {
      verify(() => watchFavoritesUseCase()).called(1);
    },
  );

  blocTest<FavoritesCubit, FavoritesState>(
    'emits an error when the watched stream fails',
    setUp: () {
      when(() => watchFavoritesUseCase()).thenAnswer(
        (_) => Stream.value(
          const Left(DatabaseFailure('Unable to load favorites.')),
        ),
      );
    },
    build: buildCubit,
    act: (cubit) => cubit.watchFavorites(),
    expect: () => const [
      FavoritesState(requestState: RequestState.loading),
      FavoritesState(
        requestState: RequestState.error,
        message: 'Unable to load favorites.',
      ),
    ],
  );

  blocTest<FavoritesCubit, FavoritesState>(
    'delegates removal and waits for the Drift stream to update the list',
    setUp: () {
      when(() => removeFavoriteUseCase(favorite.id))
          .thenAnswer((_) async => const Right(unit));
    },
    build: buildCubit,
    seed: () => const FavoritesState(
      movies: [favorite],
      requestState: RequestState.loaded,
    ),
    act: (cubit) => cubit.removeFavorite(favorite.id),
    expect: () => const <FavoritesState>[],
    verify: (_) {
      verify(() => removeFavoriteUseCase(favorite.id)).called(1);
    },
  );

  blocTest<FavoritesCubit, FavoritesState>(
    'emits an error message when removal fails',
    setUp: () {
      when(() => removeFavoriteUseCase(favorite.id)).thenAnswer(
        (_) async => const Left(DatabaseFailure('Unable to remove favorite.')),
      );
    },
    build: buildCubit,
    seed: () => const FavoritesState(
      movies: [favorite],
      requestState: RequestState.loaded,
    ),
    act: (cubit) => cubit.removeFavorite(favorite.id),
    expect: () => const [
      FavoritesState(
        movies: [favorite],
        requestState: RequestState.loaded,
        message: 'Unable to remove favorite.',
      ),
    ],
  );
}
