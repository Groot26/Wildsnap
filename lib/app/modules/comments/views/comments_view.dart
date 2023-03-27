import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/routes/app_pages.dart';

import '../controllers/comments_controller.dart';

class CommentsView extends GetView<CommentsController> {
  static launch() => Get.toNamed(Routes.COMMENTS);

  final List<String> comments = [
    'comment 111111111\nnewline\nhi\nhello',
    'comment 2',
    'comment 3',
    'comment 1',
    'comment 2',
    'comment 3',
    'comment 1',
    'comment 2',
    'comment 3',
    'comment 1',
    'comment 2',
    'comment 3',
    'comment 1',
    'comment 2',
    'comment 3',
    'comment 1',
    'comment 2',
    'comment 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommentsView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.imgSample,
                            width: 40,
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              comments[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
