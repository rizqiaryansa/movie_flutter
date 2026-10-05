import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DataClassName('FavoriteMovieEntry')
class FavoriteMovies extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text()();

  TextColumn get backdropPath => text()();

  RealColumn get voteAverage => real()();

  TextColumn get releaseDate => text()();

  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [FavoriteMovies])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'movie_flutter'));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  Stream<List<FavoriteMovieEntry>> watchFavorites() {
    final query = select(favoriteMovies)
      ..orderBy([(movie) => OrderingTerm.desc(movie.addedAt)]);
    return query.watch();
  }

  Stream<bool> watchFavoriteStatus(int movieId) {
    final query = select(favoriteMovies)
      ..where((movie) => movie.id.equals(movieId));
    return query.watchSingleOrNull().map((movie) => movie != null);
  }

  Future<void> saveFavorite(FavoriteMoviesCompanion movie) async {
    await into(favoriteMovies).insertOnConflictUpdate(movie);
  }

  Future<void> deleteFavorite(int movieId) async {
    await (delete(
      favoriteMovies,
    )..where((movie) => movie.id.equals(movieId))).go();
  }
}
