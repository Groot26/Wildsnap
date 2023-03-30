import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../activity/controllers/activity_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../search/controllers/search_controller.dart';

class DashboardController extends GetxController{
  final PageController pageController = PageController();
  final RxInt _currentPage = 0.obs;

  int get currentPage => _currentPage.value;

  switchPage(int index) {
    if (currentPage != index) {
      pageController.jumpToPage(index);
    }
  }

  moveToHome() {
    final homeController = Get.find<HomeController>();
    homeController.onReady();
    switchPage(0);
  }

  moveToSearch() {
    final searchController = Get.find<SearchController>();
    searchController.onReady();
    switchPage(1);
  }

  moveToActivity() {
    final activityController = Get.find<ActivityController>();
    activityController.onReady();
    switchPage(2);
  }

  moveToProfile() => switchPage(3);

  onPageChanged(int index) => _currentPage.value = index;
}
