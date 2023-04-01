import 'package:get/get.dart';
import 'package:wildsnap/app/modules/activity/controllers/activity_controller.dart';
import 'package:wildsnap/app/modules/home/controllers/home_controller.dart';
import 'package:wildsnap/app/modules/profile/controllers/profile_controller.dart';
import 'package:wildsnap/app/modules/search/controllers/search_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => ActivityController());
    Get.lazyPut(() => ProfileController());
  }
}
