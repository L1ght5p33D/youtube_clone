import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/vid_screen/video_miniature.dart';
import 'package:yt_clone_webplayer/components/vid_overlay.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

class OLVideoPlayer extends StatefulWidget {
  OLVideoPlayer({Key? key}) : super(key: key);


  @override
  _OLVideoPlayerState createState() => _OLVideoPlayerState();
}

class _OLVideoPlayerState extends State<OLVideoPlayer> {

  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    return Container(
      child: Column(
        children: [
          Stack(children:[

            VideoMiniature(path: astate!.cVideo!.miniatureImagePath),
            VidOverlay()

          ]),

        ],
      ),
    );
  }
}