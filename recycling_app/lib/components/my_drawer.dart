
import 'package:flutter/material.dart';

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