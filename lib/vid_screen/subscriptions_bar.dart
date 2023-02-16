import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/state/vid_data.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

class SubscriptionBar extends StatelessWidget {
  SubscriptionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: mainComponentsGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[ChannelInformation(), SubscriptionStatus()],
      ),
    );
  }
}

class ChannelInformation extends StatelessWidget {
  ChannelInformation({Key? key}) : super(key: key);

  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    return SizedBox(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(astate!.cVideo!.channel.logoImagePath),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  astate!.cVideo!.channel.name,
                  style: const TextStyle(
                      // color: accentLightGrey,
                    overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${formatNumber(astate!.cVideo!.channel.subscribersCounter)}',
                  style: const TextStyle(

                      // color: textLightGrey,
                      fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionStatus extends StatelessWidget {
  const SubscriptionStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            ClipRRect(
        borderRadius: BorderRadius.circular(ss.width*.04),
        child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Subscribed'.toUpperCase(),
                style: const TextStyle(
                    // color: textLightGrey,
                    fontSize: 16),
              ),
            )),
          ],
        ),
      ),
    );
  }
}