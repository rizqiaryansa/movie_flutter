import 'package:json_annotation/json_annotation.dart';
import 'package:movie_flutter/features/movies/data/models/genre_model.dart';
import 'package:movie_flutter/features/movies/domain/entities/genre.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie_detail.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel {
  final int id;

  final String title;

  final String overview;

  @JsonKey(name: 'backdrop_path', defaultValue: '')
  final String backdropPath;

  @JsonKey(name: 'release_date', defaultValue: '')
  final String releaseDate;

  @JsonKey(name: 'vote_average', defaultValue: 0.0)
  final double voteAverage;

  final int runtime;
  final List<GenreModel> genres;

  const MovieDetailModel({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  MovieDetail toEntity() {
    return MovieDetail(
      id: id,
      title: title,
      overview: overview,
      releaseDate: releaseDate,
      runtime: runtime,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      genres: List<Genre>.from(
        genres.map((x) => Genre(name: x.name, id: x.id)),
      ),
    );
  }
}
