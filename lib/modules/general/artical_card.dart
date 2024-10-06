import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../provider/models/artical_model.dart';
import '../webview/web_view.dart';


class ArticalCard extends StatelessWidget {
  const ArticalCard({super.key, required this.articalModel});
  final ArticalModel articalModel;


  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => WebView(url: articalModel.url),)
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(mediaquery.height*0.08), // Image radius
                      child: CachedNetworkImage(
                        imageUrl: articalModel.urlToImage,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error_outline,size: 60,color: Colors.orange.shade900,),
                      ),
                    ),
                  ),
                ),

                //info
                Container(
                  width: mediaquery.width*0.5,
                 // color: Colors.red,
                  child: Column(
                    children: [
                      Text(articalModel.title,style: TextStyle(
                        fontSize: mediaquery.height*0.02,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(articalModel.date.substring(0,19),style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: mediaquery.height*0.02
                      ),),
                    ],
                  ),
                ),
              ],
            ),



         //   Image.network(articalModel.urlToImage),
           // Text(articalModel.title),
            //Text(articalModel.description),
            //Row( children: [
             // Text(articalModel.author),
              //Text(articalModel.date),
            //],)
      ],
        )
      ),
    );
  }
}
