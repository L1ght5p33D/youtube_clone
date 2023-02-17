import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
class VideoMiniature extends StatelessWidget {
  final String path;

  const VideoMiniature({Key? key, this.path = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:ss.width,
      height: ss.height / 3.5,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.fill),
      ),
    );
  }
}