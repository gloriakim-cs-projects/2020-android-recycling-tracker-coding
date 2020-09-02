import 'package:flutter/material.dart';
import 'package:recycling_app/components/appbar.dart';
import 'package:recycling_app/components/box_decoration.dart';
import 'package:recycling_app/components/material_button.dart';
import 'package:recycling_app/components/my_drawer.dart';

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
