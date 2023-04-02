import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startOnboarding();
  }

  _startOnboarding() async {
    await Future.delayed(Duration(seconds: 3));

    //debugPrint(Storage.getUser().userName);
    if (Storage.isUserExists())
      Get.offAllNamed(Routes.DASHBOARD);
    else
      Get.offAllNamed(Routes.ON_BOARDING);
  }

}
