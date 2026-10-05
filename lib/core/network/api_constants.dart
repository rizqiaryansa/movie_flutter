class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static final String nowPlayingMoviesPath = "movie/now_playing";
  static final String popularMoviesPath = "movie/popular";
  static final String topRatedMoviesPath = "movie/top_rated";

  static String movieDetailPath(int movieId) => "movie/$movieId";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
