import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/home_wrap.dart';
import 'package:yt_clone_webplayer/video_details_page.dart';
import 'package:yt_clone_webplayer/yt_state.dart';


void main() {
  runApp(const YTApp());
}

class YTApp extends StatelessWidget {
  const YTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateContainer(child:MaterialApp(
      title: 'YT Clone Webplayer',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: YTHome(),
      routes:{
        "/video_details": (context){ return VideoDetailPage();},
        "/home": (context){ return YTHome();}
      }
    ));
  }
}




