import 'package:equatable/equatable.dart';

class FavoriteMovie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;

  const FavoriteMovie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [id, title, backdropPath, voteAverage, releaseDate];
}
