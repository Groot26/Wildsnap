import 'package:get/get.dart';

import '../controllers/guest_profile_controller.dart';

class GuestProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestProfileController>(
      () => GuestProfileController(),
    );
  }
}
