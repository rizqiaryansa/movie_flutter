import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_flutter/core/di/injection.dart';
import 'package:movie_flutter/features/favorites/data/database/app_database.dart';
import 'package:movie_flutter/features/favorites/data/datasource/favorite_local_data_source.dart';
import 'package:movie_flutter/features/favorites/data/repository/favorite_repository_impl.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:movie_flutter/features/favorites/domain/usecases/watch_favorites_usecase.dart';
import 'package:movie_flutter/features/favorites/presentation/controller/favorites_cubit.dart';
import 'package:movie_flutter/features/favorites/presentation/screens/favorites_screen.dart';

void main() {
  late AppDatabase database;

  setUp(() async {
    await sl.reset();
    database = AppDatabase.forTesting(NativeDatabase.memory());
    final dataSource = FavoriteLocalDataSourceImpl(database);
    final repository = FavoriteRepositoryImpl(dataSource);

    sl.registerFactory(
      () => FavoritesCubit(
        WatchFavoritesUseCase(repository),
        RemoveFavoriteUseCase(repository),
      ),
    );
  });

  tearDown(() async {
    await database.close();
    await sl.reset();
  });

  testWidgets('Favorites screen shows its empty state', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: FavoritesScreen())),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.text('No favorite movies yet'), findsOneWidget);
    expect(
      find.text('Open a movie and tap the heart to save it here.'),
      findsOneWidget,
    );
  });

  testWidgets('saved movie appears and can be removed', (tester) async {
    await database.saveFavorite(
      FavoriteMoviesCompanion(
        id: const Value(7),
        title: const Value('Saved Movie'),
        backdropPath: const Value(''),
        voteAverage: const Value(7.8),
        releaseDate: const Value('2025-05-12'),
        addedAt: Value(DateTime(2026)),
      ),
    );

    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: FavoritesScreen())),
    );
    await tester.pumpAndSettle();

    expect(find.text('Saved Movie'), findsOneWidget);
    expect(find.text('7.8'), findsOneWidget);
    expect(find.text('2025'), findsOneWidget);

    await tester.tap(find.byTooltip('Remove from favorites'));
    await tester.pumpAndSettle();

    expect(find.text('Saved Movie'), findsNothing);
    expect(find.text('No favorite movies yet'), findsOneWidget);
  });
}
