
import 'package:get/get.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/helper/validators.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final nameWrapper = TextFieldWrapper();
  final userNameWrapper = TextFieldWrapper();
  final phoneWrapper = TextFieldWrapper();
  final emailWrapper = TextFieldWrapper();
  final passwordWrapper = TextFieldWrapper();
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

  updateProfile() async {
    final name = nameWrapper.controller.text;
    final userName = userNameWrapper.controller.text;
    final phoneNumber = phoneWrapper.controller.text;
    final email = emailWrapper.controller.text;
    final password =passwordWrapper.controller.text;

    if (name.isValidName()) {
      nameWrapper.errorText = Strings.empty;
    } else {
      nameWrapper.errorText = ErrorMessages.invalidName;
      return;
    }

    if (userName.isValidName()) {
      userNameWrapper.errorText = Strings.empty;
    } else {
      userNameWrapper.errorText = ErrorMessages.invalidUserName;
      return;
    }

    if (phoneNumber.isValidPhone()) {
      phoneWrapper.errorText = Strings.empty;
    } else {
      phoneWrapper.errorText = ErrorMessages.invalidPhone;
      return;
    }

    if (email.isValidEmail()) {
      emailWrapper.errorText = Strings.empty;
    } else {
      emailWrapper.errorText = ErrorMessages.invalidEmail;
      return;
    }

    //1upper,1lower,1char,1number,>8
    if (password.isValidPassword()) {
      passwordWrapper.errorText = Strings.empty;
    } else {
      passwordWrapper.errorText = ErrorMessages.invalidPassword;
      return;
    }

    print('profile updated');
    //todo:
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text("Profile Updated"),
    //   ),
    // );

  }
}
