// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesss/data/models/movie_model.dart';
import 'package:moviesss/domain/notifier/movie_notifier.dart';

class MovieList extends ConsumerWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieState = ref.watch(getMovieNotifier);
    return Scaffold(
      appBar: AppBar(),
      body: movieState.maybeWhen(
        error: (errorMessage) =>
            Center(child: Text('Haha Eerror $errorMessage')),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (movieModel) => ListOfMovies(
          model: movieModel,
        ),
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ListOfMovies extends ConsumerWidget {
  final MovieModel model;
  const ListOfMovies({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: model.result!.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: const Icon(Icons.list),
            trailing: Text(
              model.result![index].popularity.toString(),
              style: const TextStyle(color: Colors.green, fontSize: 15),
            ),
            title: Text("List item $index"));
      },
    );
  }
}
