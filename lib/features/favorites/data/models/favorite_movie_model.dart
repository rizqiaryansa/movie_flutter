import 'package:drift/drift.dart';

import '../../domain/entities/favorite_movie.dart';
import '../database/app_database.dart';

class FavoriteMovieModel extends FavoriteMovie {
  const FavoriteMovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory FavoriteMovieModel.fromDatabase(FavoriteMovieEntry movie) {
    return FavoriteMovieModel(
      id: movie.id,
      title: movie.title,
      backdropPath: movie.backdropPath,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
    );
  }

  factory FavoriteMovieModel.fromEntity(FavoriteMovie movie) {
    return FavoriteMovieModel(
      id: movie.id,
      title: movie.title,
      backdropPath: movie.backdropPath,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
    );
  }

  FavoriteMoviesCompanion toCompanion() {
    return FavoriteMoviesCompanion(
      id: Value(id),
      title: Value(title),
      backdropPath: Value(backdropPath),
      voteAverage: Value(voteAverage),
      releaseDate: Value(releaseDate),
      addedAt: Value(DateTime.now()),
    );
  }
}
