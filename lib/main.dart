import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:yt_clone_webplayer/yt_globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YT Clone Webplayer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YTHome(),
    );
  }
}

class YTHome extends StatefulWidget {
  const YTHome({Key? key}) : super(key: key);

  @override
  _YTHomeState createState() => _YTHomeState();
}

final _navigatorKey = GlobalKey();

class _YTHomeState extends State<YTHome> {
  @override
  Widget build(BuildContext context) {
    ss = MediaQuery.of(context).size;

    double x  = 0;

    return Scaffold(
      body:
    Stack(
      children: <Widget>[
        Navigator(
          key: _navigatorKey,
          onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) => FirstScreen(),
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
                    0,0,0,1,)..rotateX(x),
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
                0,0,0,1,)..rotateX(x),
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
        currentIndex: 0,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.av_timer_sharp),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: 'Library',
          )
        ],
      ),);
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo: FirstScreen')),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              ),
              child: const Text('Open SecondScreen'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(builder: (context) => ThirdScreen()),
              ),
              child: const Text('Open ThirdScreen with root Navigator'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo: SecondScreen')),
      body: Center(child: Text('SecondScreen')),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo: ThirdScreen')),
      body: Center(child: Text('ThirdScreen')),
    );
  }
}