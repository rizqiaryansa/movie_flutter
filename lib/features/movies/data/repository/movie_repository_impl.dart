import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/error/exceptions.dart';
import 'package:movie_flutter/core/error/failure.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_flutter/features/movies/domain/repository/movie_repository.dart';

import '../datasource/movie_remote_data_source.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id) async {
    try {
      final result = await movieRemoteDataSource.getMovieDetail(id);
      return Right(result.toEntity());
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on Exception {
      return const Left(ServerFailure('Unable to load the movie details.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final results = await movieRemoteDataSource.getNowPlayingMovies();
      final movies = results.map((item) => item.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on Exception {
      return const Left(ServerFailure('Unable to load now-playing movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final results = await movieRemoteDataSource.getPopularMovies();
      final movies = results.map((item) => item.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on Exception {
      return const Left(ServerFailure('Unable to load popular movies.'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final results = await movieRemoteDataSource.getTopRatedMovies();
      final movies = results.map((item) => item.toEntity()).toList();
      return Right(movies);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on Exception {
      return const Left(ServerFailure('Unable to load top-rated movies.'));
    }
  }
}
