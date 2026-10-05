// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteMoviesTable extends FavoriteMovies
    with TableInfo<$FavoriteMoviesTable, FavoriteMovieEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteMoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _voteAverageMeta = const VerificationMeta(
    'voteAverage',
  );
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
    'vote_average',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _releaseDateMeta = const VerificationMeta(
    'releaseDate',
  );
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
    'release_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    backdropPath,
    voteAverage,
    releaseDate,
    addedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_movies';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteMovieEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
        _voteAverageMeta,
        voteAverage.isAcceptableOrUnknown(
          data['vote_average']!,
          _voteAverageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
        _releaseDateMeta,
        releaseDate.isAcceptableOrUnknown(
          data['release_date']!,
          _releaseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteMovieEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteMovieEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      )!,
      voteAverage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vote_average'],
      )!,
      releaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}release_date'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoriteMoviesTable createAlias(String alias) {
    return $FavoriteMoviesTable(attachedDatabase, alias);
  }
}

class FavoriteMovieEntry extends DataClass
    implements Insertable<FavoriteMovieEntry> {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  final DateTime addedAt;
  const FavoriteMovieEntry({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['backdrop_path'] = Variable<String>(backdropPath);
    map['vote_average'] = Variable<double>(voteAverage);
    map['release_date'] = Variable<String>(releaseDate);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoriteMoviesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMoviesCompanion(
      id: Value(id),
      title: Value(title),
      backdropPath: Value(backdropPath),
      voteAverage: Value(voteAverage),
      releaseDate: Value(releaseDate),
      addedAt: Value(addedAt),
    );
  }

  factory FavoriteMovieEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteMovieEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      backdropPath: serializer.fromJson<String>(json['backdropPath']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      releaseDate: serializer.fromJson<String>(json['releaseDate']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'backdropPath': serializer.toJson<String>(backdropPath),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'releaseDate': serializer.toJson<String>(releaseDate),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  FavoriteMovieEntry copyWith({
    int? id,
    String? title,
    String? backdropPath,
    double? voteAverage,
    String? releaseDate,
    DateTime? addedAt,
  }) => FavoriteMovieEntry(
    id: id ?? this.id,
    title: title ?? this.title,
    backdropPath: backdropPath ?? this.backdropPath,
    voteAverage: voteAverage ?? this.voteAverage,
    releaseDate: releaseDate ?? this.releaseDate,
    addedAt: addedAt ?? this.addedAt,
  );
  FavoriteMovieEntry copyWithCompanion(FavoriteMoviesCompanion data) {
    return FavoriteMovieEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      voteAverage: data.voteAverage.present
          ? data.voteAverage.value
          : this.voteAverage,
      releaseDate: data.releaseDate.present
          ? data.releaseDate.value
          : this.releaseDate,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMovieEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, backdropPath, voteAverage, releaseDate, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMovieEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.backdropPath == this.backdropPath &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate &&
          other.addedAt == this.addedAt);
}

class FavoriteMoviesCompanion extends UpdateCompanion<FavoriteMovieEntry> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> backdropPath;
  final Value<double> voteAverage;
  final Value<String> releaseDate;
  final Value<DateTime> addedAt;
  const FavoriteMoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  FavoriteMoviesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String backdropPath,
    required double voteAverage,
    required String releaseDate,
    this.addedAt = const Value.absent(),
  }) : title = Value(title),
       backdropPath = Value(backdropPath),
       voteAverage = Value(voteAverage),
       releaseDate = Value(releaseDate);
  static Insertable<FavoriteMovieEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? backdropPath,
    Expression<double>? voteAverage,
    Expression<String>? releaseDate,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  FavoriteMoviesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? backdropPath,
    Value<double>? voteAverage,
    Value<String>? releaseDate,
    Value<DateTime>? addedAt,
  }) {
    return FavoriteMoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteMoviesTable favoriteMovies = $FavoriteMoviesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteMovies];
}

typedef $$FavoriteMoviesTableCreateCompanionBuilder =
    FavoriteMoviesCompanion Function({
      Value<int> id,
      required String title,
      required String backdropPath,
      required double voteAverage,
      required String releaseDate,
      Value<DateTime> addedAt,
    });
typedef $$FavoriteMoviesTableUpdateCompanionBuilder =
    FavoriteMoviesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> backdropPath,
      Value<double> voteAverage,
      Value<String> releaseDate,
      Value<DateTime> addedAt,
    });

class $$FavoriteMoviesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteMoviesTable> {
  $$FavoriteMoviesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteMoviesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteMoviesTable> {
  $$FavoriteMoviesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteMoviesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteMoviesTable> {
  $$FavoriteMoviesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoriteMoviesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteMoviesTable,
          FavoriteMovieEntry,
          $$FavoriteMoviesTableFilterComposer,
          $$FavoriteMoviesTableOrderingComposer,
          $$FavoriteMoviesTableAnnotationComposer,
          $$FavoriteMoviesTableCreateCompanionBuilder,
          $$FavoriteMoviesTableUpdateCompanionBuilder,
          (
            FavoriteMovieEntry,
            BaseReferences<
              _$AppDatabase,
              $FavoriteMoviesTable,
              FavoriteMovieEntry
            >,
          ),
          FavoriteMovieEntry,
          PrefetchHooks Function()
        > {
  $$FavoriteMoviesTableTableManager(
    _$AppDatabase db,
    $FavoriteMoviesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteMoviesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteMoviesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteMoviesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> backdropPath = const Value.absent(),
                Value<double> voteAverage = const Value.absent(),
                Value<String> releaseDate = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoriteMoviesCompanion(
                id: id,
                title: title,
                backdropPath: backdropPath,
                voteAverage: voteAverage,
                releaseDate: releaseDate,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String backdropPath,
                required double voteAverage,
                required String releaseDate,
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoriteMoviesCompanion.insert(
                id: id,
                title: title,
                backdropPath: backdropPath,
                voteAverage: voteAverage,
                releaseDate: releaseDate,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FavoriteMoviesTable, FavoriteMovieEntry>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $FavoriteMoviesTable,
                    FavoriteMovieEntry
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteMoviesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteMoviesTable,
      FavoriteMovieEntry,
      $$FavoriteMoviesTableFilterComposer,
      $$FavoriteMoviesTableOrderingComposer,
      $$FavoriteMoviesTableAnnotationComposer,
      $$FavoriteMoviesTableCreateCompanionBuilder,
      $$FavoriteMoviesTableUpdateCompanionBuilder,
      (
        FavoriteMovieEntry,
        BaseReferences<_$AppDatabase, $FavoriteMoviesTable, FavoriteMovieEntry>,
      ),
      FavoriteMovieEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteMoviesTableTableManager get favoriteMovies =>
      $$FavoriteMoviesTableTableManager(_db, _db.favoriteMovies);
}
