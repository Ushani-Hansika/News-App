import 'dart:convert';

import 'package:flutter_news/models/artical_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticalModel> news =[];

  Future<void>  getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c64c5af926c64ee5b5b819136f4fe951 ";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null ){
          ArticalModel articalModel = ArticalModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],
              content: element['content']

          );

          news.add(articalModel);
        }
        });


    }
  }
}