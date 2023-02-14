import 'package:flutter/material.dart';

class Video {
  final String miniatureImagePath;
  final String title;
  final Channel channel;
  final DateTime timestamp;
  String duration;
  List<String> tags;
  final int viewsCounter;
  final int likesCounter;
  final int dislikesCounter;

  Video(
      this.miniatureImagePath,
      this.title,
      this.channel,
      this.timestamp, {
        this.tags = const [],
        this.viewsCounter = 0,
        this.likesCounter = 0,
        this.dislikesCounter = 0,
        this.duration = '00:00',
      });
}

class Channel {
  final String name;
  String logoImagePath;
  String imageUrl;
  int subscribersCounter;

  Channel(
      this.name, {
        this.logoImagePath = '/',
        this.imageUrl = '/',
        this.subscribersCounter = 0,
      });
}

class Comment {
  String avatarImagePath;
  String username;
  String text;

  Comment(this.avatarImagePath, this.text, {this.username = 'null'});
}

class VideoComments {
  int numberOfComments;
  Comment topComment;

  VideoComments(
      this.topComment, {
        this.numberOfComments = 0,
      });
}

String formatNumber(int value) {
  const units = <int, String>{
    1000000000: 'B',
    1000000: 'M',
    1000: 'K',
  };
  return units.entries
      .map((e) => '${value ~/ e.key}${e.value}')
      .firstWhere((e) => !e.startsWith('0'), orElse: () => '$value');
}

class VideoMiniature extends StatelessWidget {
  final String path;

  const VideoMiniature({Key? key, this.path = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
      ),
    );
  }
}

Channel currentUser = Channel(
  'John Steck',
  logoImagePath: 'assets/images/user1_pp.png',
  imageUrl: 'https://avatars.githubusercontent.com/u/63707307?v=4',
  subscribersCounter: 100000,
);

Channel currentVideoDetailChannel = Channel(
  'Fireship',
  logoImagePath: 'assets/images/video_detail/logos/fireship_logo.jpg',
  subscribersCounter: 865000,
);

Video currentVideo = Video(
  'assets/images/video_detail/miniatures/0.jpg',
  'React Native vs Flutter - I built the same chat app with both',
  currentVideoDetailChannel,
  DateTime(2021, 21, 10),
  tags: ['#flutter', '#react', '#versus'],
  viewsCounter: 282000,
  likesCounter: 13000,
  dislikesCounter: 170,
);

VideoComments currentVideoComments = VideoComments(
    Comment(
        'assets/images/video_detail/avatars/avatar0.jpg',
        'I love this guy I literally asked for this video '
            'and he made it, he made the tech stacks video like so too. '
            'He is close to his viewers and comment...'),
    numberOfComments: 799);

final List<Video> recommendations = [
  Video(
    'https://i.ytimg.com/vi/AJakywBLaJ0/hqdefault.jpg',
    'Charlie Kelly Stupidity Compilation',
    currentVideoDetailChannel,
    DateTime(2021, 29, 9),
    viewsCounter: 358000,
  ),
  Video(
    'https://i.ytimg.com/vi/7xAToHK2nMk/hqdefault.jpg',
    'Giant Rabbit Playing with Dog',
    currentVideoDetailChannel,
    DateTime(2020, 1, 1),
    viewsCounter: 0,
  ),
  Video(
    'https://i.ytimg.com/vi/WNSZ6xouNv4/hq720.jpg',
    'David Goggins - How To Get Up Early Every Day',
    currentVideoDetailChannel,
    DateTime(2020, 5, 4),
    viewsCounter: 42,
  ),
  Video(
    'https://i.ytimg.com/vi/wTq3E1hU4uQ/hq720.jpg',
    'Mission Across Tatra Mountain Valley Peaks',
    currentVideoDetailChannel,
    DateTime(2018, 3, 3),
    viewsCounter: 90000000,
  ),
  Video(
    'https://i.ytimg.com/vi/4tySWLqrYRo/hq720.jpg',
    'Skiing with the bear on the slope',
    currentVideoDetailChannel,
    DateTime(2019, 23, 2),
    viewsCounter: 20000,
  ),
];

final List<Video> homeScreenVideos = [
  Video(
    'https://i.ytimg.com/vi/K9EBPADwJuA/hq720.jpg',
    'Season 4 Funny Moments - Silicon Valley',
    currentUser,
    DateTime(2018, 3, 3),
    duration: '17:17',
    viewsCounter: 10000,
    likesCounter: 958,
    dislikesCounter: 4,
  ),
  Video(
    'https://i.ytimg.com/vi/-U5dEdWouDY/hq720.jpg',
    'MIND BLOWING WORK ETHIC - Elon Musk Motivational Video',
    currentUser,
    DateTime(2022, 2, 22),
    duration: '1:00:04',
    viewsCounter: 148000,
    likesCounter: 1487,
    dislikesCounter: 86,
  ),
  Video(
    'https://i.ytimg.com/vi/qXD9HnrNrvk/hqdefault.jpg',
    'Expert Wasted Entire Life Studying Anteaters',
    currentUser,
    DateTime(2015, 7, 11),
    duration: '2:55',
    viewsCounter: 18000000,
    likesCounter: 4000,
    dislikesCounter: 450,
  )
];