import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:wildsnap/app/data/models/dto/user.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/utils/helper/text_field_wrapper.dart';
import 'package:wildsnap/utils/helper/validators.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final nameWrapper = TextFieldWrapper();
  final userNameWrapper = TextFieldWrapper();
  final phoneWrapper = TextFieldWrapper();
  final emailWrapper = TextFieldWrapper();
  final bioWrapper = TextFieldWrapper();
  final dobWrapper = TextFieldWrapper();
  DateTime? dob;

  late User profileDetails;

  final count = 0.obs;

  @override
  void onInit() {
    profileDetails = Storage.getUser();
    fillDetails();
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

  fillDetails() {
    nameWrapper.controller.text = profileDetails.name;
    userNameWrapper.controller.text = profileDetails.userName;
    phoneWrapper.controller.text = profileDetails.phone;
    emailWrapper.controller.text = profileDetails.email;
    if (profileDetails.bio != null) {
      bioWrapper.controller.text = profileDetails.bio!;
    } else {
      bioWrapper.controller.text = '';
    }
  }

  updateProfile() async {
    final name = nameWrapper.controller.text;
    final userName = userNameWrapper.controller.text;
    final phoneNumber = phoneWrapper.controller.text;
    final email = emailWrapper.controller.text;

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
    updateUserDetails();
  }

  Future updateUserDetails() async {
    var url = Uri.parse('http://3.109.185.64:3001/api/user');
    //json mapping user entered details
    Map mapData = {
      'name': nameWrapper.controller.text.isEmpty
          ? null
          : nameWrapper.controller.text,
      'phone': phoneWrapper.controller.text.isEmpty
          ? null
          : phoneWrapper.controller.text,
      'bio': bioWrapper.controller.text.isEmpty
          ? null
          : bioWrapper.controller.text,
    };

    http.Response response = await http.patch(url,
        body: mapData,
        headers: {'Authorization': 'Bearer ${Storage.getToken()}'});

    var data = jsonDecode(response.body);
    print("DATA: $data");
    //print("user" + data['user']);

    if (data['acknowledged'] == true) {
      //final user = User.fromJson(data['user']);
      Get.snackbar('Profile Updated', 'Successfully');
      print('profile updated');
      //await Storage.setUser(user);
    } else {
      // Storage.setUser(response.data);
      Get.snackbar('Something went Wrong', data['message']);
    }
  }
}
