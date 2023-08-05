import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/remote/api.dart';
import '../models/movie_type_enum.dart';
import '../models/movies/movies.dart';
import 'pages_provider.dart';
import 'selected_movie_type_provider.dart';

final popularMoviesProvider = FutureProvider.autoDispose<Movies>((ref) async {
  ref.keepAlive();

  final pageNumber = ref.watch(pageNumberProvider);
  final api = ref.watch(apiProvider);
  final response = await api.getResponse(
    path: '/movie/popular',
    query: {
      'page': pageNumber,
    },
  );
  Movies movies = Movies.fromMap(response.data);

  ref.watch(selectedMovieEnumProvider) == MovieTypeEnum.popular
      ? ref.read(totalPagesProvider.notifier).state = movies.totalPages
      : null;
  return movies;
});
