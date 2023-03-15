import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/post/custom_post.dart';
import 'package:starter/widgets/post/story.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static launch() => Get.offAllNamed(Routes.HOME);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          Strings.appName,
          style: Styles.tsBlackBold24,
        ),
        //Add camera and send message
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Row(
                children: [
                  Story(),
                  Story(),
                  Story(),
                  Story(),
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
        ],
      ),
    );
  }
}
