import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/favorite_movie.dart';
import '../../domain/usecases/remove_favorite_usecase.dart';
import '../../domain/usecases/watch_favorites_usecase.dart';
import 'favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final WatchFavoritesUseCase watchFavoritesUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  StreamSubscription<Either<Failure, List<FavoriteMovie>>>? _subscription;

  FavoritesCubit(this.watchFavoritesUseCase, this.removeFavoriteUseCase)
    : super(const FavoritesState());

  Future<void> watchFavorites() async {
    await _subscription?.cancel();

    emit(state.copyWith(requestState: RequestState.loading, message: ''));

    _subscription = watchFavoritesUseCase().listen((result) {
      if (isClosed) return;

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              requestState: RequestState.error,
              message: failure.message,
            ),
          );
        },
        (movies) {
          emit(
            state.copyWith(
              movies: movies,
              requestState: RequestState.loaded,
              message: '',
            ),
          );
        },
      );
    });
  }

  Future<void> removeFavorite(int movieId) async {
    emit(state.copyWith(message: ''));

    final result = await removeFavoriteUseCase(movieId);

    if (isClosed) return;

    result.fold(
      (failure) {
        emit(state.copyWith(message: failure.message));
      },
      (_) {
        // Drift's watched query will emit the updated list.
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
