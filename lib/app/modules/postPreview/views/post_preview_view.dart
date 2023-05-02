import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/data/values/strings.dart';
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
            Obx(
              () => controller.imageFile.value == null
                  ? GestureDetector(
                      onTap: () => controller.getImage(ImageSource.gallery),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        color: AppColors.grey,
                        child: Center(
                          child: Text('Pick Image'),
                        ),
                      ),
                    )
                  : Container(
                      height: 300,
                      width: double.infinity,
                      child: Image.file(
                        controller.imageFile.value!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
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
                  SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: () {
                        controller.getLocation();
                      },
                      child: Text('Get Location')),
                  SizedBox(height: 8),
                  CustomTextField(
                    inputType: TextInputType.name,
                    hintText: Strings.lat,
                    wrapper: controller.latWrapper,
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    inputType: TextInputType.name,
                    hintText: Strings.long,
                    wrapper: controller.longWrapper,
                  ),
                  ElevatedButton(
                      onPressed: Get.back,
                      //     () async {
                      //   await controller.uploadImage();
                      //   // await controller.post(Post(
                      //   //   caption: controller.captionWrapper.controller.text,
                      //   //   image: 'https://imgtr.ee/images/2023/03/30/UlyXX.png',
                      //   //   location: Location(
                      //   //       lat: controller.latWrapper.controller.text,
                      //   //       lng: controller.longWrapper.controller.text),
                      //   // ));
                      // },
                      child: Text('post')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
