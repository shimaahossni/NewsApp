import 'package:flutter/material.dart';
import 'package:news_cubit/layout/curved_layout.dart';
import 'package:news_cubit/on_board/onboard_screen.dart';
import 'package:news_cubit/splash/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'MediaPlayer',
      initialRoute: SplashScreen.routeApp,
      routes: {
        SplashScreen.routeApp:(context)=>SplashScreen(),
        OnBoardScreen.routeApp:(context)=>OnBoardScreen(),
       // LayoutScreen.routeApp:(context)=>LayoutScreen(),
        CurvedLayout.routeApp:(context)=>CurvedLayout(),
      },
    );
  }
}

