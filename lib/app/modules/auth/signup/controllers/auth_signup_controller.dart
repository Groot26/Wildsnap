import 'package:get/get.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/modules/dashboard/views/dashboard_view.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/helper/validators.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class AuthSignupController extends GetxController {
  //TODO: Implement AuthSignupController

  final nameWrapper = TextFieldWrapper();
  final userNameWrapper = TextFieldWrapper();
  final phoneWrapper = TextFieldWrapper();
  final emailWrapper = TextFieldWrapper();
  final dobWrapper = TextFieldWrapper();
  final passwordWrapper = TextFieldWrapper();
  DateTime? dob;


  completeProfile() async {
    final name = nameWrapper.controller.text;
    final userName = userNameWrapper.controller.text;
    final phoneNumber = phoneWrapper.controller.text;
    final email = emailWrapper.controller.text;
    final password = passwordWrapper.controller.text;

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
      passwordWrapper.errorText = ErrorMessages.invalidPassword;
    }

    registrationUser();
  }

  //Signup api
  Future registrationUser() async {
    var url = Uri.parse('http://3.109.185.64:3001/api/auth/signup');
    //json mapping user entered details
    Map mapData = {
      'name': nameWrapper.controller.text,
      'username': userNameWrapper.controller.text,
      'phone': phoneWrapper.controller.text,
      'email': emailWrapper.controller.text,
      'dob': '1990-01-01',//controller.dobWrapper.controller.text,
      'password':passwordWrapper.controller.text,
    };

    http.Response response = await http.post(url, body: mapData);

    var data = jsonDecode(response.body);
    print("DATA: $data");
    DashboardView.launch();
  }

}