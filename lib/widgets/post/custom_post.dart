import 'package:flutter/material.dart';

class CustomPost extends StatelessWidget {
  final String title;
  final String description;
  final int likes;

  CustomPost({
    required this.title,
  required this.description,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(),// add post
        Row(
          children: [
            Column(children: [Icon(Icons.heart_broken),Text(likes.toString())],),
            Column(children: [Text(title),Text(description)],),
            Icon(Icons.comment_outlined)
          ],
        )
      ],)
    );
  }
}
