import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/home_page.dart';
import 'package:yt_clone_webplayer/vid_screen/video_details_page.dart';
import 'package:yt_clone_webplayer/state/yt_state.dart';
import 'package:yt_clone_webplayer/state/AppStateModel.dart';

class YTHome extends StatefulWidget {
  const YTHome({Key? key}) : super(key: key);

  @override
  _YTHomeState createState() => _YTHomeState();
}


class _YTHomeState extends State<YTHome> {
  int _nav_selected_idx = 0;
  final _navigatorKey = GlobalKey();

  AppStateContainerState? scont;
  AppState? astate;

  MiniplayerController mp_controller = MiniplayerController();

  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    astate!.mp_controller = mp_controller;
    ss = MediaQuery.of(context).size;

    return Scaffold(
      body:
      Stack(
        children: <Widget>[
          Navigator(
            key: _navigatorKey,
            onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) => HomeList(),
            ),
          ),
          astate!.cVideo != null?
          Miniplayer(
              minHeight: astate!.cVideo == null? 0.0: ss.height*.09,
              maxHeight: ss.height * .88 ,
              controller: mp_controller,
              builder: (height, percentage) => Center(
                  child:
                  Stack(children:[
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
                            color:Colors.green,
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
                            (percentage )  ,0,0,0,
                            0,1,0,0,
                            0,0,1,0,
                            0,0,0,1,),
                              alignment: FractionalOffset.center,
                              child: Container(
                                  width: ss.width * .5,
                                  // color:Colors.blue
                              child:VideoDetailPage(),)),
                        ]),


                  ])
              )): Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          setState(() {
            _nav_selected_idx = idx;});
          if (idx == 0){
            Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
          }
        },
        selectedItemColor: Theme.of(context).textTheme.titleMedium!.color,
        currentIndex: _nav_selected_idx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: Theme.of(context).textTheme.titleMedium!.color,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.av_timer_sharp,
              color: Theme.of(context).textTheme.titleMedium!.color,),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,
              color: Theme.of(context).textTheme.titleMedium!.color,),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined,
              color: Theme.of(context).textTheme.titleMedium!.color,),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined,
              color: Theme.of(context).textTheme.titleMedium!.color,),
            label: 'Library',
          )
        ],
      ),);
  }
}
