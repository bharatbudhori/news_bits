import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(description,style: TextStyle(
              fontSize: 15,
              
            ),),
        ],
      ),
    );
  }
}
