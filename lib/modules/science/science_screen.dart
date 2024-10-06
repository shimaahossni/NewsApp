import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../provider/models/artical_model.dart';
import '../../provider/service/artical_services.dart';
import '../general/artical_card.dart';
class ScienceScreen extends StatefulWidget {
  const ScienceScreen({super.key});

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  List<ArticalModel> articals=[];

  Future<List<ArticalModel>> getArtical()async{
    articals=await ArticalService().getArtical('science');
    return articals;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,

        body: FutureBuilder(
          future: getArtical(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Column(
              children: [
                SizedBox(height: mediaquery.height*.06,),
                SizedBox(
                  height: mediaquery.height*.3,
                  width: double.infinity,

                  child:AnotherCarousel(
                    indicatorBgPadding: 20.0,
                    boxFit: BoxFit.cover,
                    autoplay: true,
                    animationCurve: Curves.easeInOutSine,
                    dotBgColor: Colors.orange.shade900,
                    images: [

                      CachedNetworkImage(
                        imageUrl: articals[0].urlToImage,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),

                      CachedNetworkImage(
                        imageUrl: articals[1].urlToImage,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),

                      CachedNetworkImage(
                        imageUrl: articals[2].urlToImage,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),

                      CachedNetworkImage(
                        imageUrl: articals[3].urlToImage,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),


                    ],
                  ),
                ),

                SizedBox(height: mediaquery.height*0.02,),


                Expanded(
                    child: ListView.builder(
                        itemCount: articals.length,
                        itemBuilder: (context,index){
                          return ArticalCard(
                            articalModel: snapshot.data![index],);
                        }
                    )
                ),
              ],)
                : Center(
                child: CircularProgressIndicator(
                )
            );
          },)
    );
  }
}
