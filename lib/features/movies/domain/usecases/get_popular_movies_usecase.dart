import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/error/failure.dart';
import 'package:movie_flutter/core/usecase/base_usecase.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie.dart';
import 'package:movie_flutter/features/movies/domain/repository/movie_repository.dart';

@lazySingleton
class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final MovieRepository repository;

  GetPopularMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters p) async {
    return await repository.getPopularMovies();
  }
}
