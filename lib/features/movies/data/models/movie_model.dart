import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int id;
  final String title;

  @JsonKey(name: 'backdrop_path', defaultValue: '')
  final String backdropPath;

  @JsonKey(name: 'vote_average', defaultValue: 0.0)
  final double voteAverage;

  @JsonKey(name: 'genre_ids', defaultValue: <int>[])
  final List<int> genreIds;

  const MovieModel({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      genreIds: genreIds,
    );
  }
}
