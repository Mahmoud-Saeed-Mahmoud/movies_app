import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/movie_type_enum.dart';
import '../models/movies/movies.dart';
import 'now_playing_provider.dart';
import 'popular_provider.dart';
import 'top_rated_provider.dart';
import 'upcoming_provider.dart';

final moviesTypeProvider = FutureProvider.autoDispose<Movies>((ref) async {
  final selectedMovieEnum = ref.watch(selectedMovieEnumProvider);

  switch (selectedMovieEnum) {
    case MovieTypeEnum.nowPlaying:
      return ref.watch(nowPlayingMoviesProvider.future);
    case MovieTypeEnum.popular:
      return ref.watch(popularMoviesProvider.future);
    case MovieTypeEnum.topRated:
      return ref.watch(topRatedMoviesProvider.future);
    case MovieTypeEnum.upcoming:
      return ref.watch(upcomingMoviesProvider.future);
    default:
      throw ArgumentError('Invalid selectedMovieEnum value');
  }
});

final selectedMovieEnumProvider = StateProvider<MovieTypeEnum>((ref) {
  return MovieTypeEnum.popular;
});
