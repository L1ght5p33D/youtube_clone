
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:miniplayer/miniplayer.dart';

class AppState{

  bool mp_expanded = false;

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