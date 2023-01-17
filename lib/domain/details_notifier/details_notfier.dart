import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesss/data/repository/movie_repository.dart';
import 'package:moviesss/domain/details_notifier/details_state.dart';

final getMovieDetailsNotifier =
    StateNotifierProvider<MovieDetailsNotifier, MovieDetailsState>(
  (ref) => MovieDetailsNotifier(
    //NE KORISTITI READ UNUTAR PROVIDERA!!!
    ref.watch(movieRepoPorivider),
  ),
);

class MovieDetailsNotifier extends StateNotifier<MovieDetailsState> {
  final MovieRepo _movieRepo;

  MovieDetailsNotifier(
    this._movieRepo,
  ) : super(const MovieDetailsState.initial());

  Future<void> getMovieDetails(String movieId) async {
    state = const MovieDetailsState.loading();
    final movie = await _movieRepo.getMovieDetails(movieId);
    state = movie.fold(
      (l) => MovieDetailsState.error(l.message),
      (r) => MovieDetailsState.loaded(r),
    );
    print(movie);
  }
}

//how to get nofifier in flutter? 