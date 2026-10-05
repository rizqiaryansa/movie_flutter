import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entities/favorite_movie.dart';
import '../repository/favorite_repository.dart';

@lazySingleton
class AddFavoriteUseCase extends BaseUseCase<Unit, FavoriteMovie> {
  final FavoriteRepository repository;

  AddFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(FavoriteMovie movie) {
    return repository.addFavorite(movie);
  }
}
