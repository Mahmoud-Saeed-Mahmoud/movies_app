import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/movies/movies.dart';
import 'movies_grid.dart';

class MovieType extends StatelessWidget {
  const MovieType({
    super.key,
    required this.movie,
  });

  final AutoDisposeFutureProvider<Movies> movie;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) => ref.watch(movie).when(
            data: (data) => MoviesGrid(
              movies: data,
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (_, __) => const Text('Error somthing went wrong'),
          ),
    );
  }
}
