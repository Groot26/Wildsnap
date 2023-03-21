import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/bottomBar/custom_bottom_bar.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  static launch() => Get.offAllNamed(Routes.SEARCH);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, size: 40),
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
            Text('data')
          ],
        )
      ),
    );
  }
}
