import 'package:flutter/material.dart';
import 'package:recycling_app/components/box_decoration.dart';
import 'package:recycling_app/components/appbar.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';
import 'package:recycling_app/components/my_drawer.dart';

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
