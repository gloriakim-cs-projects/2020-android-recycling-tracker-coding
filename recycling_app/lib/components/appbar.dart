import 'package:flutter/material.dart';

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
