import 'package:flutter/material.dart';
import 'package:news_cubit/layout/curved_layout.dart';

import 'content_model.dart';
class OnBoardScreen extends StatefulWidget {
  static const String routeApp='OnBoardScreen';
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex=0;
  PageController _controller=PageController();
  @override
  void initState() {
    _controller=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: mediaquery.height*.1,),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
                itemCount: contents.length,
                itemBuilder: (context, _i) {
                 //onbordContent
                  return Column(
                    children: [
                      Image.asset(contents[_i].image,height: 300,),
                      Text(contents[_i].title,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: ThemeData.light==ThemeData.light()?Colors.black:Colors.black),),
                     SizedBox(height: mediaquery.height*.05,),
                      SizedBox(width:mediaquery.width*.85, child: Text(contents[_i].description,style: TextStyle(fontSize: 18,color: Colors.grey),textAlign: TextAlign.center,)),
                    ],
                  );
                },
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) => buildDot(index,context),),
            ),
          ),

          //button
          Container(
            height: 55,
            width: double.infinity,
            color: Colors.transparent,
            margin: EdgeInsets.all(40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.orange.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  if(currentIndex==contents.length-1){
                    Navigator.pushReplacementNamed(context,
                      CurvedLayout.routeApp
                    );
                  }
                  _controller.nextPage(
                      duration: Duration(milliseconds: 130),
                      curve: Curves.easeIn,
                  );
                },
                child: Text(currentIndex==contents.length-1?"Get Started":"Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                )),
          ),
          TextButton(onPressed: () {
          //  Navigator.pushReplacementNamed(context,
            //                 LayoutScreen.routeApp
            //             );
            Navigator.pushReplacementNamed(context,
                CurvedLayout.routeApp
            );
          }, child: Text("Skip",style: TextStyle(color: Colors.black54,fontSize: 20),)),
        ],
      ),
    );
  }

  Container buildDot(int index,BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex==index?40:10,
      margin:  EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex==index?Colors.orange.shade900:Colors.grey,
      ),
    );
  }
}
