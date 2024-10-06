import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_cubit/on_board/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeApp="/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
   void initState() {
     Timer(const Duration(seconds: 5),
           () {
         Navigator.pushReplacementNamed(context,OnBoardScreen.routeApp);
       },);
     // TODO: implement initState
     super.initState();
   }



  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffeb591e),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset("assets/images/logo.png",
          Image.asset("assets/images/logo2.png",
              width: mediaquery.width*.8,
              fit: BoxFit.cover,
            ),
            SizedBox(height: mediaquery.height*.03,),
            Text("FoxNews",style: TextStyle(
                color: Colors.white,
                fontSize: mediaquery.width*.09,fontWeight: FontWeight.bold  ),),
            SizedBox(height: mediaquery.height*.03,),
            CircularProgressIndicator(color: Colors.white,),
          ],
        ),
      ),

    );
  }
}
