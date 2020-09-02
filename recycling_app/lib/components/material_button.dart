import 'package:flutter/material.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';

/* HOME - 네모난 버튼들 */
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