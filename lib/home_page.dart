import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yt_clone_webplayer/yt_globals.dart';
import 'package:yt_clone_webplayer/video_card.dart';
import 'package:yt_clone_webplayer/yt_state.dart';
import 'package:yt_clone_webplayer/AppStateModel.dart';
import 'package:yt_clone_webplayer/app_bar_bottom_buttons.dart';

class HomeList extends StatelessWidget {
  AppStateContainerState? scont;
  AppState? astate;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    return Scaffold(
      appBar: AppBar(toolbarHeight: ss.height * .05,
          backgroundColor: Colors.black87,
          title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Image.asset("assets/images/yt_logo_trans_dark.png",
                  height: ss.height * .04,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.wifi_tethering_sharp,
                      size:ss.height * .027),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: ss.width*.01),
                        child:
                        Icon(Icons.notifications_none,
                            size:ss.height * .027)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ss.width*.01),
                      child:
                      Icon(Icons.search,
                          size:ss.height * .027),),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: ss.width*.01),
                        child:
                        ClipRRect(
                            borderRadius: BorderRadius.circular(ss.height * .015),
                            child:Image.asset(astate!.cUser!.logoImagePath,
                              height: ss.height * .03,
                              width: ss.height * .03,
                              fit: BoxFit.fitHeight,)))],)
              ]),
      bottom:  PreferredSize(
        preferredSize: Size.fromHeight(ss.width*.07), // here the desired height
        child:  Padding(
    padding: EdgeInsets.all(ss.width*.01),
    child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Padding(
        padding: EdgeInsets.symmetric(horizontal:ss.width*.03),
        child:
          Container(child:Icon(Icons.compare_outlined,
          size: ss.width*.05,))),
          Container(
              height: ss.width*.06,
              width: ss.width*.84,
          child:ListView(
            scrollDirection: Axis.horizontal,
            children:[
          YTAppBarBottomIB(btext: "Music",),
              YTAppBarBottomIB(btext: "Mixes",),
              YTAppBarBottomIB(btext: "Sitcoms",),
              YTAppBarBottomIB(btext: "Scene",),
              YTAppBarBottomIB(btext: "Games",),
              YTAppBarBottomIB(btext: "Kittens",),
              YTAppBarBottomIB(btext: "History",),
              YTAppBarBottomIB(btext: "Watched",),
              YTAppBarBottomIB(btext: "New for you",),
              YTAppBarBottomIBLast()]))
      ],))),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child:
        Container(height: ss.height * .91,child:CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 60.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final video = astate!.homeScreenVideos![index];
                    return VideoCard(video: video);
                  },
                  childCount: astate!.homeScreenVideos!.length,
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}

