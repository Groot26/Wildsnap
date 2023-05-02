import 'dart:convert';

import 'package:get/get.dart';
import 'package:wildsnap/app/modules/auth/login/views/auth_login_view.dart';
import 'package:wildsnap/utils/helper/validators.dart';
import 'package:http/http.dart' as http;
import '../../../../../utils/helper/text_field_wrapper.dart';

class AuthVerifyOtpController extends GetxController {
  //TODO: Implement AuthVerifyOtpController.

  final emailWrapper = TextFieldWrapper();
  final passWrapper = TextFieldWrapper();

  String _otp = '';

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
  void onClose() {}
  void increment() => count.value++;

  onOTPChanged(String value) => _otp = value;

  // verifyOTP() async {
  //
  //   print(_otp);
  //   }

  Future verifyOTP() async {
    var url = Uri.parse('http://3.109.185.64:3001/api/auth/reset-password');
    //json mapping user entered details
    Map mapData = {
      'email': emailWrapper.controller.text,
      'otp':  _otp,
      'password':passWrapper.controller.text,
    };

    http.Response response = await http.post(url, body: mapData);

    var data = jsonDecode(response.body);

    print("Status: " + response.statusCode.toString());
    print("DATA: $data");


    if(response.statusCode == 201){
      Get.snackbar('Success', data['message']);
      AuthLoginView.launch();
    }if(response.statusCode == 400){
      Get.snackbar('Caution', 'OTP must be 6 characters');
    }else{
      Get.snackbar('Something went Wrong', data['message']);
    }
  }

}
