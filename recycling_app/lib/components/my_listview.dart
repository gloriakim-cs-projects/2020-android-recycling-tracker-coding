import 'package:flutter/material.dart';
import 'package:recycling_app/recyclable_list.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';
import 'box_decoration.dart';
import '../screens/search_detail_page.dart';

ListView MyListView() {
  String imagename;
  return ListView.builder(
//    drawer: (previousScreen == 'CAMERA') ? MyDrawer() : null,
    itemCount: recyclable.length,
    itemBuilder: (context, index) {
      //괄호 있는 애들이랑 없는 애들 따로 imagename을 만듬
      if (recyclable[index].description != '') {
        imagename =
            recyclable[index].title + ' ' + recyclable[index].description;
      } else {
        imagename = recyclable[index].title;
      }
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          height: 120,
          decoration: MyBoxDecoration(imagename),
          child: Center(
            child: ListTile(
              title: Text(
                recyclable[index].title,
                style: LightThemeGrey().textTheme.headline2,
              ),
              subtitle: Text(
                recyclable[index].description,
                style: LightThemeGrey().textTheme.bodyText2,
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  size: 60.0, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        recyclable: recyclable[index],
                        previousScreen: 'LISTVIEW'),
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
