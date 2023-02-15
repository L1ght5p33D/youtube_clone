import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/yt_globals.dart';

class YTAppBarBottomIB extends StatelessWidget {
  YTAppBarBottomIB({Key? key, required this.btext}) : super(key: key);

  String btext;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.symmetric(horizontal:ss.width*.03),
          child:
          ClipRRect(
              borderRadius: BorderRadius.circular(ss.width * .03),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:ss.width*.02),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(child:Text(btext,
                  style: TextStyle(fontSize: ss.width*.03),),),)));
  }
}

class YTAppBarBottomIBLast extends StatelessWidget {
  YTAppBarBottomIBLast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.symmetric(horizontal:ss.width*.03),
          child:
          ClipRRect(
              borderRadius: BorderRadius.circular(ss.width * .03),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:ss.width*.02),
                // color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(child:Text("Send feedback",
                  style: TextStyle(fontSize: ss.width*.03,
                      color: Colors.blue),),),)));
  }
}