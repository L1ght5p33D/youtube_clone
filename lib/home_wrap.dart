import 'package:flutter/material.dart';
import 'package:yt_clone_webplayer/state/yt_globals.dart';
import 'package:yt_clone_webplayer/home_page.dart';
import 'package:yt_clone_webplayer/vid_screen/video_details_page.dart';
import 'package:yt_clone_webplayer/yt_miniplayer/yt_miniplayer.dart';
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


  @override
  Widget build(BuildContext context) {
    scont = AppStateContainer.of(context);
    astate = scont!.state!;
    ss = MediaQuery.of(context).size;

    print("build home");

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
        YT_Miniplayer(expanded: astate!.mp_expanded , drag_val: 0.0, color: astate!.mp_color)

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
