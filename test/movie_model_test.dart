import 'package:flutter_test/flutter_test.dart';
import 'package:movie_flutter/core/network/error_message_model.dart';
import 'package:movie_flutter/features/movies/data/models/movie_model.dart';

void main() {
  test('MovieModel safely parses numeric and nullable TMDB fields', () {
    final model = MovieModel.fromJson({
      'id': 42,
      'title': 'Example Movie',
      'backdrop_path': null,
      'vote_average': 8,
      'genre_ids': [12, 28],
    });

    final movie = model.toEntity();

    expect(movie.id, 42);
    expect(movie.backdropPath, isEmpty);
    expect(movie.voteAverage, 8.0);
    expect(movie.genreIds, [12, 28]);
    expect(movie, model.toEntity());
  });

  test('ErrorMessageModel parses TMDB snake-case error fields', () {
    final error = ErrorMessageModel.fromJson({
      'status_code': 7,
      'status_message': 'Invalid API key',
      'success': false,
    });

    expect(error.statusCode, 7);
    expect(error.statusMessage, 'Invalid API key');
    expect(error.success, isFalse);
  });
}
