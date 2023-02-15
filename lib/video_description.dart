import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/vid_data.dart';
import 'package:yt_clone_webplayer/yt_state.dart';
import 'package:yt_clone_webplayer/AppStateModel.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoDescription extends StatelessWidget {
  VideoDescription({Key? key}) : super(key: key);

  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    return Container(
      child: Column(
        children: [
          VideoMiniature(path: astate!.cVideo!.miniatureImagePath),
          VideoDetailsPanel(),
        ],
      ),
    );
  }
}

class VideoDetailsPanel extends StatelessWidget {
  VideoDetailsPanel({Key? key}) : super(key: key);

  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
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
                  astate!.cVideo!.title,
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
                        '${formatNumber(astate!.cVideo!.viewsCounter)} views • '+
                            '${timeago.format(astate!.cVideo!.timestamp)} ',
                      ),
                      TextSpan(
                        text: astate!.cVideo!.tags.join(' '),
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