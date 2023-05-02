import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import '../controllers/comments_controller.dart';

class CommentsView extends GetView<CommentsController> {
  static launch() => Get.toNamed(Routes.COMMENTS);

  List<String> comments = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comments',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                              controller.profileDetails.profilePic,
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
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.comments,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      comments.add(controller.comments.text);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
