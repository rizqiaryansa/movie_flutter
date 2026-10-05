import 'package:dartz/dartz.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_detail.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  // Future<Either<Failure, List<Movie>>> getUpcomingMovies();

  // Future<Either<Failure, List<Movie>>> searchMovies(String query);

  Future<Either<Failure, MovieDetail>> getMovieDetail(int id);
}
