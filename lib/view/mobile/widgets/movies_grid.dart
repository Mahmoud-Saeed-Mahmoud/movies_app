import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/providers/selected_movie_provider.dart';

import '../../../core/extensions/movie_widget_extension.dart';
import '../../../models/movies/movies.dart';
import '../pages/movie_page.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    super.key,
    required this.movies,
    required this.crossAxisCount,
    required this.scrollDirection,
  });

  final Movies movies;
  final int crossAxisCount;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        scrollDirection: scrollDirection,
        itemCount: movies.results.length,
        itemBuilder: (context, index) => Consumer(
          builder: (_, WidgetRef ref, __) => GestureDetector(
            onTap: () {
              ref.read(selectedMovieId.notifier).state =
                  movies.results[index].id;
              context.pushScreen(const MoviePage());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: movies.results[index].buildMovieGridTile(),
            ),
          ),
        ),
      );
}
