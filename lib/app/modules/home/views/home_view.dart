import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/widgets/post/custom_post.dart';
import 'package:starter/widgets/post/story.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static launch() => Get.toNamed(Routes.HOME);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Story(),
                    Story(),
                    Story(),
                    Story(),
                    Story(),
                    Story(),
                    Story(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Obx(
                      () => CustomPost(
                        userName: 'name',
                        description: 'description\ndesc\nnew',
                        isLiked: controller.isLiked.value,
                        onLikeTap: () {
                          controller.isLiked.value = !controller.isLiked.value;
                        },
                      ),
                    ),
                    Obx(
                      () => CustomPost(
                        userName: 'newUser',
                        description: 'Null',
                        isLiked: controller.isLiked2.value,
                        onLikeTap: () {
                          controller.isLiked2.value =
                              !controller.isLiked2.value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
