import 'package:flutter/material.dart';
import 'package:test/model/video_model.dart';
import 'package:test/widgets/home/controls/onscreen_controls.dart';
import 'package:test/widgets/home/home_video_renderer.dart';

class HomeScreen extends StatelessWidget {
  List<Video> videoList;
  HomeScreen({this.videoList});


  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position)
        {
          return Container(
            color: Colors.black,
            child: Stack(
              children: <Widget>[AppVideoPlayer(video:videoList.elementAt(position),position: position,),
                onScreenControls(videoList.elementAt(position))],
            ),
          );
        },
              itemCount: videoList.length);
  }
}
