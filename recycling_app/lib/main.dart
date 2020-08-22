import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//bottom dot indicator
import 'package:dots_indicator/dots_indicator.dart';
//log
import 'dart:io';
//camera libraries
import 'package:provider/provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
//tflite
import 'package:tflite/tflite.dart';
//locator
//import 'package:recycling_tracker_2020/search.dart';
import 'package:provider/provider.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
////google map

//import 'package:url_launcher/url_launcher.dart'; //google map directions
//import 'package:geolocator/geolocator.dart'; //location service

//TODO: before publish, make sure all functiosn are used. How? search for the function/classes's name. if there is only one found (the function itsef) ,then remove it.

class Recyclable {
  final String title;
  final String description;
  final String instruction;
  final String why;
  final String
      recycle; //put either "recyclable" or "not recyclable" (This item "can be recycled")
  final String
      donate; //put either "can be donated" or "cannot be donated" (This item "can be donated")

  Recyclable(this.title, this.description, this.instruction, this.why,
      this.recycle, this.donate);
}

String stringRecycle = 'can be recycled';
String stringNonRecycle = 'cannot be recycled';
String stringDonate = 'can be donated';
String stringNonDonate = 'cannot be donated';

String instRecyclable =
    'Put this item in your blue recycling cart or recycling dumpster. Please make sure items are empty, clean, dry, and loose (no plastic bags).';
String instHouseholdHazardWaste =
    'Please drop-off at this item at the listed location for safe disposal. Proof of residency required.';
String instNote =
    'Important message regarding COVID-19: Due to ongoing changes to prevent the spread of COVID-19, some locations and services may have temporarily closed or modified operations. Please call before driving.';

//TODO: complete the array

List<Recyclable> recyclable = [
  Recyclable('AEROSOL CAN', '(EMPTY)', instRecyclable, '', stringRecycle,
      stringNonDonate),
  Recyclable('AEROSOL CAN', '(FULL OR PARTIALLY FULL)', '', '', '', ''),
  Recyclable('ANIMAL BEDDING', '', '', '', '', ''),
  Recyclable('ANTIFREEZE', '', '', '', '', ''),
  Recyclable('ASEPTIC CARTON', '', '', '', '', ''),
  Recyclable('BAG', '(PLASTIC)', '', '', '', ''),
  Recyclable('BAKED GOODS', '', '', '', '', ''),
  Recyclable('BAKING TRAY', '(ALUMINUM)', '', '', '', ''),
  Recyclable('BALLOON', '', '', '', '', ''),
  Recyclable('BARBEQUE GRILL', '', '', '', '', ''),
  Recyclable('BARBEQUE', '', '', '', '', ''),
  Recyclable('BASKETBALL HOOP', '', '', '', '', ''),
  Recyclable('BATTERY', '(DISPOSABLE)', '', '', '', ''),
  Recyclable('BATTERY', '(RECHARGEABLE)', '', '', '', ''),
  Recyclable('BED FRAME', '(METAL)', '', '', '', ''),
  Recyclable('BED FRAME', '(WOODEN)', '', '', '', ''),
  Recyclable('BEVERAGE BOTTLE', '(GLASS)', '', '', '', ''),
  Recyclable('BEVERAGE BOTTLE', '(PLASTIC)', '', '', '', ''),
  Recyclable('BEVERAGE CAN', '(ALUMINUM)', '', '', '', ''),
  Recyclable('BLANKET', '', '', '', '', ''),
  Recyclable('BLEACH', '', '', '', '', ''),
  Recyclable('BLINDS', '', '', '', '', ''),
  Recyclable('BOOK', '(HARD COVER)', '', '', '', ''),
  Recyclable('BOOK', '(SOFT COVER)', '', '', '', ''),
  Recyclable('BOOKSHELF', '', '', '', '', ''),
  Recyclable('BOTTLE', '(CERAMIC)', '', '', '', ''),
  Recyclable('BOTTLE', '(GLASS)', '', '', '', ''),
  Recyclable('BOTTLE', '(PLASTIC)', '', '', '', ''),
  Recyclable('BOTTLE CAP', '(PLASTIC)', '', '', '', ''),
  Recyclable('BOX', '(CARDBOARD)', '', '', '', ''),
  Recyclable('BREAD', '', '', '', '', ''),
  Recyclable('BRUSH', '', '', '', '', ''),
  Recyclable('BUBBLE WRAP', '', '', '', '', ''),
  Recyclable('BUTANE FUEL', '', '', '', '', ''),
  Recyclable('CACTUS', '', '', '', '', ''),
  Recyclable('CALCULATOR', '', '', '', '', ''),
  Recyclable('CAMERA', '', '', '', '', ''),
  Recyclable('CANDLE JARS', '', '', '', '', ''),
  Recyclable('CANDY WRAPPERS', '', '', '', '', ''),
  Recyclable('CANDY', '', '', '', '', ''),
  Recyclable('CARDBOARD', '', '', '', '', ''),
  Recyclable('CAT TOWER', '', '', '', '', ''),
  Recyclable('CD DISC', '', '', '', '', ''),
  Recyclable('CEILING FAN', '', '', '', '', ''),
  Recyclable('CELLPHONE', '', '', '', '', ''),
  Recyclable('CERAMICS', '(BROKEN)', '', '', '', ''),
  Recyclable('CERAMICS', '', '', '', '', ''),
  Recyclable('CEREAL BOX LINERS', '', '', '', '', ''),
  Recyclable('CEREAL', '', '', '', '', ''),
  Recyclable('CHAIR', '', '', '', '', ''),
  Recyclable('CHARGER', '', '', '', '', ''),
  Recyclable('CHEESE', '', '', '', '', ''),
  Recyclable('CHICKEN', '(INCLUDING BONES)', '', '', '', ''),
  Recyclable('CHIP BAG', '', '', '', '', ''),
  Recyclable('CHRISTMAS DECORATIONS', '', '', '', '', ''),
  Recyclable('CHRISTMAS TREE', '(ARTIFICIAL)', '', '', '', ''),
  Recyclable('CHRISTMAS TREE', '(NATURAL)', '', '', '', ''),
  Recyclable('CLOTHES', '', '', '', '', ''),
  Recyclable('COFFEE CUP TRAY', '(PLASTIC)', '', '', '', ''),
  Recyclable('COFFEE CUP TRAY', '(WOODEN)', '', '', '', ''),
  Recyclable('COFFEE FILTERS', '', '', '', '', ''),
  Recyclable('COFFEE GROUND', '', '', '', '', ''),
  Recyclable('COFFEE MACHINE', '', '', '', '', ''),
  Recyclable('COLD PACK', '', '', '', '', ''),
  Recyclable('COMPUTER', '', '', '', '', ''),
  Recyclable('COOKIE TIN', '', '', '', '', ''),
  Recyclable('COOKING OIL', '', '', '', '', ''),
  Recyclable('COOKING POT', '(ALUMINUM)', '', '', '', ''),
  Recyclable('COOKING POT', '(CERAMIC)', '', '', '', ''),
  Recyclable('COOKING POT', '(FIBERGLASS)', '', '', '', ''),
  Recyclable('COOKING POT', '(GLASS)', '', '', '', ''),
  Recyclable('CORRUGATED CARTON', '', '', '', '', ''),
  Recyclable('COSMETICS', '', '', '', '', ''),
  Recyclable('COTTON BALL', '', '', '', '', ''),
  Recyclable('COTTON PAD', '', '', '', '', ''),
  Recyclable('COTTON SWAB', '', '', '', '', ''),
  Recyclable('CUP', '(CERAMIC)', '', '', '', ''),
  Recyclable('CUP', '(PAPER)', '', '', '', ''),
  Recyclable('CUP', '(PLASTIC)', '', '', '', ''),
  Recyclable('CUP', '(STYROFOAM)', '', '', '', ''),
  Recyclable('CUP LID', '(PLASTIC)', '', '', '', ''),
  Recyclable('CUTLERY', '(PLASTIC)', '', '', '', ''),
  Recyclable('CUTLERY', '(WOOD)', '', '', '', ''),
  Recyclable('DAIRY PRODUCTS', '', '', '', '', ''),
  Recyclable('DESK', '', '', '', '', ''),
  Recyclable('DESKTOP COMPUTER', '', '', '', '', ''),
  Recyclable('DETERGENT BOTTLE', '(PLASTIC)', '', '', '', ''),
  Recyclable('DOG FOOD BAG', '', '', '', '', ''),
  Recyclable('DOG KENNEL', '', '', '', '', ''),
  Recyclable('DRYER LINT', '', '', '', '', ''),
  Recyclable('DRYER SHEET', '', '', '', '', ''),
  Recyclable('DUMBELL', '', '', '', '', ''),
  Recyclable('DVD PLAYER', '', '', '', '', ''),
  Recyclable('EARPHONES', '', '', '', '', ''),
  Recyclable('EGG CARTON', '(PAPER)', '', '', '', ''),
  Recyclable('EGG CARTON', '(STYROFOAM)', '', '', '', ''),
  Recyclable('EGG SHELL', '', '', '', '', ''),
  Recyclable('EGG', '', '', '', '', ''),
  Recyclable('ELECTRONICS', '', '', '', '', ''),
  Recyclable('ENVELOPE', '(PADDED)', '', '', '', ''),
  Recyclable('ENVELOPE', '(WITH PLASTIC WINDOW)', '', '', '', ''),
  Recyclable('ENVELOPE', '', '', '', '', ''),
  Recyclable('ERASER', '', '', '', '', ''),
  Recyclable('E-READER', '', '', '', '', ''),
  Recyclable('EXERCISE EQUIPMENT', '', '', '', '', ''),
  Recyclable('FABRIC SOFTENER', '', '', '', '', ''),
  Recyclable('FACIAL TISSUES', '', '', '', '', ''),
  Recyclable('FIGURINES', '', '', '', '', ''),
  Recyclable('FILE CABINET', '', '', '', '', ''),
  Recyclable('FIRE EXTINGUISHER', '', '', '', '', ''),
  Recyclable('FISH', '(INCLUDING BONES)', '', '', '', ''),
  Recyclable('FLOSS', '', '', '', '', ''),
  Recyclable('FLUORESCENT BULB', '(CFL)', '', '', '', ''),
  Recyclable('FLYERS', '', '', '', '', ''),
  Recyclable('FOAM', '(POLYSTYRENE)', '', '', '', ''),
  Recyclable('FOIL', '(ALUMINUM)', '', '', '', ''),
  Recyclable('FOLDER', '', '', '', '', ''),
  Recyclable('FOOD CAN', '(ALUMINUM)', '', '', '', ''),
  Recyclable('FOOD SCRAPS', '', '', '', '', ''),
  Recyclable('FREEZER', '', '', '', '', ''),
  Recyclable('FRUIT', '', '', '', '', ''),
  Recyclable('FRYING PANS', '', '', '', '', ''),
  Recyclable('FURNITURE', '', '', '', '', ''),
  Recyclable('GLASS', '(BROKEN)', '', '', '', ''),
  Recyclable('GLASSES', '', '', '', '', ''),
  Recyclable('GRAINS', '', '', '', '', ''),
  Recyclable('HAIR DRYER', '', '', '', '', ''),
  Recyclable('HAIRBRUSH', '', '', '', '', ''),
  Recyclable('HANGER', '(METAL)', '', '', '', ''),
  Recyclable('HANGER', '(PLASTIC)', '', '', '', ''),
  Recyclable('HANGER', '(WOOD)', '', '', '', ''),
  Recyclable('HOUSEHOLD CLEANER', '', '', '', '', ''),
  Recyclable('HOUSEPLANTS', '', '', '', '', ''),
  Recyclable('HUMAN HAIR', '', '', '', '', ''),
  Recyclable('ICE CREAM CARTON', '(PAPER)', '', '', '', ''),
  Recyclable('ICE CREAM CARTON', '(PLASTIC)', '', '', '', ''),
  Recyclable('ICE CREAM CARTON', '(STYROFOAM)', '', '', '', ''),
  Recyclable('IRONING BOARD', '', '', '', '', ''),
  Recyclable('JAR', '(CERAMIC)', '', '', '', ''),
  Recyclable('JAR', '(GLASS)', '', '', '', ''),
  Recyclable('JAR', '(PLASTIC)', '', '', '', ''),
  Recyclable('JUICE BOX', '', '', '', '', ''),
  Recyclable('JUICE OR DRINKING POUCH', '', '', '', '', ''),
  Recyclable('KITCHEN KNIVES', '', '', '', '', ''),
  Recyclable('LAMP', '', '', '', '', ''),
  Recyclable('LAPTOP', '', '', '', '', ''),
  Recyclable('LIGHT BULB', '(NOT CFL)', '', '', '', ''),
  Recyclable('MAGAZINE', '', '', '', '', ''),
  Recyclable('MAKE-UP SPONGE', '', '', '', '', ''),
  Recyclable('MASK', '', '', '', '', ''),
  Recyclable('MATTRESS COVERS', '', '', '', '', ''),
  Recyclable('MATTRESS', '', '', '', '', ''),
  Recyclable('MEAT', '(INCLUDING BONES)', '', '', '', ''),
  Recyclable('MEDICAL WASTE', '', '', '', '', ''),
  Recyclable('MEDICINE', '(PRESCRIPTION & OVER-THE-COUNTER)', '', '', '', ''),
  Recyclable('METAL CAPS', '(FROM GLASS JARS)', '', '', '', ''),
  Recyclable('MICROWAVE', '', '', '', '', ''),
  Recyclable('MILK JUG', '(PLASTIC)', '', '', '', ''),
  Recyclable('MIRROR', '', '', '', '', ''),
  Recyclable('MONITOR', '', '', '', '', ''),
  Recyclable('NAIL CLIPPER', '', '', '', '', ''),
  Recyclable('NAIL POLISH', '', '', '', '', ''),
  Recyclable('NEWSPAPER', '', '', '', '', ''),
  Recyclable('NUT & SHELL', '', '', '', '', ''),
  Recyclable('PAPER', '(LAMINATED)', '', '', '', ''),
  Recyclable('PAPER', '(NON-LAMINATED)', '', '', '', ''),
  Recyclable('PAPER', '(SHREDDED)', '', '', '', ''),
  Recyclable('PAPER CLIPS', '', '', '', '', ''),
  Recyclable('PAPER NAPKINS', '', '', '', '', ''),
  Recyclable('PAPER SHREDDER', '', '', '', '', ''),
  Recyclable('PAPER TOWEL ROLL', '', '', '', '', ''),
  Recyclable('PARCHMENT PAPER', '', '', '', '', ''),
  Recyclable('PASTA', '', '', '', '', ''),
  Recyclable('PEN', '', '', '', '', ''),
  Recyclable('PICTURE FRAME', '', '', '', '', ''),
  Recyclable('PIE PLATE', '(ALUMINUM)', '', '', '', ''),
  Recyclable('PILL BOTTLE', '(EMPTY)', '', '', '', ''),
  Recyclable('PILLOW', '', '', '', '', ''),
  Recyclable('PITCHER', '(CERAMIC)', '', '', '', ''),
  Recyclable('PITCHER', '(GLASS)', '', '', '', ''),
  Recyclable('PITCHER', '(PLASTIC)', '', '', '', ''),
  Recyclable('PIZZA BOX', '(EMPTY, NO FOOD RESIDUE)', '', '', '', ''),
  Recyclable('PIZZA BOX', '(GREASY)', '', '', '', ''),
  Recyclable('PIZZA', '', '', '', '', ''),
  Recyclable('PLANT POTS', '(PLASTIC)', '', '', '', ''),
  Recyclable('PLATE', '(CERAMIC)', '', '', '', ''),
  Recyclable('PLATE', '(GLASS)', '', '', '', ''),
  Recyclable('PLATE', '(PAPER)', '', '', '', ''),
  Recyclable('PLATE', '(PLASTIC)', '', '', '', ''),
  Recyclable('POPCORN BAG', '', '', '', '', ''),
  Recyclable('POPCORN', '', '', '', '', ''),
  Recyclable('POPSICLE STICKS', '', '', '', '', ''),
  Recyclable('PRINTER', '', '', '', '', ''),
  Recyclable('PUMPKIN', '', '', '', '', ''),
  Recyclable('RACKET', '', '', '', '', ''),
  Recyclable('RECEIPT', '', '', '', '', ''),
  Recyclable('REFRIGERATOR', '', '', '', '', ''),
  Recyclable('RIBBON & BOW', '', '', '', '', ''),
  Recyclable('RUG', '', '', '', '', ''),
  Recyclable('SATELLITE DISH', '', '', '', '', ''),
  Recyclable('SAUCE BOTTLE (PLASTIC)', '', '', '', '', ''),
  Recyclable('SAUCE & SYRUP', '', '', '', '', ''),
  Recyclable('SCISSORS', '', '', '', '', ''),
  Recyclable('SHELLFISH', '', '', '', '', ''),
  Recyclable('SHOE BOX', '', '', '', '', ''),
  Recyclable('SHOES', '(PAIRED)', '', '', '', ''),
  Recyclable('SHUTTLECOCK', '', '', '', '', ''),
  Recyclable('SILVERWARE', '', '', '', '', ''),
  Recyclable('SLEEPING BAG', '', '', '', '', ''),
  Recyclable('SMOKE DETECTOR', '', '', '', '', ''),
  Recyclable('SOAP BOTTLE', '(PLASTIC)', '', '', '', ''),
  Recyclable('STEEL', '', '', '', '', ''),
  Recyclable('STERNO', '', '', '', '', ''),
  Recyclable('STICKS & TWIGS', '', '', '', '', ''),
  Recyclable('STICKY NOTE', '', '', '', '', ''),
  Recyclable('STORAGE CONTAINER', '', '', '', '', ''),
  Recyclable('STRAW', '(METAL)', '', '', '', ''),
  Recyclable('STRAW', '(PLASTIC)', '', '', '', ''),
  Recyclable('STRING & TWINE', '', '', '', '', ''),
  Recyclable('STYROFOAM', '', '', '', '', ''),
  Recyclable('SUITCASE', '', '', '', '', ''),
  Recyclable('SUNSCREEN', '', '', '', '', ''),
  Recyclable('SURGE PROTECTOR', '', '', '', '', ''),
  Recyclable('TABLE FAN', '', '', '', '', ''),
  Recyclable('TABLE', '', '', '', '', ''),
  Recyclable('TABLET', '', '', '', '', ''),
  Recyclable('TAKE-OUT CONTAINER', '', '', '', '', ''),
  Recyclable('TEABAG', '', '', '', '', ''),
  Recyclable('TELEVISION', '', '', '', '', ''),
  Recyclable('TEXTILE', '', '', '', '', ''),
  Recyclable('TISSUE PAPER', '', '', '', '', ''),
  Recyclable('TOILET PAPER ROLL', '', '', '', '', ''),
  Recyclable('TOILET PAPER', '', '', '', '', ''),
  Recyclable('TOOTHBRUSH', '(PLASTIC)', '', '', '', ''),
  Recyclable('TOOTHPICKS', '', '', '', '', ''),
  Recyclable('TOWEL', '', '', '', '', ''),
  Recyclable('TRASH CAN', '', '', '', '', ''),
  Recyclable('TROPHY', '', '', '', '', ''),
  Recyclable('UMBRELLA', '', '', '', '', ''),
  Recyclable('USB FLASH DRIVE', '', '', '', '', ''),
  Recyclable('UTENCIL', '(CERAMIC)', '', '', '', ''),
  Recyclable('UTENCIL', '(PLASTIC)', '', '', '', ''),
  Recyclable('UTENCIL', '(WOOD)', '', '', '', ''),
  Recyclable('VACUUM', '', '', '', '', ''),
  Recyclable('VCR PLAYER', '', '', '', '', ''),
  Recyclable('WATER BOTTLE', '(PLASTIC)', '', '', '', ''),
  Recyclable('WRAP', '(PAPER)', '', '', '', ''),
  Recyclable('YOGURT', '', '', '', '', ''),
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

/* 진짜 많이 쓰였음 Image Background */
BoxDecoration MyBoxDecoration(String imagename) {
  return BoxDecoration(
    color: Colors.black,
    image: DecorationImage(
      image: AssetImage('images/$imagename.jpg'),
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
      fit: BoxFit.cover,
    ),
  );
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
          onPressed: () => Navigator.of(context).pushNamed('/HOME'),
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

/* App Bar (Tab) (used for EVENTS) */
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
        onPressed: () => Navigator.of(context).pushNamed('/HOME'),
      ),
    ],
  );
}

//TODO: Remove this if not used (PageViewDemo)
/* App Bar */
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
        onPressed: () => Navigator.of(context).pushNamed('/EVENTS'),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

//TODO: This is not used at this moment. delete if not used later.
/* Each PageViewer(GOALS Details)'s Content */
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
                image: AssetImage('images/$image.jpg'), fit: BoxFit.cover),
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
      //TODO: Remove this part if not used; for PageViewDemo
      headline1: TextStyle(
        fontFamily: 'Rajdhani',
        fontSize: 25.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      //GOALS, EVENTS (ListView Title)
      headline2: TextStyle(
        fontFamily: 'Rajdhani',
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      //HOME (Icon texts)
      headline3: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Rajdhani',
          fontWeight: FontWeight.w700,
          color: Colors.white),
      //STAT (Big Font)
      headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 60.0,
          fontFamily: 'Rajdhani',
          color: Colors.white),
      //STAT (Small Font)
      subtitle1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          fontFamily: 'Rajdhani',
          color: Colors.white60),
      //SEARCH (BOLD Detailed Description)
      subtitle2: TextStyle(
        fontFamily: 'Rajdhani',
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      //SEARCH (Detailed Description)
      bodyText1: TextStyle(
        fontFamily: 'Rajdhani',
        fontSize: 20.0,
        color: Colors.black,
      ),
      //GOALS, EVENTS (ListView Description)
      bodyText2: TextStyle(
        fontFamily: 'Rajdhani',
        fontSize: 20.0,
        color: Colors.white,
      ),
    ),
  );
}

/* HOME - Material Button */
MaterialButton MyMaterialButton(
    BuildContext context, String iconName, int iconCode) {
  return MaterialButton(
    height: 130.0,
    minWidth: 130.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//TODO: fix onPressed issue
//    onPressed: () {
//      iconCode == 'CAMERA'
//          ? _takePhoto()
//          : Navigator.of(context).pushNamed('/$iconName');
//      setState(() {});
//    },
    onPressed: () => Navigator.of(context).pushNamed('/$iconName'),
    color: Colors.black.withOpacity(0.3),
    padding: EdgeInsets.all(20.0),
    child: Column(
      // Replace with a Row for horizontal icon + text
      children: <Widget>[
        Icon(
          IconData(iconCode, fontFamily: 'MaterialIcons'),
          size: 60.0,
          color: Colors.white,
        ),
        Text(
          '$iconName',
          style: LightThemeGrey().textTheme.headline3,
        ),
      ],
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
        decoration: MyBoxDecoration('background'),
        //show icons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyMaterialButton(context, 'CAMERA', 58288),
                SizedBox(
                  width: 15.0,
                ),
                MyMaterialButton(context, 'LOCATOR', 57544),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyMaterialButton(context, 'STATS', 59484),
                SizedBox(
                  width: 15.0,
                ),
                MyMaterialButton(context, 'SEARCH', 59574),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
//TODO: Remove it if not used
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                MyMaterialButton(context, 'GOALS', 57683),
//                SizedBox(
//                  width: 15.0,
//                ),
//                MyMaterialButton(context, 'EVENTS', 59512),
//              ],
//            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

/* LOCATOR */
//
//class LocatorPage extends StatelessWidget {
//  final locatorService = GeoLocatorService();
//  final placesService = PlacesService();
//
//  //TODO:     final currentPosition = Provider.of<Position>(context);
////26:19 https://www.youtube.com/watch?v=Dme03oxZRU0
//
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [
//        FutureProvider(create: (context) => locatorService.getLocation()),
//        ProxyProvider<Position, Future<List<Place>>>(
//          update: (context, position, places) {
//            return (position != null)
//                ? placesService.getPlaces(position.latitude, position.longitude)
//                : null;
//          },
//        ),
//      ],
//      child: MaterialApp(
//        title: 'Parking App',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: Search(),
//      ),
//    );
//  }
//}

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
        decoration: MyBoxDecoration('background'),
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
                        style: LightThemeGrey().textTheme.headline4,
                      ),
                      Text(
                        'Power Saved',
                        style: LightThemeGrey().textTheme.subtitle1,
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
                        style: LightThemeGrey().textTheme.headline4,
                      ),
                      Text(
                        'From Last Week',
                        style: LightThemeGrey().textTheme.subtitle1,
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

/* EVENTS */
class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightThemeGrey(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MyTabAppBar(context, 'EVENTS', 'ONGOING', 'FOLLOWING'),
          //show background behind the app bar
          extendBodyBehindAppBar: true,
          body: TabBarView(
            children: [
              //TODO: Edit the page
              MyListView(),
              //TODO: Add the content
              Icon(Icons.directions_car),
            ],
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}

/* GOALS */
class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightThemeGrey(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MyTabAppBar(context, 'GOALS', 'CURRENT', 'PAST'),
          //show background behind the app bar
          extendBodyBehindAppBar: true,
          body: TabBarView(
            children: [
              //TODO: Edit the page
              MyListView(),
              //TODO: Add the content
              Icon(Icons.directions_car),
            ],
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}

/* SEARCH - Details/Descriptions */
//TODO: Pass variable from clicked EVENTS to show in PageView's pages.
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
            'background',
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
            context, 'background', '123', 'Easy as ABC!', 1.0, 'Next'),
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
            context, 'background', 'ABC', 'Easy as 123!', 2.0, 'Close'),
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
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: SafeArea(
              child: MyListView(),
            ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}

/* SEARCH, EVENTS, GOALS - ListView for Array Recyclable */
ListView MyListView() {
  String imagename;
  return ListView.builder(
    itemCount: recyclable.length,
    itemBuilder: (context, index) {
      //괄호 있는 애들이랑 없는 애들 따로 imagename을 만듬
      if (recyclable[index].description != '') {
        imagename =
            recyclable[index].title + ' ' + recyclable[index].description;
      } else {
        imagename = recyclable[index].title;
      }
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          height: 120,
          decoration: MyBoxDecoration(imagename),
          child: Center(
            child: ListTile(
              title: Text(
                recyclable[index].title,
                style: LightThemeGrey().textTheme.headline2,
              ),
              subtitle: Text(
                recyclable[index].description,
                style: LightThemeGrey().textTheme.bodyText2,
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  size: 60.0, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        recyclable: recyclable[index],
                        previousScreen: 'LISTVIEW'),
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}

/* SEARCH - Details */
class DetailScreen extends StatelessWidget {
  final Recyclable recyclable;
  final String previousScreen;
  DetailScreen(
      {Key key, @required this.recyclable, @required this.previousScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //set variables
    String imagename = recyclable.title;
    String recycle = recyclable.recycle;
    String instruction = recyclable.instruction;
    String why = recyclable.why;
    String donate = recyclable.donate;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          //App Bar을 위로 밀면 없애줌 (혹은 타이틀만 보여줌)
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: false,
            floating: false,
            backgroundColor: Colors.transparent,
            onStretchTrigger: () {
              // Function callback for stretch
              return;
            },
            flexibleSpace: FlexibleSpaceBar(
              //아래로 쭉 땡기면 블러됨
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              //타이틀
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$imagename',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Rajdhani',
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              //타이틀 배경
              background: Container(
                decoration: MyBoxDecoration(imagename),
              ),
            ),
            //오른쪽 위에 있는 홈으로 가는 아이콘
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.widgets,
                  color: Colors.white,
                ),
                tooltip: 'Home Page',
                //show side pages
                onPressed: () => Navigator.of(context).pushNamed('/HOME'),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                //recyclable 알려줌
                Row(
                  children: [
                    Text('This item is ',
                        style: LightThemeGrey().textTheme.bodyText1),
                    Text('$recycle',
                        style: LightThemeGrey().textTheme.subtitle2),
                    Text('.', style: LightThemeGrey().textTheme.bodyText1),
                  ],
                ),
                SizedBox(height: 20.0),
                //TODO: recyclable 할때만 보이기?
                //recycle 버튼
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 10.0,
                  color: Colors.green,
                  child: MaterialButton(
                    //TODO: onPressed: ()
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.0),
                        const Text('RECYCLE NEAR ME',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //instruction 보여줌
                Text('Instruction',
                    style: LightThemeGrey().textTheme.subtitle2),
                Text('$instruction',
                    style: LightThemeGrey().textTheme.bodyText1),
                //TODO: YouTube Demonstration?
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //why 보여줌
                Text('Why?', style: LightThemeGrey().textTheme.subtitle2),
                Text('$why', style: LightThemeGrey().textTheme.bodyText1),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //donatable 알려줌
                Row(
                  children: [
                    Text('This item ',
                        style: LightThemeGrey().textTheme.bodyText1),
                    Text('$donate',
                        style: LightThemeGrey().textTheme.subtitle2),
                    Text('.', style: LightThemeGrey().textTheme.bodyText1),
                  ],
                ),
                SizedBox(height: 20.0),
                //TODO: donatable 할때만 보이기?
                //donate 버튼
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 10.0,
                  color: Colors.blueAccent,
                  child: MaterialButton(
                    //TODO: onPressed(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.0),
                        const Text('DONATE NEAR ME',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //유저가 모은 사진들
                Text('Your Collected Pictures',
                    style: LightThemeGrey().textTheme.subtitle2),
                //TODO: 유저가 모은 사진들 옆으로 볼 수 있게끔 만들기.
                // ListTiles++
              ]),
            ),
          ),
        ],
      ),
      //CameraPage에서 올때만 drawer(left-top icon) 열기
      drawer: (previousScreen == 'CAMERA') ? MyDrawer() : null,
    );
  }
}

/* CAMERA */
class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  double textSize = 20;
  String albumName = 'Media';

  @override
  void initState() {
    super.initState();
    _takePhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.transparent);
  }

  void _takePhoto() async {
//    final _picker = ImagePicker();
//    PickedFile pickedFile = await _picker.getImage(source: ImageSource.camera);
//    final File file = File(pickedFile.path);
    ImagePicker.pickImage(source: ImageSource.camera)
        .then((File recordedImage) {
      if (recordedImage != null && recordedImage.path != null) {
        GallerySaver.saveImage(recordedImage.path, albumName: albumName)
            .then((bool success) {});
        //move to TFLite with savedImage
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TFLite(
                    recordedImage: recordedImage,
                  )),
        );
      }
    });
  }
}

//TODO: TFLite - pass the image to TFLite to classify and then move to the information page

class TFLite extends StatefulWidget {
  final File recordedImage;
  TFLite({Key key, @required this.recordedImage}) : super(key: key);

  @override
  _TFLiteState createState() => _TFLiteState();
}

class _TFLiteState extends State<TFLite> {
  File _image;
  List _outputs;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _image = widget.recordedImage;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.transparent);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 72,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });

//    print(_outputs[0]["label"]);
//    log(_outputs[0]["label"]);

    int index =
        -2; //index increases twice; one `forEach` and the other `index++`; so it should starts at -2

    recyclable.forEach((item) {
      index++;
      if (item.title == _outputs[0]["label"]) {
        //your code for when the match is found
        //move to the detailed page to show more description
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
                recyclable: recyclable[index], previousScreen: 'CAMERA'),
          ),
        );
      }
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/recycling.tflite",
      labels: "assets/label.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
