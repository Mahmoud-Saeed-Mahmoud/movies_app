import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/remote/api.dart';
import '../models/movie_type_enum.dart';
import '../models/movies/movies.dart';
import 'pages_provider.dart';
import 'selected_movie_type_provider.dart';

final topRatedMoviesProvider = FutureProvider.autoDispose<Movies>((ref) async {
  ref.keepAlive();
  final pageNumber = ref.watch(pageNumberProvider);
  final api = ref.watch(apiProvider);
  final response = await api.getResponse(
    path: '/movie/top_rated',
    query: {
      'page': pageNumber,
    },
  );
  Movies movies = Movies.fromMap(response.data);

  ref.watch(selectedMovieEnumProvider) == MovieTypeEnum.topRated
      ? ref.read(totalPagesProvider.notifier).state = movies.totalPages
      : null;
  return movies;
});
