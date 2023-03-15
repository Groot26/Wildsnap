import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/modules/auth/login/controllers/auth_login_controller.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/buttons/primary_filled_button.dart';
import 'package:starter/widgets/text_field/custom_text_field.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  static launch() => Get.offAllNamed(Routes.AUTH_LOGIN);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.imLogin),
                Padding(
                  padding: const EdgeInsets.only(top: 52, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.loginAccount,
                        style: Styles.tsBlackBold24,
                      ),
                      Text(
                        Strings.loginMessage,
                        style: Styles.tsDarkGreyNormal16,
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  wrapper: controller.mobileWrapper,
                  hintText: Strings.mobileNumber,
                  maxLength: 10,
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 4.0),
                CustomTextField(
                  wrapper: controller.mobileWrapper,
                  hintText: Strings.password,
                  inputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 8.0),
                PrimaryFilledButton(
                    // text: Strings.requestOTP,
                    text: Strings.login,
                    onTap: HomeView.launch //controller.sendOTP,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
