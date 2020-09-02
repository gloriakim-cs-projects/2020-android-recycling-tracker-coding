import 'package:flutter/material.dart';
import 'package:recycling_app/recyclable_list.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';
import 'package:recycling_app/components/my_drawer.dart';
import 'package:recycling_app/components/my_listview.dart';

/* SEARCH */
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //for search bar's text edit
  TextEditingController _textController = TextEditingController();

  // item이 바뀔 때마다 setState 해줌
  onItemChanged(String value) {
    setState(() {
      recyclable = recyclable
          .where((string) =>
              string.title.toLowerCase().contains(value.toLowerCase()) ||
              string.description.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightThemeGrey(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.black54),
            title: TextField(
              style: TextStyle(color: Colors.black),
              controller: _textController,
              decoration: InputDecoration(
                prefixIcon: new Icon(Icons.search, color: Colors.black54),
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Search Here',
              ),
              onChanged: onItemChanged,
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
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          //show background behind the app bar
          extendBodyBehindAppBar: true,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: SafeArea(
              child: Expanded(
                child: MyListView(),
              ),
            ),
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}
