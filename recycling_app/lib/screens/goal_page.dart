import 'package:flutter/material.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';
import 'package:recycling_app/components/tap_appbar_EVENTSGOALS.dart';
import 'package:recycling_app/components/my_listview.dart';
import 'package:recycling_app/components/my_drawer.dart';

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
