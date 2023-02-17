import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';


class _InheritedStateContainer extends InheritedWidget {
  _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final AppStateContainerState data;

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class AppStateContainer extends StatefulWidget {
  AppStateContainer(
      {Key? key,
        required this.child,
        this.state,
      });

  AppState? state;

  final Widget child;

  @override
  AppStateContainerState createState() => AppStateContainerState();

  static AppStateContainerState of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
    as _InheritedStateContainer)
        .data;
  }

}

class AppStateContainerState extends State<AppStateContainer> {

  AppState? state;

  void updateState() {
    setState(() {
      state;
    });
  }

  @override
  void initState() {
    print("Init AppStateContainerState");
    state = AppState();

    state!.cUser = user_channel;
    state!.cVideoComments = example_video_comments;
    state!.cVideo = null;
    state!.recommendations = example_video_recommendations;
    state!.homeScreenVideos = home_screen_video_list;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("AppStateContainerState build called");
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}