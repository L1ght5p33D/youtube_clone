import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';

class AppState{

  bool mp_expanded = false;
  bool drag_progress = false;
  double mp_drag_dist = 0.0;

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