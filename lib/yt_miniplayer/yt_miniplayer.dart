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
  double mp_adj_height = 0.0;
  double mp_min_height = ss.height * .12;
  double mp_snap_height = ss.height * .3;

  bool expand_drag_in_progress = false;
  double expand_drag_distance = 0.0;

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

    if (expand_drag_in_progress != true) {
      mp_adj_height = mp_max_height - (astate!.mp_drag_dist);
    }
    else{
      mp_adj_height = mp_min_height + (expand_drag_distance);
    }

    print("yt player build max height " + astate!.mp_drag_dist.toString() );

    return
      astate!.cVideo == null? Container():
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
          onVerticalDragStart: ( DragStartDetails dsd ){
            if (astate!.mp_expanded == false){
              setState(() {
                expand_drag_in_progress = true;
                astate!.drag_progress = true;
              });
              scont!.updateState();
            }
          },
          onVerticalDragUpdate: (DragUpdateDetails dud){
            print("mp mini vertical drag dets " + dud.toString());
            if (dud.delta.distance > 0) {
              double new_height  = mp_min_height + (expand_drag_distance - dud.delta.dy);
              if (new_height > mp_min_height) {
                setState(() {
                  expand_drag_distance =
                      expand_drag_distance - dud.delta.dy;
                });
              }
            }
            },
          onVerticalDragEnd: (DragEndDetails){
            if (mp_adj_height > mp_snap_height) {
                  setState(() {
                  astate!.mp_expanded = true;
                  widget.expanded = true;
                  });
                  }
            if (mp_adj_height < mp_snap_height) {
              setState(() {
                astate!.mp_expanded = false;
                widget.expanded = false;
              });
            }
            setState(() {
            expand_drag_in_progress = false;
            expand_drag_distance = 0;
            });
            astate!.drag_progress = false;
            scont!.updateState();

          }
          ,
          child:
      AnimatedSize(
      duration: Duration(milliseconds:500),
          curve: Curves.fastOutSlowIn,
          alignment: Alignment.topCenter,
          child:
              Container(
              width: ss.width,
              height: (widget.expanded == true && expand_drag_in_progress == false) ? mp_adj_height :
              (expand_drag_in_progress) ?mp_adj_height : mp_min_height,
    color: yt_bg_accent_color,
            child: Stack(children:[
              widget.expanded == false?
              AnimatedSize(
                  duration: Duration(milliseconds:500),
                  curve: Curves.fastOutSlowIn,
                  alignment: Alignment.bottomCenter,
                  child:Row(
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
                ],)):Container(),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform(transform:
                    Matrix4(
                      (1 )  ,0,0,0,
                      0,1,0,0,
                      0,0,1,0,
                      0,0,0,1,),
                        alignment: FractionalOffset.center,
                        child:  AnimatedSize(
                            duration: Duration(milliseconds:200),
                            curve: Curves.fastOutSlowIn,
                            alignment: Alignment.bottomCenter,
                            child:Container(

                          width: (widget.expanded == false && expand_drag_in_progress == false)?
                          ss.width * .5 :(expand_drag_in_progress && mp_adj_height < mp_snap_height)?(ss.width/2) +( (mp_adj_height/mp_snap_height) *( ss.width /2)) : ss.width,
                          // color:Colors.blue
                          child:VideoDetailPage(),))),
                  ]),


            ])))
        );
  }
}
