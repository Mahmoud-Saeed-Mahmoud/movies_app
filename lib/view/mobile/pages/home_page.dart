import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/models/movie_type_enum.dart';
import 'package:movies_app/providers/selected_movie_type_provider.dart';
import 'package:movies_app/providers/trending_provider.dart';
import 'package:movies_app/view/mobile/pages/movies_type_page.dart';
import 'package:movies_app/view/mobile/widgets/carousel_widget.dart';

import '../../../providers/now_playing_provider.dart';
import '../../../providers/pages_provider.dart';
import '../../../providers/popular_provider.dart';
import '../../../providers/top_rated_provider.dart';
import '../../../providers/upcoming_provider.dart';
import '../widgets/movie_type.dart';
import '../widgets/search_delegate_widget.dart';
import '../widgets/theme_mode_switcher.dart';

class MobileHomePage extends ConsumerWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              showSearch(context: context, delegate: MoviesSearchDelegate()),
          icon: const Icon(Icons.search),
        ),
        title: const Text('FilmFrenzy'),
        centerTitle: true,
        actions: const [
          ThemeModeSwitcher(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.screenHeight * 0.30,
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  return ref.watch(trendingMoviesProvider).when(
                        data: (data) => CarouselWidget(
                          movies: data,
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (_, __) =>
                            const Text('Error somthing went wrong'),
                      );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Now Playing'),
                  TextButton(
                      onPressed: () {
                        ref.read(selectedMovieEnumProvider.notifier).state =
                            MovieTypeEnum.nowPlaying;
                        ref.read(pageNumberProvider.notifier).state = 1;

                        context.pushScreen(const MoviesTypePage());
                      },
                      child: const Text('See All'))
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.25,
              child: MovieType(
                movie: nowPlayingMoviesProvider,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular'),
                  TextButton(
                      onPressed: () {
                        ref.read(selectedMovieEnumProvider.notifier).state =
                            MovieTypeEnum.popular;
                        ref.read(pageNumberProvider.notifier).state = 1;

                        context.pushScreen(const MoviesTypePage());
                      },
                      child: const Text('See All'))
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.25,
              child: MovieType(
                movie: popularMoviesProvider,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Top Rated'),
                  TextButton(
                      onPressed: () {
                        ref.read(selectedMovieEnumProvider.notifier).state =
                            MovieTypeEnum.topRated;
                        ref.read(pageNumberProvider.notifier).state = 1;

                        context.pushScreen(const MoviesTypePage());
                      },
                      child: const Text('See All'))
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.25,
              child: MovieType(
                movie: topRatedMoviesProvider,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Upcoming'),
                  TextButton(
                      onPressed: () {
                        ref.read(selectedMovieEnumProvider.notifier).state =
                            MovieTypeEnum.upcoming;
                        ref.read(pageNumberProvider.notifier).state = 1;

                        context.pushScreen(const MoviesTypePage());
                      },
                      child: const Text('See All'))
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.25,
              child: MovieType(
                movie: upcomingMoviesProvider,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
