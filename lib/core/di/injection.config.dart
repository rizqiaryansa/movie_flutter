// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_flutter/core/di/injection.dart' as _i1004;
import 'package:movie_flutter/features/favorites/data/database/app_database.dart'
    as _i175;
import 'package:movie_flutter/features/favorites/data/datasource/favorite_local_data_source.dart'
    as _i369;
import 'package:movie_flutter/features/favorites/data/repository/favorite_repository_impl.dart'
    as _i911;
import 'package:movie_flutter/features/favorites/domain/repository/favorite_repository.dart'
    as _i677;
import 'package:movie_flutter/features/favorites/domain/usecases/add_favorite_usecase.dart'
    as _i236;
import 'package:movie_flutter/features/favorites/domain/usecases/remove_favorite_usecase.dart'
    as _i796;
import 'package:movie_flutter/features/favorites/domain/usecases/watch_favorite_status_usecase.dart'
    as _i105;
import 'package:movie_flutter/features/favorites/domain/usecases/watch_favorites_usecase.dart'
    as _i438;
import 'package:movie_flutter/features/favorites/presentation/controller/favorites_cubit.dart'
    as _i912;
import 'package:movie_flutter/features/movies/data/datasource/movie_remote_data_source.dart'
    as _i98;
import 'package:movie_flutter/features/movies/data/repository/movie_repository_impl.dart'
    as _i260;
import 'package:movie_flutter/features/movies/domain/repository/movie_repository.dart'
    as _i473;
import 'package:movie_flutter/features/movies/domain/usecases/get_movie_detail_usecase.dart'
    as _i43;
import 'package:movie_flutter/features/movies/domain/usecases/get_now_playing_movies_usecase.dart'
    as _i591;
import 'package:movie_flutter/features/movies/domain/usecases/get_popular_movies_usecase.dart'
    as _i379;
import 'package:movie_flutter/features/movies/domain/usecases/get_top_rated_movies_usecase.dart'
    as _i517;
import 'package:movie_flutter/features/movies/presentation/controller/moviedetail/movie_detail_bloc.dart'
    as _i655;
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_bloc.dart'
    as _i569;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final databaseModule = _$DatabaseModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i175.AppDatabase>(() => databaseModule.database);
    gh.lazySingleton<_i98.MovieRemoteDataSource>(
      () => _i98.MovieRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i369.FavoriteLocalDataSource>(
      () => _i369.FavoriteLocalDataSourceImpl(gh<_i175.AppDatabase>()),
    );
    gh.lazySingleton<_i677.FavoriteRepository>(
      () => _i911.FavoriteRepositoryImpl(gh<_i369.FavoriteLocalDataSource>()),
    );
    gh.lazySingleton<_i473.MovieRepository>(
      () => _i260.MovieRepositoryImpl(gh<_i98.MovieRemoteDataSource>()),
    );
    gh.lazySingleton<_i236.AddFavoriteUseCase>(
      () => _i236.AddFavoriteUseCase(gh<_i677.FavoriteRepository>()),
    );
    gh.lazySingleton<_i796.RemoveFavoriteUseCase>(
      () => _i796.RemoveFavoriteUseCase(gh<_i677.FavoriteRepository>()),
    );
    gh.lazySingleton<_i105.WatchFavoriteStatusUseCase>(
      () => _i105.WatchFavoriteStatusUseCase(gh<_i677.FavoriteRepository>()),
    );
    gh.lazySingleton<_i438.WatchFavoritesUseCase>(
      () => _i438.WatchFavoritesUseCase(gh<_i677.FavoriteRepository>()),
    );
    gh.lazySingleton<_i43.GetMovieDetailUseCase>(
      () => _i43.GetMovieDetailUseCase(gh<_i473.MovieRepository>()),
    );
    gh.lazySingleton<_i591.GetNowPlayingMovieUseCase>(
      () => _i591.GetNowPlayingMovieUseCase(gh<_i473.MovieRepository>()),
    );
    gh.lazySingleton<_i379.GetPopularMoviesUseCase>(
      () => _i379.GetPopularMoviesUseCase(gh<_i473.MovieRepository>()),
    );
    gh.lazySingleton<_i517.GetTopRatedMoviesUseCase>(
      () => _i517.GetTopRatedMoviesUseCase(gh<_i473.MovieRepository>()),
    );
    gh.factory<_i569.MoviesBloc>(
      () => _i569.MoviesBloc(
        gh<_i591.GetNowPlayingMovieUseCase>(),
        gh<_i379.GetPopularMoviesUseCase>(),
        gh<_i517.GetTopRatedMoviesUseCase>(),
      ),
    );
    gh.factory<_i655.MovieDetailBloc>(
      () => _i655.MovieDetailBloc(
        gh<_i43.GetMovieDetailUseCase>(),
        gh<_i105.WatchFavoriteStatusUseCase>(),
        gh<_i236.AddFavoriteUseCase>(),
        gh<_i796.RemoveFavoriteUseCase>(),
      ),
    );
    gh.factory<_i912.FavoritesCubit>(
      () => _i912.FavoritesCubit(
        gh<_i438.WatchFavoritesUseCase>(),
        gh<_i796.RemoveFavoriteUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i1004.NetworkModule {}

class _$DatabaseModule extends _i1004.DatabaseModule {}
