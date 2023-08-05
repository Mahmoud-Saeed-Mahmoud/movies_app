import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.id});

  final String id;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    super.initState();
    _ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.id)!,
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _ytController,
        ),
        builder: (context, player) {
          return player;
        });
  }
}
