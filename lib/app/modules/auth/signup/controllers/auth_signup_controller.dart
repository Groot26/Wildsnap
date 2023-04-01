import 'package:get/get.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/app/modules/dashboard/views/dashboard_view.dart';
import 'package:wildsnap/utils/helper/text_field_wrapper.dart';
import 'package:wildsnap/utils/helper/validators.dart';
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

    //todo: 1upper,1lower,1char,1number,>8
    // if (password.isValidPassword()) {
    //   passwordWrapper.errorText = ErrorMessages.invalidPassword;
    // }

    //registrationUser();
    isUsernameAvailable();
  }

  Future isUsernameAvailable() async {

    final userName = userNameWrapper.controller.text;

    var url = Uri.parse('http://3.109.185.64:3001/api/auth/username/$userName/available');

    http.Response response = await http.get(url);

    if (response.statusCode == 409) {
      print('UserName Not Available');
      userNameWrapper.errorText = ErrorMessages.userNameNotAvailable;
    }
    else if (response.statusCode == 200) {
      print('UserName Available');
      userNameWrapper.errorText = ErrorMessages.userNameAvailable;
      registrationUser();
    }
    else {
      print('something went wrong!!');
    }
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
      'dob':  dobWrapper.controller.text,
      'password':passwordWrapper.controller.text,
    };

    http.Response response = await http.post(url, body: mapData);

    var data = jsonDecode(response.body);
    print("DATA: $data");
    DashboardView.launch();
  }

}