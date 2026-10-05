import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/error/failure.dart';
import 'package:movie_flutter/core/usecase/base_usecase.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie_detail.dart';

import '../repository/movie_repository.dart';

@lazySingleton
class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, int> {
  final MovieRepository repository;

  GetMovieDetailUseCase(this.repository);

  @override
  Future<Either<Failure, MovieDetail>> call(int movieId) async {
    return await repository.getMovieDetail(movieId);
  }
}
