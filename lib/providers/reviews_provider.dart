import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movies/reviews.dart';
import 'package:movies_app/providers/selected_movie_provider.dart';

import '../datasources/remote/api.dart';

final reviewsProvider = FutureProvider.autoDispose<Reviews>((ref) async {
  final api = ref.watch(apiProvider);
  final id = ref.watch(selectedMovieId);
  final response = await api.getResponse(path: '/movie/$id/reviews?page=1');
  return Reviews.fromMap(response.data);
});
