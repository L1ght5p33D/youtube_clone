import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:yt_clone_webplayer/vid_screen/video_description.dart';
import 'package:yt_clone_webplayer/vid_screen/action_buttons_bar.dart';
import 'package:yt_clone_webplayer/vid_screen/subscriptions_bar.dart';
import 'package:yt_clone_webplayer/vid_screen/comments_section.dart';
import 'package:yt_clone_webplayer/vid_screen/recommendations_section.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

DraggableScrollableController scroll_controller = DraggableScrollableController();

class VideoDetailPage extends StatelessWidget {
  VideoDetailPage({Key? key}) : super(key: key);

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
                VideoDescription(),
                ActionButtonsBar(),
                SubscriptionBar(),
                const CommentsSection(),
                RecommendationsSection(),
              ],
            ),
          ),
        ),
      );
  }
}