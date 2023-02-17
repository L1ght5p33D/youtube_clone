import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/vid_screen/recommendations_section.dart';

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





Channel user_channel = Channel(
  'SigInfinite',
  logoImagePath: 'assets/images/detail/si_dripping_logo.png',
  imageUrl: 'https://avatars.githubusercontent.com/u/63707302?v=4',
  subscribersCounter: 100000,
);

VideoComments example_video_comments = VideoComments(
    Comment(
        'assets/images/user1_pp.png',
        'This video is great '
            'here is more stuff about the video i like '
            ' And now even more comment text'),
    numberOfComments: 799);

List<Video> home_screen_video_list = [
  Video(
    'https://i.ytimg.com/vi/NNAgJ5p4CIY/hq720.jpg',
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
    'https://i.ytimg.com/vi/TOQCh2ukyIQ/hq720.jpg',
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

List<Video> example_video_recommendations =  [
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
