import 'package:covid19india/pages/about_app.dart';
import 'package:covid19india/pages/general_recommendations.dart';
import 'package:covid19india/pages/home_page.dart';
import 'package:covid19india/pages/myth_buster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'file:///F:/FlutterWorkspace/covid_19_india/covid_19_india/lib/utility/theme_data.dart';

void main() {
  runApp(MyApp());
}

floatingMenu(BuildContext context) {
  return Positioned(
    bottom: 20.0,
    left: 30.0,
    right: 30.0,
    child: Card(
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
              child: SvgPicture.asset(
                'assets/images/home.svg',
                height: 20.0,
                width: 20.0,
              ),
              onTap: () {
                _tabController.animateTo(0);
              },
            )),
            Expanded(
                child: GestureDetector(
              child: SvgPicture.asset(
                'assets/images/recommendations.svg',
                height: 20.0,
                width: 20.0,
              ),
              onTap: () {
                _tabController.animateTo(1);
              },
            )),
            Expanded(
                child: GestureDetector(
              child: SvgPicture.asset(
                'assets/images/mythbuster.svg',
                height: 20.0,
                width: 20.0,
              ),
              onTap: () {
                _tabController.animateTo(2);
              },
            )),
            Expanded(
                child: GestureDetector(
              child: SvgPicture.asset(
                'assets/images/info.svg',
                height: 20.0,
                width: 20.0,
              ),
              onTap: () {
                _tabController.animateTo(3);
              },
            )),
          ],
        ),
      ),
    ),
  );
}

TabController _tabController;

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0))),
              ),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            MyHomePage(),
                            GeneralRecommendations(),
                            MythBusters(),
                            AboutApp(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingMenu(context),
            ],
          ),
        ),
      ),
    );
  }
}
