import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/vid_screen/ol_video_player.dart';
import 'package:yt_clone_webplayer/vid_screen/video_description.dart';
import 'package:yt_clone_webplayer/vid_screen/action_buttons_bar.dart';
import 'package:yt_clone_webplayer/vid_screen/subscriptions_bar.dart';
import 'package:yt_clone_webplayer/vid_screen/comments_section.dart';
import 'package:yt_clone_webplayer/vid_screen/recommendations_section.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';
import 'dart:math' as math;

class VideoPage extends StatelessWidget {
  VideoPage({Key? key}) : super(key: key);

  AppStateContainerState? scont;
  AppState? astate;


  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;


      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics:
            (astate!.drag_progress == false
                && astate!.mp_expanded == true)?
            const ClampingScrollPhysics():
            NeverScrollableScrollPhysics() ,
            child: Column(
              children: [
                OLVideoPlayer(),
                Opacity(opacity:
                (astate!.mp_adj_height <= ss.height &&
                    astate!.mp_expanded == false)?
                math.pow(astate!.mp_adj_height,3 ) /
                    math.pow(ss.height, 3)  :
                (astate!.mp_adj_height < .1 * ss.height)?
                    0:(astate!.mp_expanded == true)? 1:0
                    ,
                    child: Column(children:[
                VideoDetailsPanel(),
                ActionButtonsBar(),
                SubscriptionBar(),
                const CommentsSection(),
                RecommendationsSection(),
                ]))
              ],
            ),
          ),
        ),
      );
  }
}