// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    MovieDetailModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
      runtime: (json['runtime'] as num?)?.toInt() ?? 0,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
