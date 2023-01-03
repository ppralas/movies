import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesss/domain/notifier/movie_notifier.dart';

import 'movie_list.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FirstRoute());
  }
}

class FirstRoute extends ConsumerWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            ref.read(getMovieNotifier.notifier).getMovieList();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MovieList()),
            );
          },
        ),
      ),
    );
  }
}
