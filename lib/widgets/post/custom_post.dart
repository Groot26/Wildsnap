import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';

import '../../app/data/values/images.dart';

class CustomPost extends StatelessWidget {
  final String title;
  final String description;
  final int likes;

  CustomPost({
    required this.title,
    required this.description,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        //height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          // border: Border.all(
          //   width: 1,
          //   color: AppColors.primaryColor,
          // ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              //height: 310,
              width: double.infinity,
              decoration: BoxDecoration(
                // border: Border.all(
                //   width: 1,
                //   color: AppColors.white
                // ),
              ),
              child: Image.asset(Images.imgSamplePost)
            ),
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey,
                border: Border.all(
                  width: 1,
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Text("hi"),
            ),
          ],
        ),
      ),
    );
  }
}
