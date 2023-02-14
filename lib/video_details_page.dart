

import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/video_description.dart';
import 'package:yt_clone_webplayer/action_buttons_bar.dart';
import 'package:yt_clone_webplayer/subscriptions_bar.dart';
import 'package:yt_clone_webplayer/comments_section.dart';
import 'package:yt_clone_webplayer/recommendations_section.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const VideoDescription(),
              ActionButtonsBar(),
              const SubscriptionBar(),
              const CommentsSection(),
              const RecommendationsSection(),
            ],
          ),
        ),
      ),
    );
  }
}