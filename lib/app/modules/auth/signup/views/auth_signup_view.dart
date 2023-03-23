import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:starter/app/app.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/buttons/primary_filled_button.dart';
import 'package:starter/widgets/text_field/custom_text_field.dart';
import '../controllers/auth_signup_controller.dart';

class AuthSignupView extends GetView<AuthSignupController> {
  static launch() => Get.offAllNamed(Routes.AUTH_SIGNUP);

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
                    DOBInputField(
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      showLabel: true,
                      dateFormatType: DateFormatType.DDMMYYYY,
                      autovalidateMode: AutovalidateMode.disabled,
                      fieldLabelText: 'DOB',
                      inputDecoration: InputDecoration(
                        errorText: 'Invalid DOB',
                        errorStyle: Styles.tsPrimaryColorRegular18,
                        counterText: '',
                        fillColor: AppColors.white,
                        filled: true,
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.errorRed,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    //TODO: Gender Selector
                    SizedBox(height: 12),
                  ],
                ),
                PrimaryFilledButton(
                  text: Strings.proceed,
                  onTap: controller.completeProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
