import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

import '../../../core/extensions/movie_widget_extension.dart';
import '../../../providers/search_movies_provider.dart';
import '../../../providers/selected_movie_provider.dart';
import '../pages/movie_page.dart';

class MoviesSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) =>
          ref.watch(searchMoviesProvider(query)).when(
                data: (movies) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: movies.results.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        ref.read(selectedMovieId.notifier).state =
                            movies.results[index].id;
                        context.pushScreen(const MoviePage());
                      },
                      child: movies.results[index].buildMovieGridTile()),
                ),
                error: (_, __) => const Text('Error somthing went wrong'),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) =>
          ref.watch(searchMoviesProvider(query)).when(
                data: (movies) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: movies.results.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        ref.read(selectedMovieId.notifier).state =
                            movies.results[index].id;
                        context.pushScreen(const MoviePage());
                      },
                      child: movies.results[index].buildMovieGridTile()),
                ),
                error: (_, __) => const Text('Error somthing went wrong'),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
    );
  }
}
