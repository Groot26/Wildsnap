import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt _currentPage = RxInt(0);

  int get currentPage => _currentPage.value;

  moveToNextScreen() {
    if (currentPage < 2) {
      pageController.animateToPage(currentPage + 1,
          duration: 300.milliseconds, curve: Curves.linear);
    } else {}
  }

  moveToPreviousScreen() {
    if (currentPage > 0) {
      pageController.animateToPage(currentPage - 1,
          duration: 300.milliseconds, curve: Curves.linear);
    }
  }

  onPageChanged(int index) {
    _currentPage.value = index;
  }
}
