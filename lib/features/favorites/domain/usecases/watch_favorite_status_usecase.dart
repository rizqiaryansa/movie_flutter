import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../repository/favorite_repository.dart';

@lazySingleton
class WatchFavoriteStatusUseCase {
  final FavoriteRepository repository;

  const WatchFavoriteStatusUseCase(this.repository);

  Stream<Either<Failure, bool>> call(int movieId) {
    return repository.watchFavoriteStatus(movieId);
  }
}
