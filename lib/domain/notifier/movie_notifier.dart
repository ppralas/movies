// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:moviesss/data/repository/movie_repository.dart';
import 'package:moviesss/domain/notifier/movie_state.dart';
import 'package:riverpod/riverpod.dart';

final getMovieNotifier = StateNotifierProvider<MovieNotifier, MovieState>(
    (ref) => MovieNotifier(ref.read(movieRepoPorivider)));

//MovieNotifier jer poveznica izmedu repozitorija i korisnickog sucelja, u ovom slucaju se koristi notifier, na istom ovom mjestu po potrebi moze biti provider
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
