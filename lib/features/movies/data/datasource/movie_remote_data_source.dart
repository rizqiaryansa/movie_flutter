import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/error/exceptions.dart';
import 'package:movie_flutter/core/network/api_constants.dart';
import 'package:movie_flutter/core/network/error_message_model.dart';
import 'package:movie_flutter/core/utils/ext_func.dart';
import 'package:movie_flutter/features/movies/data/models/movie_detail_model.dart';
import 'package:movie_flutter/features/movies/data/models/movie_model.dart';

abstract interface class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailModel> getMovieDetail(int movieId);
}

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await _get(ApiConstants.movieDetailPath(movieId));
    return response.parseObject<MovieDetailModel>(
      fromJson: MovieDetailModel.fromJson,
    );
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await _get(ApiConstants.nowPlayingMoviesPath);
    return response.parseList<MovieModel>(fromJson: MovieModel.fromJson);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _get(ApiConstants.popularMoviesPath);
    return response.parseList<MovieModel>(fromJson: MovieModel.fromJson);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await _get(ApiConstants.topRatedMoviesPath);
    return response.parseList<MovieModel>(fromJson: MovieModel.fromJson);
  }

  Future<Response<dynamic>> _get(String path) async {
    try {
      return await dio.get(path);
    } on DioException catch (error) {
      final responseData = error.response?.data;
      final errorModel = responseData is Map<String, dynamic>
          ? ErrorMessageModel.fromJson(responseData)
          : ErrorMessageModel(
              statusCode: error.response?.statusCode ?? 0,
              statusMessage:
                  error.message ?? 'Unable to connect. Please try again.',
              success: false,
            );

      throw ServerException(errorMessageModel: errorModel);
    }
  }
}
