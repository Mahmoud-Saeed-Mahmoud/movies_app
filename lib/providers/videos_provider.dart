import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/providers/selected_movie_provider.dart';

import '../datasources/remote/api.dart';
import '../models/movies/videos_per_movie.dart';

final videosPerMovieProvider = FutureProvider.autoDispose<Videos>((ref) async {
  final api = ref.watch(apiProvider);
  final id = ref.watch(selectedMovieId);
  final response = await api.getResponse(path: '/movie/$id/videos?');
  return Videos.fromMap(response.data)
    ..results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
});
