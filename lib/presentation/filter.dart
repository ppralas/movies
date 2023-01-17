import 'package:moviesss/data/models/movie_model.dart';

List<Result> filterMovies(List<Result> movies,
    {bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? language,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    String? titleLanguage,
    bool? video,
    double? voteAverage,
    int? voteCount}) {
  return movies
      .where((movie) => ((adult == null || movie.adult == adult) &&
          (backdropPath == null || movie.backdropPath == backdropPath) &&
          (genreIds == null || movie.genreIds!.contains(genreIds)) &&
          (id == null || movie.id == id) &&
          (language == null || movie.language == language) &&
          (overview == null || movie.overview == overview) &&
          (popularity == null || movie.popularity == popularity) &&
          (posterPath == null || movie.posterPath == posterPath) &&
          (releaseDate == null || movie.releaseDate == releaseDate) &&
          (title == null || movie.title == title) &&
          (titleLanguage == null || movie.titleLanguage == titleLanguage) &&
          (video == null || movie.video == video) &&
          (voteAverage == null || movie.voteAverage == voteAverage) &&
          (voteCount == null || movie.voteCount == voteCount)))
      .toList();
}
