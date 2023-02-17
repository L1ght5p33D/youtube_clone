import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CommentsSectionHeader(),
            LastComment(),
          ],
        ),
      ),
    );
  }
}

class CommentsSectionHeader extends StatelessWidget {
  CommentsSectionHeader({Key? key}) : super(key: key);

  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 115,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Comments',
                  style: TextStyle(
                      fontSize: 16),
                ),
                Text(
                  astate!.cVideoComments!.numberOfComments.toString(),
                  style: const TextStyle(
                      fontSize: 16),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.share_up,
              // color: accentLightGrey,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class LastComment extends StatelessWidget {
  LastComment({Key? key}) : super(key: key);

  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  astate!.cVideoComments!.topComment.avatarImagePath,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                astate!.cVideoComments!.topComment.text,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  height: 1.75,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}