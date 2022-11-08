import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviesss/network/api/movie_model.dart';

part 'movie_state.freezed.dart';

//freezed za movie state, 4 stanja koja se mogu desiti

@freezed
class MovieState with _$MovieState {
  const factory MovieState.inital() = _MovieStateInitial;
  const factory MovieState.loading() = _MovieStateLoading;
  const factory MovieState.error(String errorMessage) = _MovieStateError;
  const factory MovieState.loaded(MovieModel movieModel) = _MovieStateLoaded;
}
