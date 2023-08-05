import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movie_type_enum.dart';
import 'package:movies_app/providers/selected_movie_type_provider.dart';

import '../datasources/remote/api.dart';
import '../models/movies/movies.dart';
import 'pages_provider.dart';

final nowPlayingMoviesProvider =
    FutureProvider.autoDispose<Movies>((ref) async {
  ref.keepAlive();

  final pageNumber = ref.watch(pageNumberProvider);
  final api = ref.watch(apiProvider);
  final response = await api.getResponse(
    path: '/movie/now_playing',
    query: {
      'page': pageNumber,
    },
  );
  Movies movies = Movies.fromMap(response.data);
  ref.watch(selectedMovieEnumProvider) == MovieTypeEnum.nowPlaying
      ? ref.read(totalPagesProvider.notifier).state = movies.totalPages
      : null;
  return movies;
});
