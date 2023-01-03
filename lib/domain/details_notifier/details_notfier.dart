import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviesss/data/models/movie_details.dart';
import 'package:moviesss/data/repository/movie_repo.dart';
import 'package:moviesss/domain/details_notifier/details_state.dart';

final getMovieDetailsNotifier =
    StateNotifierProvider<MovieDetailsNotifier, MovieDetailsState>(
  (ref) => MovieDetailsNotifier(
    ref.read(getMovieDetailsNotifier),
  ),
);

class MovieDetailsNotifier extends StateNotifier<MovieDetailsState> {
  final MovieRepo _movieRepo;

  MovieDetailsNotifier(
    this._movieRepo,
  ) : super(const MovieDetailsState.initial());

  Future<void> getMovieDetails(String movieId) async {
    state = const MovieDetailsState.loading();
    final movie = await  .fetchMovieDetails(movieId);
    state = movie.fold(
      (l) => MovieDetailsState.error(l),
      (r) => MovieDetailsState.loaded(r),
    );
    print(movie);
  }
}

//how to get nofifier in flutter? 