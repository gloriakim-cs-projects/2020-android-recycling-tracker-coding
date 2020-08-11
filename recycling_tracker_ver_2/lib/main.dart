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
import 'package:dots_indicator/dots_indicator.dart'; //bottom dot indicator

List<String> recyclable = [
  "Plastic",
  "Papers",
  "Glass",
  "Cardboard",
  "Aluminum",
  "Steel",
  "Juice Boxes",
  "Detergent",
];

List<String> recyclable_description = [
  'THE LEAST RECYCLED',
  'THE MOST USED',
  'THE LEAST DONATED',
  'THE UNFORGOTTEN PART',
  'THE 123',
  '456',
  '789',
  '101',
  '231',
];

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
        '/home': (BuildContext context) => new MyHomePage(),
        '/camera': (BuildContext context) => new CameraPage(),
        '/locator': (BuildContext context) => new LocatorPage(),
        '/stats': (BuildContext context) => new StatsPage(),
        '/search': (BuildContext context) => new SearchPage(),
//        '/goals': (BuildContext context) => new GoalsPage(),
        '/facts': (BuildContext context) => new FactsPage(),
        '/factsDetails': (BuildContext context) => new PageViewDemo(),
        '/goals': (BuildContext context) => new Example(),
      },
    );
  }
}

/* App Bar  */
class MyAppBar {
  static getAppBar(BuildContext context, Color color, String bartitle) {
    return AppBar(
      iconTheme: new IconThemeData(color: color),
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

/* App Bar (Tab) */
AppBar MyTabAppBar(
    BuildContext context, String bartitle, String tab1, String tab2) {
  return AppBar(
    iconTheme: new IconThemeData(color: Colors.black54),
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

/* App Bar (FACTS Details) */
AppBar MyAppBarDetails(BuildContext context, String bartitle) {
  return AppBar(
    title: SafeArea(
      child: Center(
        child: Text(bartitle,
            style: TextStyle(
                fontSize: 55.0,
                fontFamily: 'Rajdhani',
                fontWeight: FontWeight.w700,
                color: Colors.black54)),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.black54,
        ),
        tooltip: 'Close',
        //show side pages
        onPressed: () => Navigator.of(context).pushNamed('/facts'),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

/* Each PageViewer(FACTS Details)'s Content */
Column PageWidgetContent(BuildContext context, String image, String title,
    String description, double pos, String buttonText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      //full image
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
        child: Container(
          width: 120,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('images/$image.png'), fit: BoxFit.cover),
          ),
        ),
      ),
      //description
      //TODO: ListView?
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        child: Text(
          '$title',
          style: LightThemeGrey().textTheme.headline1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
        child: Text(
          '$description',
          style: LightThemeGrey().textTheme.bodyText1,
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: new DotsIndicator(
              dotsCount: 3,
              position: pos,
              decorator: DotsDecorator(
                color: Colors.grey, // Inactive color
                activeColor: Colors.black54,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        ),
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
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: 'Rajdhani',
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        fontFamily: 'Rajdhani',
        fontSize: 22.0,
        color: Colors.black,
      ),
    ),
  );
}

/* Image Button Container (FACTS) */
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
      //TODO: need to change the name to transit based on the content (probably use array)
      onPressed: () => Navigator.of(context).pushNamed('/factsDetails'),
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center, //위아래로 센터 맞춤
            crossAxisAlignment: CrossAxisAlignment.start, //왼쪽으로 붙음
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //위아래로 센터 맞춤
              crossAxisAlignment: CrossAxisAlignment.end, //오른쪽으로 붙음
              children: [
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 60.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/* HOME */
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
class FactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightThemeGrey(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MyTabAppBar(context, 'FACTS', 'LEARN', 'NEWS'),
          //show background behind the app bar
          extendBodyBehindAppBar: true,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: SafeArea(
              child: TabBarView(
                children: [
                  ListView(
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
                  //TODO: Add news
                  Icon(Icons.directions_transit)
                ],
              ),
            ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}

/* FACTS - Details/Descriptions */
//TODO: Pass variable from clicked FACTS to show in PageView's pages.
class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MyPage1Widget(),
        MyPage2Widget(),
        MyPage3Widget(),
      ],
    );
  }
}

class MyPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarDetails(context, 'PLASTIC'),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: PageWidgetContent(
            context,
            'light_background',
            'Bring Your Own Bag',
            'We produce more than 280 million tons of plastics. That’s about ten stone mountains every day!',
            0.0,
            'Next'),
      ),
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarDetails(context, 'PLASTIC'),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: PageWidgetContent(
            context, 'light_background', '123', 'Easy as ABC!', 1.0, 'Next'),
      ),
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarDetails(context, 'PLASTIC'),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: PageWidgetContent(
            context, 'light_background', 'ABC', 'Easy as 123!', 2.0, 'Close'),
      ),
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
      data: LightThemeGrey(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MyAppBar.getAppBar(context, Colors.black54, 'SEARCH'),
          //show background behind the app bar
          extendBodyBehindAppBar: true,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: SafeArea(
              child: ListView(
                children: <Widget>[
                  MyFacts(context, recyclable[0], recyclable_description[0],
                      'light_background'),
                  SizedBox(height: 8.0),
                  MyFacts(context, recyclable[1], recyclable_description[1],
                      'light_background'),
                  SizedBox(height: 8.0),
                  MyFacts(context, recyclable[2], recyclable_description[2],
                      'light_background'),
                  SizedBox(height: 8.0),
                  MyFacts(context, recyclable[3], recyclable_description[3],
                      'light_background'),
                  SizedBox(height: 8.0),
                  MyFacts(context, recyclable[4], recyclable_description[4],
                      'light_background'),
                  SizedBox(height: 8.0),
                  MyFacts(context, recyclable[5], recyclable_description[5],
                      'light_background'),
                  SizedBox(height: 8.0),
                  MyFacts(context, recyclable[6], recyclable_description[6],
                      'light_background'),
                  SizedBox(height: 8.0),
                  MyFacts(context, recyclable[7], recyclable_description[7],
                      'light_background'),
                ],
              ),
            ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

//TODO: remove this example after completing the work
class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}
