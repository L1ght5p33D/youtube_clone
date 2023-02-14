import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/vid_data.dart';

class VideoDescription extends StatelessWidget {
  VideoDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          VideoMiniature(path: currentVideo.miniatureImagePath),
          VideoDetailsPanel(),
        ],
      ),
    );
  }
}

class VideoDetailsPanel extends StatelessWidget {
  VideoDetailsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  style: const TextStyle(
                    // color: accentLightGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        // color: textLightGrey,
                        fontSize: 13),
                    children: [
                      TextSpan(
                        text:
                        '${formatNumber(currentVideo.viewsCounter)} views • ',
                            // '${timeago.format(currentVideo.timestamp)} ',
                      ),
                      TextSpan(
                        text: currentVideo.tags.join(' '),
                        style: const TextStyle(
                            // color: linkBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.expand_more_outlined,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}