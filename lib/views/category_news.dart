import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';

import 'package:news_app/widgets/blog_tile.dart';


class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
 // List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    
  }
  void getCategoryNews() async {
      CategoryNewsClass newsClass = CategoryNewsClass();
      await newsClass.getnews(widget.category);
      articles = newsClass.news;

      setState(() {
        _isLoading = false;
      });
    }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 91,
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Bits',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            _isLoading
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (ctx, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            description: articles[index].description,
                            url: articles[index].url,
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
