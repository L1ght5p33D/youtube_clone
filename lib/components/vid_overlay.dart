import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

class VidOverlay extends StatefulWidget {
  VidOverlay({Key? key}) : super(key: key);

  @override
  _VidOverlayState createState() => _VidOverlayState();
}

class _VidOverlayState extends State<VidOverlay> {
  bool autoplayOn = true;

  AppStateContainerState? scont;
  AppState? astate;

  // drag update drag dist
  double dud_dist = 0.0;

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    return Positioned(
      // top: ss.width*.01,
        child:
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width:ss.width*.5,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            astate!.mp_expanded = true;
                          });
                          scont!.updateState();
                          Future.delayed(Duration(milliseconds: 100),() {
                            setState(() {
                              astate!.mp_expanded = false;
                            });
                            scont!.updateState();
                          });
                        },
                          onVerticalDragUpdate: (DragUpdateDetails dud){
                          print("drag update delta ~ " + dud.toString());
                          print("drag update primary delta~ " + dud.primaryDelta.toString());

                          dud_dist = dud_dist + dud.delta.distance;
                            // astate!.mp_expanded = false;
                            astate!.mp_drag_dist = astate!.mp_drag_dist + dud.delta.distance;
                          astate!.drag_progress = true;
                          scont!.updateState();

                          },
                          onVerticalDragEnd: ( DragEndDetails ded ){
                            Future.delayed(Duration(milliseconds: 100),() {
                              setState(() {
                                astate!.mp_drag_dist = 0.0;
                                astate!.drag_progress = false;
                              });
                              scont!.updateState();
                            });
                          },

                          onPanStart:(DragStartDetails dsd){
                          print("pan start dsd" + dsd.toString());
                          },

                          onPanUpdate:(DragUpdateDetails du_dets){
                            print("vdu dets ~ " + du_dets.toString());
                          //     if (du_dets.globalPosition.distance > 2) {
                          //       setState(() {
                          //       // astate!.mp_expanded = false;
                          //       astate!.mp_drag_dist =
                          //       du_dets.globalPosition.distance;
                          //       });
                          // }
                        },
                        onVerticalDragDown: (DragDownDetails dd_dets){
                          print("vdd dets ~ " + dd_dets.toString());
                          // if (dd_dets.globalPosition.distance > 15) {
                          //   setState(() {
                          //     // astate!.mp_expanded = false;
                          //     astate!.mp_drag_dist =
                          //         dd_dets.globalPosition.distance;
                          //   });
                          // }
                          if (dd_dets.localPosition.distance > 55) {
                            setState(() {
                              astate!.mp_expanded = false;
                            });
                            scont!.updateState();
                          }

                          // Future.delayed(Duration(milliseconds: 100),() {
                          //
                          //   scont!.updateState();
                          // });
                          // scont!.updateState();


                        },
                      child:Icon(Icons.keyboard_arrow_down)),
                    ],)),

              Container(
                  width:ss.width*.5,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: ss.width*.08,
                          // width: 50,
                          child:
                          Switch.adaptive(
                            value: autoplayOn,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                autoplayOn = value;
                              });
                            },
                            activeTrackColor: Colors.white,
                            activeColor: Colors.white70,
                          )),
                      Icon(Icons.wifi_tethering_sharp),
                      Icon(Icons.closed_caption_outlined),
                      Icon(Icons.settings_outlined)


                    ],)),
            ]));
  }
}