import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/bottomBar/custom_bottom_bar.dart';
import 'package:starter/widgets/post/custom_post.dart';
import 'package:starter/widgets/post/story.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static launch() => Get.offAllNamed(Routes.HOME);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,

        child: Icon(Icons.add,size: 40),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          Strings.appName,
          style: Styles.tsBlackBold24,
        ),
        //Add camera and send message
      ),
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
                    CustomPost(
                        userName: 'Sai._.morajkar', description: 'description ', likes: true,),
                    CustomPost(
                        userName: 'newUser', description: 'description', likes: false,),
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
