import 'package:equatable/equatable.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => [];
}

class MovieDetailRequested extends MovieDetailEvent {
  final int movieId;

  const MovieDetailRequested(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class MovieFavoriteToggled extends MovieDetailEvent {
  const MovieFavoriteToggled();
}

class MovieFavoriteStatusChanged extends MovieDetailEvent {
  final bool isFavorite;

  const MovieFavoriteStatusChanged(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class MovieFavoriteStatusFailed extends MovieDetailEvent {
  final String message;

  const MovieFavoriteStatusFailed(this.message);

  @override
  List<Object?> get props => [message];
}
