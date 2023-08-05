import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/remote/api.dart';
import '../models/movies/movies.dart';
import 'pages_provider.dart';

final trendingMoviesProvider = FutureProvider.autoDispose<Movies>((ref) async {
  ref.keepAlive();

  final pageNumber = ref.watch(pageNumberProvider);
  final api = ref.watch(apiProvider);
  final response = await api.getResponse(
    path: '/trending/movie/day',
    query: {
      'page': pageNumber,
    },
  );
  Movies movies = Movies.fromMap(response.data);

  return movies;
});
