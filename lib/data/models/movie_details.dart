class MovieDetails {
  final String? backdropPath;
  final String? overview;
  final String? title;

  MovieDetails({
    this.backdropPath,
    this.overview,
    this.title,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      title: json['title']);
}
