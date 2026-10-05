import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../repository/favorite_repository.dart';

@lazySingleton
class RemoveFavoriteUseCase extends BaseUseCase<Unit, int> {
  final FavoriteRepository repository;

  RemoveFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(int movieId) {
    return repository.removeFavorite(movieId);
  }
}
