import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/favorite_movie.dart';
import '../../domain/repository/favorite_repository.dart';
import '../datasource/favorite_local_data_source.dart';
import '../models/favorite_movie_model.dart';

@LazySingleton(as: FavoriteRepository)
class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  const FavoriteRepositoryImpl(this.localDataSource);

  @override
  Stream<Either<Failure, List<FavoriteMovie>>> watchFavorites() async* {
    try {
      await for (final movies in localDataSource.watchFavorites()) {
        yield Right(movies);
      }
    } on Exception {
      yield const Left(DatabaseFailure('Unable to load favorite movies.'));
    }
  }

  @override
  Stream<Either<Failure, bool>> watchFavoriteStatus(int movieId) async* {
    try {
      await for (final isFavorite in localDataSource.watchFavoriteStatus(
        movieId,
      )) {
        yield Right(isFavorite);
      }
    } on Exception {
      yield const Left(DatabaseFailure('Unable to read favorite status.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addFavorite(FavoriteMovie movie) async {
    try {
      await localDataSource.addFavorite(FavoriteMovieModel.fromEntity(movie));
      return const Right(unit);
    } on Exception {
      return const Left(DatabaseFailure('Unable to add this favorite.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(int movieId) async {
    try {
      await localDataSource.removeFavorite(movieId);
      return const Right(unit);
    } on Exception {
      return const Left(DatabaseFailure('Unable to remove this favorite.'));
    }
  }
}
