import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getnews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=6633830d7ca844848d974daf04697f16';

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              content: element['context'],
              description: element['description'],
              //publishedAt: element['publishedAt'],
              url: element['url'],
              urlToImage: element['urlToImage'],
            );

            news.add(articleModel);
          }
        },
      );
    }
  }
}
