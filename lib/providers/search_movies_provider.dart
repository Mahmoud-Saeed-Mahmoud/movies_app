import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movies/movies.dart';

import '../datasources/remote/api.dart';

final searchMoviesProvider =
    FutureProvider.autoDispose.family<Movies, String>((ref, query) async {
  final api = ref.watch(apiProvider);
  final response = await api.getResponse(path: '/search/movie?query=$query');
  return Movies.fromMap(response.data);
});
