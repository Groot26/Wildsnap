import 'package:get/get.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/helper/validators.dart';

class ProfileController extends GetxController {
  final nameWrapper = TextFieldWrapper();
  final userNameWrapper = TextFieldWrapper();
  final phoneWrapper = TextFieldWrapper();
  final emailWrapper = TextFieldWrapper();
  final dobWrapper = TextFieldWrapper();
  late final dob;

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
