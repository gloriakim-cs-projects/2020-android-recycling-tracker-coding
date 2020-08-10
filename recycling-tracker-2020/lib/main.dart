import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //google map
import 'package:recycling_tracker_ver_2/services/geolocator_service.dart';
import 'package:url_launcher/url_launcher.dart'; //google map directions
import 'package:geolocator/geolocator.dart'; //location service
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:camera/camera.dart';
//TODO: implement machine learning with camera! https://www.youtube.com/watch?v=cyhuPzAlgUU
//probably capture image and save the image and call the image to sort out

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
        '/camera': (BuildContext context) => new CameraPage(),
        '/locator': (BuildContext context) => new LocatorPage(),
        '/stats': (BuildContext context) => new StatsPage(),
        '/search': (BuildContext context) => new SearchPage(),
        '/goals': (BuildContext context) => new GoalsPage(),
        '/facts': (BuildContext context) => new FactsPage(),
        '/home': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar.getAppBar(context, Colors.white, ''),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: Container(
        //show full-size background
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/light_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        //show icons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  height: 130.0,
                  minWidth: 130.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/camera'),
                  color: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(
                        Icons.photo_camera,
                        size: 60.0,
                        color: Colors.white,
                      ),
                      Text(
                        'CAMERA',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                MaterialButton(
                  height: 130.0,
                  minWidth: 130.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/locator'),
                  color: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 60.0,
                        color: Colors.white,
                      ),
                      Text(
                        'LOCATOR',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  height: 130.0,
                  minWidth: 130.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/stats'),
                  color: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(
                        Icons.assessment,
                        size: 60.0,
                        color: Colors.white,
                      ),
                      Text(
                        'STATS',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                MaterialButton(
                  height: 130.0,
                  minWidth: 130.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/search'),
                  color: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        size: 60.0,
                        color: Colors.white,
                      ),
                      Text(
                        'SEARCH',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  height: 130.0,
                  minWidth: 130.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/goals'),
                  color: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(
                        Icons.flag,
                        size: 60.0,
                        color: Colors.white,
                      ),
                      Text(
                        'GOALS',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                MaterialButton(
                  height: 130.0,
                  minWidth: 130.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () => Navigator.of(context).pushNamed('/facts'),
                  color: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(
                        Icons.announcement,
                        size: 60.0,
                        color: Colors.white,
                      ),
                      Text(
                        'FACTS',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

/* App Bar  */
class MyAppBar {
  static getAppBar(BuildContext context, Color color, String bartitle) {
    return AppBar(
      title: SafeArea(
        child: Center(
          child: Text(bartitle,
              style: TextStyle(
                  fontSize: 55.0,
                  fontFamily: 'Rajdhani',
                  fontWeight: FontWeight.w700,
                  color: color)),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.widgets,
            color: color,
          ),
          tooltip: 'Home Page',
          //show side pages
          onPressed: () => Navigator.of(context).pushNamed('/home'),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}

/* Drawer */
class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //add a ListView (just in case there isn't enough vertical space)
      child: SafeArea(
        child: ListView(
          //Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Rajdhani',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                '   Light Mode',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Rajdhani',
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                '   Dark Mode',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Rajdhani',
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Rajdhani',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                '   Privacy Policy',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Rajdhani',
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                '   Terms of Policy',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Rajdhani',
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                '   Credits',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Rajdhani',
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* CAMERA */
class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

/* LOCATOR */
class LocatorPage extends StatefulWidget {
  @override
  _LocatorPageState createState() => _LocatorPageState();
}

class _LocatorPageState extends State<LocatorPage> {
  final locatorService = GeoLocatorService();

  @override
  Widget build(BuildContext context) {
//TODO:     final currentPosition = Provider.of<Position>(context);
//26:19 https://www.youtube.com/watch?v=Dme03oxZRU0

    return FutureProvider(
      create: (context) => locatorService.getLocation(),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(33.2075, 97.1526),
                  zoom: 16.0,
                ),
                zoomGesturesEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* STAT */
class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar.getAppBar(context, Colors.white, ''),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: Container(
        //show full-size background
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/light_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        //show icons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('images/ic_sun_recycle.png'),
                Text(
                  '15',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70.0,
                      fontFamily: 'Rajdhani',
                      color: Colors.white),
                ),
                Positioned(
                  bottom: 80.0,
                  child: new Text(
                    'ITEMS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        fontFamily: 'Rajdhani',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1033 kWh',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60.0,
                            fontFamily: 'Rajdhani',
                            color: Colors.white),
                      ),
                      Text(
                        'Power Saved',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            color: Colors.white60),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_upward,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '10%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60.0,
                            fontFamily: 'Rajdhani',
                            color: Colors.white),
                      ),
                      Text(
                        'From Last Week',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'Rajdhani',
                            color: Colors.white60),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

/* SEARCH */
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryIconTheme: IconThemeData(color: Colors.grey)),
      child: Scaffold(
        appBar: MyAppBar.getAppBar(context, Colors.grey, ''),
        //show background behind the app bar
        extendBodyBehindAppBar: true,
        body: Container(),
        drawer: MyDrawer(),
      ),
    );
  }
}

/* GOALS*/
class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryIconTheme: IconThemeData(color: Colors.grey)),
      child: Scaffold(
        appBar: MyAppBar.getAppBar(context, Colors.grey, 'GOALS'),
        //show background behind the app bar
        extendBodyBehindAppBar: true,
        body: Container(),
        drawer: MyDrawer(),
      ),
    );
  }
}

/* FACTS */
//TODO:add different pages for tabs
//TODO:change drawer color
class FactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightThemeGrey(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabAppBar(context, 'FACTS', 'LEARN', 'NEWS'),
          //show background behind the app bar
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: <Widget>[
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
                SizedBox(height: 8.0),
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
                SizedBox(height: 8.0),
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
                SizedBox(height: 8.0),
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
                SizedBox(height: 8.0),
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
                SizedBox(height: 8.0),
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
                SizedBox(height: 8.0),
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
                SizedBox(height: 8.0),
                MyFacts(context, 'PLASTIC', 'THE MOST UNRECYCLED',
                    'light_background'),
              ],
            ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}

/* Tab Bar */
AppBar TabAppBar(
    BuildContext context, String bartitle, String tab1, String tab2) {
  return AppBar(
    bottom: TabBar(
      tabs: [
        Tab(
          child: Text(
            tab1,
            style: LightThemeGrey().tabBarTheme.labelStyle,
          ),
        ),
        Tab(
          child: Text(
            tab2,
            style: LightThemeGrey().tabBarTheme.labelStyle,
          ),
        ),
      ],
    ),
    title: SafeArea(
      child: Center(
        child: Text(bartitle),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.widgets,
          color: Colors.black54,
        ),
        tooltip: 'Home Page',
        //show side pages
        onPressed: () => Navigator.of(context).pushNamed('/home'),
      ),
    ],
  );
}

/* Theme */
ThemeData LightThemeGrey() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(
              fontFamily: 'Rajdhani',
              fontSize: 55.0,
              fontWeight: FontWeight.w700,
              color: Colors.black54),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: TextStyle(
            fontFamily: 'Rajdhani',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.black54),
      ),
      indicatorColor: Colors.black54,
      scaffoldBackgroundColor: Colors.white,
      //TODO: Change the text later for detailed information
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: 'Rajdhani', fontSize: 25.0, color: Colors.grey),
          bodyText1: TextStyle(
              fontFamily: 'Rajdhani', fontSize: 19.0, color: Colors.red),
          bodyText2: TextStyle(
              fontFamily: 'Rajdhani', fontSize: 10.0, color: Colors.grey)));
}

/* FACTS - Image Button Container */
Container MyFacts(
    BuildContext context, String topic, String description, String image) {
  return Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
          image: AssetImage("images/$image.png"), fit: BoxFit.cover),
      // button text
    ),
    child: MaterialButton(
      onPressed: () => Navigator.of(context).pushNamed('/camera'),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                topic,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
              Text(
                description,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.keyboard_arrow_right,
            size: 60.0,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
