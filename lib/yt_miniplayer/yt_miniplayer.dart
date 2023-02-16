import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';
import 'package:yt_clone_webplayer/vid_screen/video_details_page.dart';

class YT_Miniplayer extends StatefulWidget {
   YT_Miniplayer({Key? key,
     this.expanded=false,
     this.drag_val=0.0,
   }) : super(key: key);

  bool expanded;
  double drag_val;


  @override
  _YT_MiniplayerState createState() => _YT_MiniplayerState();
}

class _YT_MiniplayerState extends State<YT_Miniplayer> {
  AppStateContainerState? scont;
  AppState? astate;


  double mp_max_height = ss.height * .88;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;

    if (mp_max_height - (astate!.mp_drag_dist) < ss.height * .3){
      widget.expanded = false;
      Future.delayed(Duration.zero,(){
      astate!.mp_expanded = false;
        astate!.mp_drag_dist = 0.0;
        scont!.updateState();
      });
    }

    print("yt player build max height " + astate!.mp_drag_dist.toString() );

    return
      astate!.cVideo == null? Container():
      AnimatedSize(
      duration: Duration(milliseconds:500),
          curve: Curves.fastOutSlowIn,
          alignment: Alignment.bottomCenter,
          child:
              GestureDetector(
    onTap:(){
          if(widget.expanded == false){
            setState(() {
              widget.expanded = true;
            });
              astate!.mp_expanded = true;
            scont!.updateState();
            }
          },
          child: Container(
              width: ss.width,
              height: widget.expanded == true ? mp_max_height - (astate!.mp_drag_dist): ss.height*.12,
    color: Colors.transparent,
            child: Stack(children:[
              widget.expanded == false?
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
                ],):Container(),

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

                          width: widget.expanded == false? ss.width * .5: ss.width,
                          // color:Colors.blue
                          child:VideoDetailPage(),)),
                  ]),


            ])))
        );
  }
}
