import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movie_genres/genres.dart';

import '../datasources/remote/api.dart';

final moviesGenresProvider = FutureProvider.autoDispose<Genres>((ref) async {
  final api = ref.watch(apiProvider);
  final response = await api.getResponse(path: '/genre/movie/list');
  return Genres.fromMap(response.data);
});
