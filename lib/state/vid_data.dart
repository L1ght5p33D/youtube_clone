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
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.fill),
      ),
    );
  }
}



