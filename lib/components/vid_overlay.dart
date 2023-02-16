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

                        onVerticalDragDown: (DragDownDetails dd_dets){
                          print("vdd");
                              astate!.mp_controller!.animateToHeight(height: 0.0);
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