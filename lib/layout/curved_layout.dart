import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_cubit/modules/business/business_screen.dart';
import 'package:news_cubit/modules/entertainment/entertainment_screen.dart';
import 'package:news_cubit/modules/science/science_screen.dart';
import '../modules/general/general_screen.dart';
import '../modules/health/health_screen.dart';
import '../modules/search/search_screen.dart';
import '../modules/sport/sport_screen.dart';

class CurvedLayout extends StatefulWidget {
  static const String routeApp = 'curved_layout';
  const CurvedLayout({super.key});

  @override
  State<CurvedLayout> createState() => _CurvedLayoutState();
}

class _CurvedLayoutState extends State<CurvedLayout> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<Widget> screens=[
    GeneralScreen(),
    SportScreen(),
    BusinessScreen(),
    HealthScreen(),
    ScienceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.orange.shade900,
          animationCurve: Curves.decelerate ,
          index: _page,
          buttonBackgroundColor: Colors.orange.shade900,



          key: _bottomNavigationKey,
          items: const <Widget>[
            Icon(Icons.generating_tokens, size: 30,color: Colors.white,),
            Icon(Icons.sports_basketball, size: 30,color: Colors.white,),
            Icon(Icons.business, size: 30,color: Colors.white,),
            Icon(Icons.health_and_safety_sharp, size: 30,color: Colors.white,),
            Icon(Icons.science_sharp, size: 30,color: Colors.white,),
          ],

          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
    );
  }
}
