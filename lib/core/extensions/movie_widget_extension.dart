import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/movies/result.dart';
import '../../view/mobile/widgets/star_rating.dart';
import '../constants.dart';

extension MovieWidgetExtension on Result {
  GridTile buildMovieGridTile() {
    return GridTile(
      header: GridTileBar(
        title: StarRating(
          rating: voteAverage,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(title),
        subtitle: Text(overview),
      ),
      child: posterPath.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: '$imageUrlSmall$posterPath',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              errorWidget: (_, __, error) => const Icon(Icons.error),
            )
          : Container(),
    );
  }
}
