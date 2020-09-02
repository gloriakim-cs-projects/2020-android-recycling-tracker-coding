import 'package:flutter/material.dart';
import 'package:recycling_app/recyclable.dart';
import 'package:recycling_app/components/box_decoration.dart';
import 'file:///C:/Users/glori/AndroidStudioProjects/recycling_app/lib/components/my_flutter_app_icons.dart';
import 'package:recycling_app/theme/light_grey_theme.dart';
import 'package:recycling_app/components/my_drawer.dart';

class DetailScreen extends StatelessWidget {
  final Recyclable recyclable;
  final String previousScreen;
  DetailScreen(
      {Key key, @required this.recyclable, @required this.previousScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //set variables
    String imagename = recyclable.title;
    String recycle = recyclable.recycle;
    String instruction = recyclable.instruction;
    String recyclingPreparation = recyclable.recyclingPreparation;
    String recyclingProcess = recyclable.recyclingProcess;
    String why = recyclable.why;
    String donate = recyclable.donate;
    String creativeUse = recyclable.creativeUse;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          //App Bar을 위로 밀면 없애줌 (혹은 타이틀만 보여줌)
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: false,
            floating: false,
            backgroundColor: Colors.transparent,
            onStretchTrigger: () {
              // Function callback for stretch
              return;
            },
            flexibleSpace: FlexibleSpaceBar(
              //아래로 쭉 땡기면 블러됨
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              //타이틀
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$imagename',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Rajdhani',
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              //타이틀 배경
              background: Container(
                decoration: MyBoxDecoration(imagename),
              ),
            ),
            //오른쪽 위에 있는 홈으로 가는 아이콘
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.widgets,
                  color: Colors.white,
                ),
                tooltip: 'Home Page',
                //show side pages
                onPressed: () => Navigator.of(context).pushNamed('/HOME'),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                //recyclable 알려줌
                Row(
                  children: [
                    Icon(
                      MyFlutterApp.recycle_1,
                      color: Colors.black,
                    ),
                    Text(' This item ',
                        style: LightThemeGrey().textTheme.bodyText1),
                    Text('$recycle',
                        style: LightThemeGrey().textTheme.subtitle2),
                    Text('.', style: LightThemeGrey().textTheme.bodyText1),
                  ],
                ),
                SizedBox(height: 20.0),
                //TODO: recyclable 할때만 보이기?
                //recycle 버튼
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 10.0,
                  color: Colors.green,
                  child: MaterialButton(
                    //TODO: onPressed: ()
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.0),
                        const Text('RECYCLE NEAR ME',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //instruction 보여줌
                Text('Instruction',
                    style: LightThemeGrey().textTheme.subtitle2),
                Text('$instruction',
                    style: LightThemeGrey().textTheme.bodyText1),
                //TODO: YouTube Demonstration?
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //recycling preparation 보여줌
                Text('Recycling Preparation',
                    style: LightThemeGrey().textTheme.subtitle2),
                Text('$recyclingPreparation',
                    style: LightThemeGrey().textTheme.bodyText1),
                //TODO: YouTube Demonstration?
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //recycling process 보여줌
                Text('Recycling Process',
                    style: LightThemeGrey().textTheme.subtitle2),
                Text('$recyclingProcess',
                    style: LightThemeGrey().textTheme.bodyText1),
                //TODO: YouTube Demonstration?
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //why 보여줌
                Text('Why?', style: LightThemeGrey().textTheme.subtitle2),
                Text('$why', style: LightThemeGrey().textTheme.bodyText1),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //donatable 알려줌
                Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.green,
                    ),
                    Text('This item ',
                        style: LightThemeGrey().textTheme.bodyText1),
                    Text('$donate',
                        style: LightThemeGrey().textTheme.subtitle2),
                    Text('.', style: LightThemeGrey().textTheme.bodyText1),
                  ],
                ),
                SizedBox(height: 20.0),
                //TODO: donatable 할때만 보이기?
                //donate 버튼
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 10.0,
                  color: Colors.blueAccent,
                  child: MaterialButton(
                    //TODO: onPressed(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.0),
                        const Text('DONATE NEAR ME',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                Text('Instruction',
                    style: LightThemeGrey().textTheme.subtitle2),
                Text('$instruction',
                    style: LightThemeGrey().textTheme.bodyText1),
                //TODO: YouTube Demonstration?
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //creative use 보여줌
                Text('Creative Uses',
                    style: LightThemeGrey().textTheme.subtitle2),
                Text('$creativeUse',
                    style: LightThemeGrey().textTheme.bodyText1),
                //TODO: YouTube Demonstration?
                SizedBox(height: 10.0),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10.0),
                //유저가 모은 사진들
                Text('Your Collected Pictures',
                    style: LightThemeGrey().textTheme.subtitle2),
                //TODO: 유저가 모은 사진들 옆으로 볼 수 있게끔 만들기.
                // ListTiles++
              ]),
            ),
          ),
        ],
      ),
      //CameraPage에서 올때만 drawer(left-top icon) 열기
      drawer: (previousScreen == 'CAMERA') ? MyDrawer() : null,
    );
  }
}
