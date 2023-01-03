// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import 'package:moviesss/data/models/movie_details.dart';
import 'package:moviesss/data/models/movie_model.dart';
import 'package:moviesss/data/network/api/dio_client.dart';
import 'package:moviesss/data/network/exceptions.dart';

final movieRepoPorivider =
    Provider<MovieRepo>((ref) => MovieRepo(ref.read(getDioClientProvider)));

class MovieRepo {
  final DioClient movieApi;

  MovieRepo(this.movieApi);

  Future<MovieModel> getMoviesRequested() async {
    try {
      final response = await movieApi.getMovies();

      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Either<Faliure, MovieDetails>> getMovieDetails(String movieId) async {
    try {
      final details = await movieApi.getMovieDetails(movieId);
      return right(details);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(
        Faliure(message: errorMessage),
      );
    }
  }
}

class Faliure {
  String message;
  Faliure({
    required this.message,
  });
}
