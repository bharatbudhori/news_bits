import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleView(url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.network(imageUrl),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
