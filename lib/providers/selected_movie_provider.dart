import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movies/movie.dart';

import '../datasources/remote/api.dart';

final selectedMovieId = StateProvider((ref) => 0);

final selectedMovieProvider = FutureProvider.autoDispose<Movie>((ref) async {
  final api = ref.watch(apiProvider);
  final id = ref.watch(selectedMovieId);
  final response = await api.getResponse(path: '/movie/$id?');
  return Movie.fromMap(response.data);
});
