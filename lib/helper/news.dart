import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getnews() async {
    String url =
        'Enter your News.org API';

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

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getnews(String category) async {
    String url =
        'Enter your News.org API';

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


