import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/favorite_movie.dart';
import '../repository/favorite_repository.dart';

@lazySingleton
class WatchFavoritesUseCase {
  final FavoriteRepository repository;

  const WatchFavoritesUseCase(this.repository);

  Stream<Either<Failure, List<FavoriteMovie>>> call() {
    return repository.watchFavorites();
  }
}
