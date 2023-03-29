import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/buttons/primary_filled_button.dart';
import 'package:starter/widgets/text_field/custom_text_field.dart';
import '../controllers/auth_signup_controller.dart';

class AuthSignupView extends GetView<AuthSignupController> {
  static launch() => Get.toNamed(Routes.AUTH_SIGNUP);

  Future RegistrationUser() async {
    // url to registration php script
    var url = Uri.parse('http://face-brunei.at.ply.gg:40791/api/auth/signup');
    //json maping user entered details
    Map mapeddate = {
      'name': controller.nameWrapper.controller.text,
      'username': controller.userNameWrapper.controller.text,
      'phone': controller.phoneWrapper.controller.text,
      'email': controller.emailWrapper.controller.text,
      'dob': '1990-01-01',//controller.dobWrapper.controller.text,
      'password': controller.passwordWrapper.controller.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(url, body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");
    HomeView.launch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: Get.back,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      Images.icBack,
                      height: 14,
                      width: 6,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  Strings.almostThere,
                  style: Styles.tsPrimaryColorSemiBold34,
                ),
                Text(
                  Strings.about,
                  style: Styles.tsLightGreyMedium14,
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      inputType: TextInputType.name,
                      hintText: Strings.name,
                      wrapper: controller.nameWrapper,
                    ),
                    SizedBox(height: 12),
                    CustomTextField(
                      inputType: TextInputType.name,
                      hintText: Strings.userName,
                      wrapper: controller.userNameWrapper,
                    ),
                    SizedBox(height: 12),
                    CustomTextField(
                      hintText: Strings.number,
                      maxLength: 10,
                      wrapper: controller.phoneWrapper,
                      inputType: TextInputType.phone,
                    ),
                    SizedBox(height: 12),
                    CustomTextField(
                      wrapper: controller.emailWrapper,
                      hintText: Strings.email + ' (Optional)',
                      inputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 12),
                    CustomTextField(
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1947),
                              lastDate: DateTime.now(),
                            );
                            controller.dob = date;
                            if (controller.dob != null) {
                              controller.dobWrapper.controller.text =
                                  DateFormat('yyyy-MM-DD')
                                      .format(controller.dob!);
                            } else {
                              controller.dobWrapper.controller.text = '';
                            }
                          },
                          child: Icon(Icons.calendar_month)),
                      hintText: Strings.dateOfBirth,
                      wrapper: controller.dobWrapper,
                      inputType: TextInputType.phone,
                      readOnly: true,
                    ),
                    SizedBox(height: 12),
                    CustomTextField(
                      wrapper: controller.passwordWrapper,
                      hintText: Strings.password,
                      inputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
                PrimaryFilledButton(
                  text: Strings.proceed,
                  onTap: (){
                    RegistrationUser();
                  }//controller.completeProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
