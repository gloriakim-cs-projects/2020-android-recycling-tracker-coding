import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:recycling_app/screens/camera_page.dart';
import 'package:recycling_app/screens/search_page.dart';
import 'package:recycling_app/screens/stat_page.dart';
import 'package:recycling_app/screens/home_page.dart';

//TODO: before publish, make sure all functiosn are used. How? search for the function/classes's name. if there is only one found (the function itsef) ,then remove it.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Recycling Tracker',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/HOME': (BuildContext context) => new MyHomePage(),
        '/CAMERA': (BuildContext context) => new CameraPage(),
//        '/LOCATOR': (BuildContext context) => new LocatorPage(),
        '/STATS': (BuildContext context) => new StatsPage(),
        '/SEARCH': (BuildContext context) => new SearchPage(),
        //TODO: Remove it if not used
//        '/GOALS': (BuildContext context) => new GoalsPage(),
//        '/EVENTS': (BuildContext context) => new EventsPage(),
//        '/goalsDetails': (BuildContext context) => new PageViewDemo(),
      },
    );
  }
}
