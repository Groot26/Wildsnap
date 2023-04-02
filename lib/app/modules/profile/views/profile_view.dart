
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/modules/editProfile/views/edit_profile_view.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  static launch() => Get.toNamed(Routes.PROFILE);

  // final String name;
  // final String username;
  // final String bio;
  // final String imageUrl;

  // ProfileView({
  //   required this.name,
  //   required this.username,
  //   required this.bio,
  //   required this.imageUrl,
  // });

  final List<String> imageUrls = [
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Expanded(
              //   child: Container(
              //     height: 100,
              //     width: 50,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.rectangle,
              //       image: DecorationImage(
              //         image:
              //        AssetImage(Images.imgSamplePost),
              //         fit: BoxFit.contain,
              //       ),
              //     ),
              //   ),
              // ),
              Column(
                //todo:make colum fixed
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Images.imgSamplePost),
                      radius: 66,
                    ),
                  ),
                  Text(
                   'sai',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sairaj Morajkar',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      'bio\nDOB\nVIRGIN\nMALE',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text('Edit Profile'),
                          onPressed: EditProfileView.launch,
                        ),
                        SizedBox(width:8),
                        ElevatedButton(
                          child: Text('Sign Out'),
                          onPressed: EditProfileView.launch,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Photos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '24',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Followers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '189',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Following',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '128',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(thickness: 5, height: 5),
          PhotoGridView(
            imageUrls: imageUrls,
          ),
        ],
      ),
    );
  }
}

class PhotoGridView extends StatelessWidget {
  final List<String> imageUrls;

  //final Function? onImageTap;

  PhotoGridView({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                print("hi " + imageUrls[index]);
              },
              child: Image.asset(
                imageUrls[index],
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }
}
