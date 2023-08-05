import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/core/extensions/string_extension.dart';
import 'package:movies_app/providers/reviews_provider.dart';
import 'package:movies_app/providers/similar_movies_provider.dart';
import 'package:movies_app/view/mobile/pages/video_player.dart';

import '../../../core/constants.dart';
import '../../../providers/selected_movie_provider.dart';
import '../../../providers/videos_provider.dart';

class MoviePage extends ConsumerStatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends ConsumerState<MoviePage>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _scrollController.addListener(() {
      final scrollOffset = _scrollController.offset;

      final opacity = scrollOffset / (context.screenHeight * 0.5);
      _animationController.value = opacity;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(selectedMovieProvider).when(
          data: (movie) => Scaffold(
            extendBodyBehindAppBar: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    '$imageUrlLarge${movie.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: context.currentTheme.cardColor.withOpacity(0.5),
                  child: SafeArea(
                    child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) => [],
                      body: CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            leading: IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor: context.currentTheme.cardColor
                                    .withOpacity(0.5),
                              ),
                              onPressed: () => context.pop(),
                              icon: const FaIcon(FontAwesomeIcons.chevronLeft),
                            ),
                            expandedHeight: context.screenHeight * 0.5,
                            pinned: true,
                            flexibleSpace: FlexibleSpaceBar(
                              titlePadding: EdgeInsets.symmetric(
                                horizontal: context.screenWidth * 0.13,
                                vertical: 15.0,
                              ),
                              centerTitle: true,
                              title: AnimatedBuilder(
                                animation: _opacityAnimation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _opacityAnimation.value,
                                    child: child,
                                  );
                                },
                                child: Text(
                                  movie.title!,
                                  textAlign: TextAlign.center,
                                  style: context.responsiveMovieTitleStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              background: CachedNetworkImage(
                                imageUrl: '$imageUrlLarge${movie.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: ref.watch(videosPerMovieProvider).when(
                                  data: (videos) => Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SizedBox(
                                      height: context.screenWidth * 0.6,
                                      width: context.screenWidth,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: videos.results.length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                          onTap: () => showDialog(
                                            context: context,
                                            builder: (context) => VideoPlayer(
                                              id: videos.results[index].key,
                                            ),
                                          ),
                                          child: Container(
                                            width: context.screenWidth * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                  videos.results[index].key
                                                      .getImageURL(),
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: 70.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey.shade200
                                                      .withOpacity(0.5),
                                                ),
                                                child: const Center(
                                                  child: FaIcon(
                                                    FontAwesomeIcons.play,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(width: 16.0),
                                      ),
                                    ),
                                  ),
                                  error: (_, __) =>
                                      const Text('Error somthing went wrong'),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            /*ref.watch(imagesPerMovieProvider).when(
                                  data: (images) => Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SizedBox(
                                      height: context.screenWidth * 0.6,
                                      width: context.screenWidth,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            CachedNetworkImage(
                                          imageUrl:
                                              '$imageUrlLarge${images.posters[index].filePath}',
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  ConstrainedBox(
                                            constraints: const BoxConstraints(
                                              minWidth: 200.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(width: 16.0),
                                        itemCount: images.posters.length,
                                      ),
                                    ),
                                  ),
                                  error: (error, stack) => const Text('error'),
                                  loading: () => const Center(
                                      child: CircularProgressIndicator()),
                                ),*/
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(16.0),
                            sliver: SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  const Text('Original Title'),
                                  Text(
                                    movie.originalTitle!,
                                  ),
                                  const Divider(),
                                  const Text('Tagline'),
                                  Text(
                                    movie.tagline!,
                                  ),
                                  const Divider(),
                                  const Text('Overview'),
                                  Text(
                                    movie.overview!,
                                  ),
                                  const Divider(),
                                  const Text('Genres'),
                                  Text(
                                    movie.genres!.map((e) => e.name).join(', '),
                                  ),
                                  const Divider(),
                                  const Text('Release Date'),
                                  Text(
                                    movie.releaseDate!,
                                  ),
                                  const Divider(),
                                  const Text('Popularity'),
                                  Text(
                                    movie.popularity!.toString(),
                                  ),
                                  const Divider(),
                                  const Text('Vote Average'),
                                  Text(
                                    movie.voteAverage!.toString(),
                                  ),
                                  const Divider(),
                                  const Text('Similar Movies'),
                                ],
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(16.0),
                            sliver: ref.watch(similarMoviesProvider).when(
                                  data: (similarMovies) => SliverGrid(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8.0,
                                      crossAxisSpacing: 8.0,
                                    ),
                                    delegate: SliverChildListDelegate(
                                      [
                                        ...similarMovies.results.map(
                                          (movie) => GestureDetector(
                                            onTap: () =>
                                                movie.posterPath.isNotEmpty
                                                    ? ref
                                                        .read(selectedMovieId
                                                            .notifier)
                                                        .state = movie.id
                                                    : context.showSnackBar(
                                                        'Sorry this movie is not available',
                                                        backgroundColor:
                                                            Colors.red.shade200,
                                                      ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    movie.posterPath.isNotEmpty
                                                        ? '$imageUrlLarge${movie.posterPath}'
                                                        : imageNotFound,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    movie.title,
                                                    textAlign: TextAlign.center,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      backgroundColor: context
                                                          .currentTheme
                                                          .canvasColor
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  error: (_, __) => const SliverToBoxAdapter(
                                    child: Text('error'),
                                  ),
                                  loading: () => const SliverToBoxAdapter(
                                    child: Text('loading'),
                                  ),
                                ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            sliver: SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  const Divider(),
                                  const Text('Reviews'),
                                  ...ref.watch(reviewsProvider).when(
                                        data: (reviews) =>
                                            reviews.results.isNotEmpty
                                                ? reviews.results
                                                    .map(
                                                      (review) => Text(
                                                          '${review.author}\n ${review.content}'),
                                                    )
                                                    .toList()
                                                : [
                                                    const Text('No reviews'),
                                                  ],
                                        error: (_, __) => [const Text('error')],
                                        loading: () =>
                                            const [CircularProgressIndicator()],
                                      ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (_, __) =>
              const Scaffold(body: Text('Error: something went wrong')),
        );
  }
}
