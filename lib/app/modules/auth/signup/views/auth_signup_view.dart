
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import 'package:wildsnap/app/theme/styles.dart';
import 'package:wildsnap/widgets/buttons/primary_filled_button.dart';
import 'package:wildsnap/widgets/text_field/custom_text_field.dart';
import '../controllers/auth_signup_controller.dart';

class AuthSignupView extends GetView<AuthSignupController> {
  static launch() => Get.toNamed(Routes.AUTH_SIGNUP);

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
                      hintText: Strings.email,
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
                                  DateFormat('yyyy-MM-dd')
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
                    controller.completeProfile();
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
