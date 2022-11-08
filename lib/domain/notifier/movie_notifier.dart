// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:moviesss/network/api/movie_model.dart';
import 'package:riverpod/riverpod.dart';

import 'package:moviesss/data/repository/movie_repo.dart';
import 'package:moviesss/domain/notifier/movie_state.dart';

final getMovieNotifier = StateNotifierProvider<MovieNotifier, MovieState>(
    (ref) => MovieNotifier(ref.read(movieRepoPorivider)));

class MovieNotifier extends StateNotifier<MovieState> {
  final MovieRepo movieRepo;
  MovieNotifier(
    this.movieRepo,
  ) : super(const MovieState.inital());

  Future<void> getMovieList() async {
    state = const MovieState.loading();

    final movieResponse = await movieRepo.getMoviesRequested();

    state = MovieState.loaded(movieResponse);
  }
}
