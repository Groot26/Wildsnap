import 'package:get/get.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';

class PostPreviewController extends GetxController {
  //TODO: Implement PostPreviewController
  final captionWrapper = TextFieldWrapper();
  final locationWrapper = TextFieldWrapper();


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
