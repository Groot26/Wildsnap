import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/text_field/custom_text_field.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  static launch() => Get.toNamed(Routes.EDIT_PROFILE);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? imageFile;

  //File? newImage;

  void getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    Image.network(
                      'https://imgtr.ee/images/2023/03/30/UlyXX.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    imageFile == null
                        ? Text('No Profile')
                        : Container(
                            child: Image.file(
                              imageFile!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => getImage(ImageSource.gallery),
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
                            DateFormat('dd/MM/yyyy').format(controller.dob!);
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
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: ()  {
                     controller.updateProfile();
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Profile Updated"),
                      ),
                    );
                  },
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
