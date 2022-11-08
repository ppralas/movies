import 'package:dio/dio.dart';
import 'package:moviesss/network/api/endpoints.dart';
import 'package:moviesss/network/api/movie_model.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.recieveTimeout
      ..options.responseType = ResponseType.json
      ..options.queryParameters = {
        'api_key': '60bef4941fb1388049660e34731d867a'
      };
  }

  Future<MovieModel> getMovies() async {
    try {
      final movieModel = await _dio.get('/movie/popular');

      final movieResponse = MovieModel.fromJson(movieModel.data);
      return movieResponse;
    } catch (e) {
      rethrow;
    }
  }
}
