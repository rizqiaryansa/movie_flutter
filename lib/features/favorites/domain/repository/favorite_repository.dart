import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/favorite_movie.dart';

abstract interface class FavoriteRepository {
  Stream<Either<Failure, List<FavoriteMovie>>> watchFavorites();

  Stream<Either<Failure, bool>> watchFavoriteStatus(int movieId);

  Future<Either<Failure, Unit>> addFavorite(FavoriteMovie movie);

  Future<Either<Failure, Unit>> removeFavorite(int movieId);
}
