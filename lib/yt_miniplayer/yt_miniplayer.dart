import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';
import 'package:yt_clone_webplayer/vid_screen/video_page.dart';

class YT_Miniplayer extends StatefulWidget {
   YT_Miniplayer({Key? key}) : super(key: key);


  @override
  _YT_MiniplayerState createState() => _YT_MiniplayerState();
}

class _YT_MiniplayerState extends State<YT_Miniplayer> {
  AppStateContainerState? scont;
  AppState? astate;


  @override
  void initState() {
    Future.delayed(Duration.zero,(){
    astate!.mp_snap_height = ss.height * .3;
    astate!.mp_min_height = ss.height * .12;
    astate!.mp_max_height = ss.height * .88;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;


    astate!.mp_adj_height = astate!.mp_min_height + (astate!.mp_drag_dist);

    if (astate!.mp_adj_height < astate!.mp_min_height){
      astate!.mp_adj_height = astate!.mp_min_height;
    }
    if (astate!.mp_adj_height > astate!.mp_max_height){
      astate!.mp_adj_height = astate!.mp_max_height;
    }
    if (astate!.mp_expanded == true &&
        astate!.drag_progress == true) {
      astate!.mp_adj_height = astate!.mp_max_height + astate!.mp_drag_dist;
    }
    if (astate!.mp_expanded == true &&
    astate!.drag_progress == false) {
      astate!.mp_adj_height = astate!.mp_max_height;
    }

    return
      astate!.cVideo == null? Container():
      GestureDetector(
          onTap:(){
            if( astate!.mp_expanded  == false){
              astate!.mp_expanded = true;
              scont!.updateState();
            }
          },
          onVerticalDragStart: ( DragStartDetails dsd ){
                astate!.drag_progress = true;
              // scont!.updateState();
          },
          onVerticalDragUpdate: (DragUpdateDetails dud){
            print("mp mini vertical drag dets " + dud.toString());
            if (dud.delta.distance > 0) {
              print("Delta idst> 0");
              double new_height  = astate!.mp_min_height +
                  (astate!.mp_drag_dist - dud.delta.dy);

              if (new_height >= astate!.mp_min_height) {
                print("new height above min");
                astate!.mp_drag_dist =
                      astate!.mp_drag_dist - dud.delta.dy;
                  astate!.mp_adj_height = astate!.mp_min_height +
                      astate!.mp_drag_dist;
                  scont!.updateState();
              }

              if (astate!.mp_adj_height < astate!.mp_min_height){
                astate!.mp_adj_height = astate!.mp_min_height;
              }
            }
            },
          onVerticalDragEnd: (DragEndDetails){
            print("drag end called");
            if (astate!.mp_adj_height > astate!.mp_snap_height) {
                  astate!.mp_expanded = true;
                  }
            if (astate!.mp_adj_height < astate!.mp_snap_height) {
                astate!.mp_expanded = false;
            }
            astate!.mp_drag_dist = 0;
            astate!.drag_progress = false;
            scont!.updateState();
          }
          ,
          child:
          AnimatedContainer(
              duration: (astate!.drag_progress == false)?
              Duration(milliseconds:300):
              Duration.zero,
              width: ss.width,
              height: astate!.mp_adj_height,
          color: yt_bg_accent_color,
            child:
 Stack(children:[
                  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
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
                            ]
                      )
                  ),
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
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                            AnimatedContainer(
                          duration:
                  (astate!.drag_progress == false)?
                          Duration(milliseconds:300):
                              Duration.zero,
                          width: ( astate!.mp_expanded == false &&
                              astate!.drag_progress == false)?
                          (ss.width * .5) :
                          (astate!.drag_progress &&
                              astate!.mp_adj_height < astate!.mp_snap_height)?
                          (ss.width/2) +
                              ( ((astate!.mp_adj_height - astate!.mp_min_height )/astate!.mp_snap_height)
                                  * ( ss.width /2)) :
                          ss.width,
                          child:VideoPage(),)

                  ]),
            ])
      )
        );
  }
}
