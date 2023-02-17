import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

class ActionButton extends StatelessWidget {
  final IconData actionIcon;
  final String bottomLabel;

  const ActionButton(
      {Key? key, this.actionIcon = Icons.close, this.bottomLabel = 'None'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? 55
            : MediaQuery.of(context).size.height / 3.45,
        height: 70,
        padding: MediaQuery.of(context).orientation == Orientation.portrait
            ? const EdgeInsets.symmetric(vertical: 10.0)
            : const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              actionIcon,
              size: 20,
            ),
            Text(
              bottomLabel,
              style: const TextStyle(
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class ActionButtonsBar extends StatelessWidget {
  ActionButtonsBar({Key? key}) : super(key: key);

  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;

    List<Widget> actionButtons = [
      ActionButton(
        actionIcon: Icons.thumb_up_alt_outlined,
        bottomLabel: formatNumber(astate!.cVideo!.likesCounter),
      ),
      ActionButton(
          actionIcon: Icons.thumb_down_alt_outlined,
          bottomLabel: formatNumber(astate!.cVideo!.dislikesCounter)),
      const ActionButton(
        actionIcon: CupertinoIcons.reply_all,
        bottomLabel: 'Share',
      ),
      const ActionButton(
        actionIcon: Icons.video_library_outlined,
        bottomLabel: 'Create',
      ),
      const ActionButton(
        actionIcon: Icons.download_outlined,
        bottomLabel: 'Download',
      ),
      const ActionButton(
        actionIcon: Icons.save_alt_outlined,
        bottomLabel: 'Save',
      ),
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: actionButtons,
        ),
      ),
    );
  }
}