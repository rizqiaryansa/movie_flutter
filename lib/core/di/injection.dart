import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter/core/network/api_constants.dart';
import 'package:movie_flutter/features/favorites/data/database/app_database.dart';

import '../config/env.dart';
import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  sl.init();
}

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {'api_key': Env.apiKey},
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
}

@module
abstract class DatabaseModule {
  @lazySingleton
  AppDatabase get database => AppDatabase();
}
