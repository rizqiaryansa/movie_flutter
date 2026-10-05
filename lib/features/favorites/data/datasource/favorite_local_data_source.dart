import 'package:injectable/injectable.dart';

import '../database/app_database.dart';
import '../models/favorite_movie_model.dart';

abstract class FavoriteLocalDataSource {
  Stream<List<FavoriteMovieModel>> watchFavorites();

  Stream<bool> watchFavoriteStatus(int movieId);

  Future<void> addFavorite(FavoriteMovieModel movie);

  Future<void> removeFavorite(int movieId);
}

@LazySingleton(as: FavoriteLocalDataSource)
class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final AppDatabase database;

  const FavoriteLocalDataSourceImpl(this.database);

  @override
  Stream<List<FavoriteMovieModel>> watchFavorites() {
    return database.watchFavorites().map(
      (movies) => movies.map(FavoriteMovieModel.fromDatabase).toList(),
    );
  }

  @override
  Stream<bool> watchFavoriteStatus(int movieId) {
    return database.watchFavoriteStatus(movieId);
  }

  @override
  Future<void> addFavorite(FavoriteMovieModel movie) {
    return database.saveFavorite(movie.toCompanion());
  }

  @override
  Future<void> removeFavorite(int movieId) {
    return database.deleteFavorite(movieId);
  }
}
