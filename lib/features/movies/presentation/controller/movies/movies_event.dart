import 'package:equatable/equatable.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

final class NowPlayingMoviesEvent extends MoviesEvent {
  const NowPlayingMoviesEvent();
}

final class PopularMoviesEvent extends MoviesEvent {
  const PopularMoviesEvent();
}

final class TopRatedMoviesEvent extends MoviesEvent {
  const TopRatedMoviesEvent();
}
