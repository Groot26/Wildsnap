import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../widgets/buttons/primary_filled_button.dart';
import '../../../../../widgets/text_field/custom_text_field.dart';
import '../../../../data/values/images.dart';
import '../../../../data/values/strings.dart';
import '../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/styles.dart';
import '../controllers/auth_verify_otp_controller.dart';

class AuthVerifyOtpView extends GetView<AuthVerifyOtpController> {
  static launch() => Get.toNamed(Routes.AUTH_VERIFY_OTP);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: Get.back,
                child: SvgPicture.asset(
                  Images.icBack,
                  height: 14,
                  width: 6,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.enterOTP, style: Styles.tsBlackBold24),
                      Row(
                        children: [
                          Text(
                            Strings.sentTo,
                            style: Styles.tsDarkGreyNormal16,
                          ),
                          Text(
                           'your email',
                            style: Styles.tsDarkGreyNormal16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 40),
              CustomTextField(
                wrapper: controller.emailWrapper,
                hintText: Strings.email,
                //maxLength: 10,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              OTPTextField(
                length: 6,
                width: Get.width,
                fieldWidth: 40,
                style: TextStyle(fontSize: 15),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                onCompleted: controller.onOTPChanged,
                onChanged: controller.onOTPChanged,
              ),
              SizedBox(height: 30),
              CustomTextField(
                wrapper: controller.passWrapper,
                hintText: Strings.password,
                inputType: TextInputType.visiblePassword,
              ),
              Spacer(),
              PrimaryFilledButton(
                text: Strings.submit,
                onTap: controller.verifyOTP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
