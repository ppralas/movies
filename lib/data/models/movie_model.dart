// ignore_for_file: public_member_api_docs, sort_constructors_first

//Model responsea koji ocekujemo da cemo dobiti od JSON filea
class MovieModel {
  final int? page;
  final List<Result>? result;
  final int? totalPages;
  final int? totalResults;

  MovieModel({
    this.page,
    this.result,
    this.totalPages,
    this.totalResults,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json['page'],
        result: (json['results'] as List<dynamic>)
            .map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
}

class Result {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? language;
  final String? titleLanguage;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.language,
    this.titleLanguage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: (json['genre_ids'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList(),
        id: json['id'],
        language: json['original_language'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        titleLanguage: json['original_title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );
}
