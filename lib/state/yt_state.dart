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

    state!.cUser = Channel(
      'SigInfinite',
      logoImagePath: 'assets/images/detail/si_dripping_logo.png',
      imageUrl: 'https://avatars.githubusercontent.com/u/63707302?v=4',
      subscribersCounter: 100000,
    );


    state!.cVideoComments = VideoComments(
        Comment(
            'assets/images/user1_pp.png',
            'This video is great '
                'here is more stuff about the video i like '
                ' And now even more comment text'),
        numberOfComments: 799);

    state!.cVideo = null;


    state!.recommendations = [
      Video(
        'https://i.ytimg.com/vi/AJakywBLaJ0/hqdefault.jpg',
        'Charlie Kelly Stupidity Compilation 2',
        Channel(
          'It\'s always sunny',
          logoImagePath: 'assets/images/user2_pp.png',
          subscribersCounter: 865000,
        ),
        DateTime(2021, 29, 9),
        viewsCounter: 358000,
      ),
      Video(
        'https://i.ytimg.com/vi/7xAToHK2nMk/hqdefault.jpg',
        'Giant Rabbit Playing with Dog',
    Channel(
    'AnimalChannel',
    logoImagePath: 'assets/images/user3_pp.png',
    subscribersCounter: 65000,
    ),
        DateTime(2020, 1, 1),
        viewsCounter: 0,
      ),
      Video(
        'https://i.ytimg.com/vi/WNSZ6xouNv4/hq720.jpg',
        'David Goggins - How To Get Up Early Every Day',
          Channel(
          'Useful Motivation',
          logoImagePath: 'assets/images/user4_pp.png',
          subscribersCounter: 965000,
          ),
        DateTime(2020, 5, 4),
        viewsCounter: 42,
      ),
      Video(
        'https://i.ytimg.com/vi/wTq3E1hU4uQ/hq720.jpg',
        'Mission Across Tatra Mountain Valley Peaks',
        Channel(
          'Travel Best',
          logoImagePath: 'assets/images/user5_pp.png',
          subscribersCounter: 1865000,
        ),
        DateTime(2018, 3, 3),
        viewsCounter: 90000000,
      ),
      Video(
        'https://i.ytimg.com/vi/4tySWLqrYRo/hq720.jpg',
        'Skiing with the bear on the slope',
        Channel(
          'Sports Mania',
          logoImagePath: 'assets/images/user1_pp.png',
          subscribersCounter: 265000,
        ),
        DateTime(2019, 23, 2),
        viewsCounter: 20000,
      ),
    ];

    state!.homeScreenVideos = [
      Video(
        'https://i.ytimg.com/vi/K9EBPADwJuA/hq720.jpg',
        'Season 4 Funny Moments - Silicon Valley',
        Channel(
          'Top Silcon Valley',
          logoImagePath: 'assets/images/user1_pp.png',
          imageUrl: 'https://avatars.githubusercontent.com/u/63704302',
          subscribersCounter: 100000,
        ),
        DateTime(2018, 3, 3),
        duration: '17:17',
        viewsCounter: 10000,
        likesCounter: 958,
        dislikesCounter: 4,
      ),
      Video(
        'https://i.ytimg.com/vi/-U5dEdWouDY/hq720.jpg',
        'MIND BLOWING WORK ETHIC - Elon Musk Motivational Video',
        Channel(
          'Motivation',
          logoImagePath: 'assets/images/user2_pp.png',
          imageUrl: 'https://avatars.githubusercontent.com/u/63404302',
          subscribersCounter: 100000,
        ),
        DateTime(2022, 2, 22),
        duration: '1:00:04',
        viewsCounter: 148000,
        likesCounter: 1487,
        dislikesCounter: 86,
      ),
      Video(
        'https://i.ytimg.com/vi/qXD9HnrNrvk/hqdefault.jpg',
        'Expert Wasted Entire Life Studying Anteaters',
        Channel(
          'Real Science',
          logoImagePath: 'assets/images/user3_pp.png',
          imageUrl: 'https://avatars.githubusercontent.com/u/63754302',
          subscribersCounter: 100000,
        ),
        DateTime(2015, 7, 11),
        duration: '2:55',
        viewsCounter: 18000000,
        likesCounter: 4000,
        dislikesCounter: 450,
      )
    ];

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