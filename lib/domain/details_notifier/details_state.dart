import 'package:flutter/src/widgets/basic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moviesss/data/models/movie_details.dart';

part 'details_state.freezed.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _MovieDetailsStateInitial;
  const factory MovieDetailsState.loading() = _MovieDetailsStateLoading;
  const factory MovieDetailsState.loaded(
    MovieDetails movieDetails,
  ) = _MovieDetailsStateLoaded;
  const factory MovieDetailsState.error(String error) = _MovieDetailsStateError;
}
