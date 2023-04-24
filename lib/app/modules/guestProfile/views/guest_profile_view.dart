import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../controllers/guest_profile_controller.dart';

class GuestProfileView extends GetView<GuestProfileController> {
  static launch() => Get.toNamed(Routes.GUEST_PROFILE);

  final List<String> imageUrls = [
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
    'assets/images/img_sample_post.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        // title: Text(
        //   'New Post',
        //   style: TextStyle(color: AppColors.black),
        // ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                //todo:make colum fixed
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        controller.profileDetails.profilePic,
                      ),
                      radius: 66,
                    ),
                  ),
                  Text(
                    controller.profileDetails.userName,
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
                      controller.profileDetails.name,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      controller.profileDetails.phone +
                          "\n" +
                          controller.profileDetails.email +
                          "\n" +
                          controller.profileDetails.dob,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.grey,
                      ),
                    ),
                    //if(controller.profileDetails.bio==null)
                    // Text(
                    //   controller.profileDetails.bio!,
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: AppColors.grey,
                    //   ),
                    // ),
                    // Row(
                    //   children: [
                    //     ElevatedButton(
                    //       child: Text('Edit Profile'),
                    //       onPressed: EditProfileView.launch,
                    //     ),
                    //     SizedBox(width: 8),
                    //     ElevatedButton(
                    //       child: Text('Sign Out'),
                    //       onPressed: () async {
                    //         await controller.signOut();
                    //         AuthLoginView.launch();
                    //       },
                    //     ),
                    //   ],
                    // ),
                        Center(
                          child: ElevatedButton(
                            child: Text('Follow'),
                            onPressed: (){},
                          ),
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
                    imageUrls.length.toString(),
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
                    '0',
                    //controller.profileDetails.followersCount.toString(),
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
                    '0',
                    //controller.profileDetails.followingCount.toString(),
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
