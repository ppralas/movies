//Movie Model klasa prima podatke od Dio paketa i prosljeduje ih na mobie repo
class MovieModel {
  final int page;
  final int totalResoults;
  final int totalPages;
  final List<Results> resoults;

  MovieModel(
    this.page,
    this.totalResoults,
    this.totalPages,
    this.resoults,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        json['page'],
        json['totalResoults'],
        json['totalPages'],
        (json['results'] as List<dynamic>)
            .map((e) => Results.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

//Lista rezultata koje dobivamo sa servera, to su postedPath, id, title i backdropPath u ovom slucaju
class Results {
  final String posterPath;
  final int id;
  final String title;
  final String backdropPath;

  Results(this.posterPath, this.id, this.title, this.backdropPath);

  factory Results.fromJson(Map<String, dynamic> nestedJson) => Results(
      nestedJson['posterPath'],
      nestedJson['id'],
      nestedJson['title'],
      nestedJson['backdropPath']);
}
