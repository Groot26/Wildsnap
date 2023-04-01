import 'package:get/get.dart';
import 'package:wildsnap/app/data/models/response/user_response.dart';

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
