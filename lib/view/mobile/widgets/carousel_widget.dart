import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/extensions/context_extension.dart';

import '../../../models/movies/movies.dart';
import '../../../providers/selected_movie_provider.dart';
import '../pages/movie_page.dart';

class CarouselWidget extends ConsumerWidget {
  const CarouselWidget({super.key, required this.movies});

  final Movies movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
        scrollDirection: Axis.horizontal,
        height: double.infinity,
      ),
      items: movies.results.map(
        (movie) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  ref.read(selectedMovieId.notifier).state = movie.id;
                  context.pushScreen(const MoviePage());
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: context.screenWidth,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: movie.posterPath.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: '$imageUrlLarge${movie.posterPath}',
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          errorWidget: (_, __, error) =>
                              const Icon(Icons.error),
                        )
                      : Container(),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
