import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';

import '../../app/data/values/images.dart';

class CustomPost extends StatelessWidget {
  final String userName;
  final String description;
  final bool likes;
  //final AssetImage profileImg;

  CustomPost({
    required this.userName,
    required this.description,
    required this.likes,
    //required this.profileImg,
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
                child: Image.asset(Images.imgSamplePost)),
            Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.greyDark,
                  border: Border.all(
                    width: 1,
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        Images.imgSample,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userName, style: TextStyle(fontSize: 18)),
                        Text(description, style: TextStyle(fontSize: 14))
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 28,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
