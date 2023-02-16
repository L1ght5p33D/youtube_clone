import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';
import 'package:yt_clone_webplayer/vid_screen/video_details_page.dart';

class YT_Miniplayer extends StatefulWidget {
   YT_Miniplayer({Key? key,
     this.expanded=false,
     this.drag_val=0.0,
   this.color = Colors.purple}) : super(key: key);

  bool expanded;
  double drag_val;
  Color color;

  @override
  _YT_MiniplayerState createState() => _YT_MiniplayerState();
}

class _YT_MiniplayerState extends State<YT_Miniplayer> {
  AppStateContainerState? scont;
  AppState? astate;


  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;


    return
      astate!.cVideo == null? Container():
      AnimatedSize(
      duration: Duration(seconds:2),
          curve: Curves.easeOut,
          alignment: Alignment.bottomCenter,
          child:Container(
    height: widget.expanded == true ? ss.height * .88: ss.height*.12,
    color: widget.color,
            child: Stack(children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  // Transform(transform:
                  // Matrix4(
                  //   1 / (percentage + .75) ,0,0,0,
                  //   0,1,0,0,
                  //   0,0,1,0,
                  //   0,0,0,1,),
                  //     alignment: FractionalOffset.centerRight,
                  //     child:
                  Container(
                      width: ss.width*.5,
                      // color:Colors.green,
                      child:Row(children: [
                        Flexible(child:
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Text(astate!.cVideo!.title,
                                style: TextStyle(overflow: TextOverflow.ellipsis,
                                    fontSize: ss.width*.03),),
                              Text(astate!.cVideo!.channel.name,
                                style: TextStyle(overflow: TextOverflow.ellipsis,
                                    fontSize: ss.width*.03),),
                            ])),
                        Icon(Icons.play_arrow),
                        GestureDetector(
                            onTap: (){
                              setState(() {
                                astate!.cVideo = null;
                              });
                            },
                            child:Icon(Icons.clear))
                      ],)
                  )
                ],),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform(transform:
                    Matrix4(
                      ( 1 )  ,0,0,0,
                      0,1,0,0,
                      0,0,1,0,
                      0,0,0,1,),
                        alignment: FractionalOffset.center,
                        child: Container(
                          width: ss.width * .5,
                          // color:Colors.blue
                          child:VideoDetailPage(),)),
                  ]),


            ]))
        );
  }
}
