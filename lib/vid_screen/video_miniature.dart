import 'package:flutter/material.dart';

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