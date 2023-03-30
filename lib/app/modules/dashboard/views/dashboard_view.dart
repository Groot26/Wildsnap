import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/modules/activity/views/activity_view.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/app/modules/postPreview/views/post_preview_view.dart';
import 'package:starter/app/modules/profile/views/profile_view.dart';
import 'package:starter/app/modules/search/views/search_view.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  static launch() => Get.toNamed(Routes.DASHBOARD);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12),
        child: FloatingActionButton(
          onPressed: PostPreviewView.launch,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(
            Images.icAdd,
            width: 50,
            height: 50,
            //color: iconColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          Strings.appName,
          style: Styles.tsBlackBold24,
        ),
      ),
      body:
        Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  HomeView(),
                  SearchView(),
                  ActivityView(),
                  ProfileView(),
                ],
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: controller.onPageChanged,
              ),
            ),
            Container(
              color: AppColors.grey10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                        () => BottomNavigationBarItem(
                      onTap: controller.moveToHome,
                      image: Images.icHome,
                      iconColor: controller.currentPage == 0
                          ? AppColors.blue
                          : AppColors.primaryColor,
                      style: controller.currentPage == 0
                          ? Styles.tsBlueRegular14
                          : Styles.tsPrimaryColorRegular14,
                    ),
                  ),
                  Obx(
                        () => BottomNavigationBarItem(
                      onTap: controller.moveToSearch,
                      image: Images.icSearch,
                      iconColor: controller.currentPage == 1
                          ? AppColors.blue
                          : AppColors.primaryColor,
                      style: controller.currentPage == 1
                          ? Styles.tsBlueRegular14
                          : Styles.tsPrimaryColorRegular14,
                    ),
                  ),
                  SizedBox(width: 40),
                  Obx(
                        () => BottomNavigationBarItem(
                      onTap: controller.moveToActivity,
                      image: Images.icActivity,
                      iconColor: controller.currentPage == 2
                          ? AppColors.blue
                          : AppColors.primaryColor,
                      style: controller.currentPage == 2
                          ? Styles.tsBlueRegular14
                          : Styles.tsPrimaryColorRegular14,
                    ),
                  ),
                  Obx(
                        () => BottomNavigationBarItem(
                      onTap: controller.moveToProfile,
                      image: Images.icProfile,
                      iconColor: controller.currentPage == 3
                          ? AppColors.blue
                          : AppColors.primaryColor,
                      style: controller.currentPage == 3
                          ? Styles.tsBlueRegular14
                          : Styles.tsPrimaryColorRegular14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  final TextStyle style;
  final VoidCallback onTap;
  final String image;
  final Color iconColor;

  BottomNavigationBarItem({
    required this.style,
    required this.onTap,
    required this.image,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: Column(
            children: [
              SvgPicture.asset(
                image,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(iconColor,BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}