import 'package:dio/dio.dart';
import 'package:moviesss/data/network/api/dio_client.dart';
import 'package:moviesss/data/network/exceptions.dart';
import 'package:moviesss/network/api/movie_model.dart';
import 'package:riverpod/riverpod.dart';

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
}
