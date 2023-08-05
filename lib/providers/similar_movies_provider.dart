import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/providers/selected_movie_provider.dart';

import '../datasources/remote/api.dart';
import '../models/movies/movies.dart';

final similarMoviesProvider = FutureProvider.autoDispose<Movies>((ref) async {
  final api = ref.watch(apiProvider);
  final id = ref.watch(selectedMovieId);
  final response = await api.getResponse(path: '/movie/$id/similar?page=1');
  return Movies.fromMap(response.data);
});
