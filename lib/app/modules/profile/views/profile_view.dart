import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/widgets/bottomBar/custom_bottom_bar.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  static launch() => Get.offAllNamed(Routes.PROFILE);

  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
