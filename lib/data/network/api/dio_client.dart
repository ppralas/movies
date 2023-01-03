import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesss/data/models/movie_details.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../models/movie_model.dart';
import 'endpoints.dart';

final getDioClientProvider = Provider<DioClient>(
  (ref) => DioClient(),
);

//Dio klijen je dio zaduzen za komunikaciju sa serverom i predaje podatke na client (Servis)
class DioClient {
  late final Dio _dio;

  // DioClient() {
  //   _dio
  //     ..options.baseUrl = Endpoints.baseUrl
  //     ..options.connectTimeout = Endpoints.connectionTimeout
  //     ..options.receiveTimeout = Endpoints.recieveTimeout
  //     ..options.responseType = ResponseType.json
  //     ..options.queryParameters = {
  //       'api_key': '60bef4941fb1388049660e34731d867a'
  //     };
  // }

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        queryParameters: {
          'api_key': '60bef4941fb1388049660e34731d867a',
        },
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
  }

//   Future<MovieModel> getMovies() async {
//     final response = await _dio.get('/movie/popular');

//     try {
//       final movieResponse = MovieModel.fromJson(response.data);
//       return movieResponse;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

  Future<MovieModel> getMovies() async {
    final response = await _dio.get('/movie/popular');
    final value = MovieModel.fromJson(response.data);
    return value;
  }

  Future<MovieDetails> getMovieDetails(String movieId) async {
    final detailsResponse = await _dio.get('/movie/$movieId');
    final details = MovieDetails.fromJson(detailsResponse.data);
    return details;
  }
}
