import 'package:flutter/material.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';

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