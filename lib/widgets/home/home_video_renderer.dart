import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:test/model/video_model.dart';

class AppVideoPlayer extends StatefulWidget
{
  Video video;
  int position;
  AppVideoPlayer({this.video,this.position});
  @override
  _AppVideoPlayerState createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  VideoPlayerController _controller;
  Video video ;
  @override
  void initState() {
    super.initState();
    video =widget.video;

    print("position----->"+widget.position.toString());
    print("url----->"+video.url);

    _controller = VideoPlayerController.network(
        video.url)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(
              color: Colors.black,
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
