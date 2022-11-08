import 'package:dio/dio.dart';
import 'package:moviesss/network/api/endpoints.dart';
import 'package:moviesss/network/api/movie_model.dart';
import 'package:riverpod/riverpod.dart';

final getDioClientProvider = Provider<DioClient>((ref) => DioClient());

class DioClient {
  late final Dio _dio;

  DioClient() {
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
    final response = await _dio.get('/movie/popular');

    try {
      final movieResponse = MovieModel.fromJson(response.data);
      return movieResponse;
    } catch (e) {
      rethrow;
    }
  }
}
