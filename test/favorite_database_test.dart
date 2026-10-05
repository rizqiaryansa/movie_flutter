import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_flutter/features/favorites/data/database/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('stores, watches, and removes a favorite movie', () async {
    await database.saveFavorite(
      FavoriteMoviesCompanion(
        id: const Value(42),
        title: const Value('A Favorite Movie'),
        backdropPath: const Value('/backdrop.jpg'),
        voteAverage: const Value(8.4),
        releaseDate: const Value('2026-01-20'),
        addedAt: Value(DateTime(2026)),
      ),
    );

    final favorites = await database.watchFavorites().first;
    expect(favorites, hasLength(1));
    expect(favorites.single.id, 42);
    expect(await database.watchFavoriteStatus(42).first, isTrue);

    await database.deleteFavorite(42);

    expect(await database.watchFavoriteStatus(42).first, isFalse);
  });
}
