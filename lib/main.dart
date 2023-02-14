import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:yt_clone_webplayer/yt_globals.dart';
import 'package:yt_clone_webplayer/vid_data.dart';
import 'package:yt_clone_webplayer/video_card.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: YTHome(),
      routes:{
        "/video_details": (context){ return VideoDetailPage();},
        "/home": (context){ return YTHome();}
      }
    ));
  }
}



class YTHome extends StatefulWidget {
  const YTHome({Key? key}) : super(key: key);

  @override
  _YTHomeState createState() => _YTHomeState();
}


class _YTHomeState extends State<YTHome> {
  int _nav_selected_idx = 0;
  final _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
        Miniplayer(
          minHeight: ss.height*.09,
          maxHeight: ss.height * .79,
          builder: (height, percentage) => Center(
            child:
            Stack(children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Transform(transform:
                  Matrix4(
                    .5 / (percentage + .5) ,0,0,0,
                    0,1,0,0,
                    0,0,1,0,
                    0,0,0,1,),
                      alignment: FractionalOffset.centerRight,
                      child:Container(
                        width: ss.width*.5,
                        color:Colors.green,
                        child:Text('$height, $percentage'),))
                ],),

            Row(
            mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Transform(transform:
              Matrix4(
                 (percentage + .5 ) / .5 ,0,0,0,
                0,1,0,0,
                0,0,1,0,
                0,0,0,1,),
              alignment: FractionalOffset.center,
              child:Container(
                  width: ss.width*.5,
                  color:Colors.blue)),
  ]),


        ])
          )),
      ],
    ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          setState(() {
            _nav_selected_idx = idx;});
            if (idx == 0){
              Navigator.of(context).pushNamed("/home");
          }
            },
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
            label: 'Profile',
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

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo: FirstScreen')),
      body: Container(
        constraints: BoxConstraints.expand(),
        child:
        Container(height: ss.height * .91,child:CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 60.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final video = homeScreenVideos[index];
                    return VideoCard(video: video);
                  },
                  childCount: homeScreenVideos.length,
                ),
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
