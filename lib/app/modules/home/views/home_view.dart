import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/widgets/comment/comment.dart';
import 'package:starter/widgets/post/custom_post.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Comment(
            text: 'Nice pic 100%',
            userId:'Test User 1',
          ),
          Comment(
            text: 'good picture',
            userId:'Test User 2',
          ),
          CustomPost(title: 'title', description: 'description', likes: 300)
        ],)
      ),
    );
  }
}
