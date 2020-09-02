import 'package:flutter/material.dart';

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
