import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/app/modules/dashboard/views/dashboard_view.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import 'package:wildsnap/widgets/text_field/custom_text_field.dart';
import '../controllers/post_preview_controller.dart';

class PostPreviewView extends GetView<PostPreviewController> {
  static launch() => Get.toNamed(Routes.POST_PREVIEW);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'New Post',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
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
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.imgSamplePost),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextField(
                    inputType: TextInputType.text,
                    hintText: Strings.caption,
                    wrapper: controller.captionWrapper,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    inputType: TextInputType.name,
                    hintText: Strings.location,
                    wrapper: controller.locationWrapper,
                  ),
                  ElevatedButton(
                      onPressed: Get.back, child: Text('post'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
