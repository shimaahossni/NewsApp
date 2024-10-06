import 'package:dio/dio.dart';
import '../models/artical_model.dart';

class ArticalService {
  Future<List<ArticalModel>> getArtical(String category)async{
  //  https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=8877a235063f4aa9ac6c4a8847fc2412
    var response=await Dio().get("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=8877a235063f4aa9ac6c4a8847fc2412");

    Map<String ,dynamic> json=response.data;
    List<dynamic> art=json['articles'];
    List<ArticalModel> articals=[];

    for(var artical in art){

      ArticalModel model=ArticalModel(
        title: artical['title']??"No title",
        description: artical['description']??"no description",
        urlToImage: artical['urlToImage']??"no image",
        author: artical['author']??"No author",
        date: artical['publishedAt']??"no date",
        url: artical['url']??"no url found",

      );
      articals.add(model);
    }
    return articals;
  }
}