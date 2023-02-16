import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';

class AppState{

  bool mp_expanded = false;
  Color mp_color = Colors.yellow;

  //current user
  Channel? cUser;
  // current video
  Video? cVideo;
  // current video comments
  VideoComments? cVideoComments;
  // home screen videos
  List<Video>? homeScreenVideos;
  //recommendations
  List<Video>? recommendations;


}