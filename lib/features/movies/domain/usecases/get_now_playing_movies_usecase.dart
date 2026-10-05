import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/usecase/base_usecase.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie.dart';
import 'package:movie_flutter/features/movies/domain/repository/movie_repository.dart';

import '../../../../core/error/failure.dart';

@lazySingleton
class GetNowPlayingMovieUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final MovieRepository repository;

  GetNowPlayingMovieUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameter) async {
    return await repository.getNowPlayingMovies();
  }
}
