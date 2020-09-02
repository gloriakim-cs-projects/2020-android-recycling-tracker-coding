import 'package:flutter/material.dart';
import 'package:recycling_app/components/appbar_detail_EVENTS.dart';
import 'package:recycling_app/components/pagewidget_GOALS.dart';

/* SEARCH - Details/Descriptions */
//TODO: Pass variable from clicked EVENTS to show in PageView's pages.
class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MyPage1Widget(),
        MyPage2Widget(),
        MyPage3Widget(),
      ],
    );
  }
}

class MyPage1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarDetails(context, 'PLASTIC'),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: PageWidgetContent(
            context,
            'background',
            'Bring Your Own Bag',
            'We produce more than 280 million tons of plastics. That’s about ten stone mountains every day!',
            0.0,
            'Next'),
      ),
    );
  }
}

class MyPage2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarDetails(context, 'PLASTIC'),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: PageWidgetContent(
            context, 'background', '123', 'Easy as ABC!', 1.0, 'Next'),
      ),
    );
  }
}

class MyPage3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarDetails(context, 'PLASTIC'),
      //show background behind the app bar
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: PageWidgetContent(
            context, 'background', 'ABC', 'Easy as 123!', 2.0, 'Close'),
      ),
    );
  }
}
