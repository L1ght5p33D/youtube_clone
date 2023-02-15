import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/vid_data.dart';
import 'package:yt_clone_webplayer/video_description.dart';
import 'package:yt_clone_webplayer/action_buttons_bar.dart';
import 'package:yt_clone_webplayer/subscriptions_bar.dart';
import 'package:yt_clone_webplayer/comments_section.dart';
import 'package:yt_clone_webplayer/recommendations_section.dart';

DraggableScrollableController scroll_controller = DraggableScrollableController();

class VideoDetailPage extends StatelessWidget {
  VideoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
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