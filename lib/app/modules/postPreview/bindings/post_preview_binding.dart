import 'package:get/get.dart';

import '../controllers/post_preview_controller.dart';

class PostPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostPreviewController>(
      () => PostPreviewController(),
    );
  }
}
