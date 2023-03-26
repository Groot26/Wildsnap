import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/text_field/custom_text_field.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  static launch() => Get.offAllNamed(Routes.EDIT_PROFILE);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  bool _isMale = true;
  bool _isFemale = false;
  bool _isOther = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          Strings.appName,
          style: Styles.tsBlackBold24,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(Images.imgSample),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
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
                hintText: Strings.email ,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12),
              //TODO: Gender Selector
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
