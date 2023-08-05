import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/core/extensions/context_extension.dart';
import 'package:movies_app/providers/selected_movie_type_provider.dart';
import 'package:movies_app/view/mobile/widgets/bottom_widget.dart';
import 'package:movies_app/view/mobile/widgets/movies_grid.dart';

class MoviesTypePage extends ConsumerWidget {
  const MoviesTypePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
        ),
        centerTitle: true,
        title: Text(
          ref.watch(selectedMovieEnumProvider).toString(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ref.watch(moviesTypeProvider).when(
                  data: (data) => MoviesGrid(
                    movies: data,
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (_, __) => const Text('Error somthing went wrong'),
                ),
          ),
          Expanded(child: BottomWidget()),
        ],
      ),
    );
  }
}
