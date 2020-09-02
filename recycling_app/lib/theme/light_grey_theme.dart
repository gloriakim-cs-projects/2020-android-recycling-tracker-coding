import 'package:flutter/material.dart';

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
