import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/category_news.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 130,
                height: 65,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 130,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.black38,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
