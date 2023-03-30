import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/bottomBar/custom_bottom_bar.dart';

import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  static launch() => Get.toNamed(Routes.ACTIVITY);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView.builder(
        itemCount: 10, // replace with actual number of activities
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Image.asset(Images.imgSample),
            ),
            title: Text("UserName"),
            subtitle: Text("Liked your post"),
            trailing: Text("1 min ago"), // replace with actual timestamp
          );
        },
      ),
    );
  }
}
