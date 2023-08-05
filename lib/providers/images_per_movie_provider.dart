import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/providers/selected_movie_provider.dart';

import '../datasources/remote/api.dart';
import '../models/movies/images.dart';

final imagesPerMovieProvider = FutureProvider.autoDispose<Images>((ref) async {
  final api = ref.watch(apiProvider);
  final id = ref.watch(selectedMovieId);
  final response = await api.getResponse(path: '/movie/$id/images?');
  return Images.fromMap(response.data);
});
