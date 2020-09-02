import 'package:flutter/material.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';
import 'package:recycling_app/components/tap_appbar_EVENTSGOALS.dart';
import 'package:recycling_app/components/my_listview.dart';
import 'package:recycling_app/components/my_drawer.dart';
//bottom dot indicator
import 'package:dots_indicator/dots_indicator.dart';

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
