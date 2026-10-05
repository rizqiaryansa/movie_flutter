import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String backdropPath;
  final double voteAverage;
  final List<Genre> genres;

  const MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.backdropPath,
    required this.genres,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
    id,
    title,
    overview,
    releaseDate,
    runtime,
    backdropPath,
    genres,
    voteAverage,
  ];
}
