import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesss/data/models/movie_model.dart';
import 'package:moviesss/domain/details_notifier/details_notfier.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(getMovieDetailsNotifier);

    return Scaffold(
      body: detailsState.maybeWhen(
        orElse: () => const CircularProgressIndicator(),
        error: (value) => const ErrorScreen(),
        loaded: (value) => const MovieDetailsScreen(),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error message!'),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nekiteksts'),
      ),
    );
  }
}


 