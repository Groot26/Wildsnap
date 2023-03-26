import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  RxBool isLiked = false.obs;
  RxBool isLiked2 = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
