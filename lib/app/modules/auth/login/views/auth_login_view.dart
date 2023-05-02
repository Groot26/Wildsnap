import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/data/models/request/auth_request.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/app/modules/auth/login/controllers/auth_login_controller.dart';
import 'package:wildsnap/app/modules/auth/signup/views/auth_signup_view.dart';
import 'package:wildsnap/app/modules/auth/verify-otp/views/auth_verify_otp_view.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import 'package:wildsnap/app/theme/styles.dart';
import 'package:wildsnap/widgets/buttons/primary_filled_button.dart';
import 'package:wildsnap/widgets/text_field/custom_text_field.dart';

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
                  wrapper: controller.emailWrapper,
                  hintText: Strings.email,
                  //maxLength: 10,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 4.0),
                CustomTextField(
                  wrapper: controller.passWrapper,
                  hintText: Strings.password,
                  inputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 8),
                PrimaryFilledButton(
                  text: Strings.login,
                  onTap: controller.validityCheck,
                ),
                SizedBox(height: 5),
                PrimaryFilledButton(
                  text: Strings.signup,
                  onTap: AuthSignupView.launch,
                ),
                SizedBox(height: 10),
                Center(
                  child: InkWell(
                    child: Text(Strings.forgetPassword),
                    onTap: AuthVerifyOtpView.launch,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
