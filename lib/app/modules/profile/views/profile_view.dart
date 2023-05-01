import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/modules/auth/login/views/auth_login_view.dart';
import 'package:wildsnap/app/modules/editProfile/views/edit_profile_view.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  static launch() => Get.toNamed(Routes.PROFILE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text('Edit Profile'),
                          onPressed: EditProfileView.launch,
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          child: Text('Sign Out'),
                          onPressed: () async {
                            await controller.signOut();
                            AuthLoginView.launch();
                          },
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
                    controller.postsDash.value.length.toString(),
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
            post: controller.postsDash,
          ),
        ],
      ),
    );
  }
}

class PhotoGridView extends StatelessWidget {
  final RxList<Post> post;

  //final Function? onImageTap;

  PhotoGridView({required this.post});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Obx(
          () => GridView.builder(
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: post.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Image.network(
                  post[index].imageUrl,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
