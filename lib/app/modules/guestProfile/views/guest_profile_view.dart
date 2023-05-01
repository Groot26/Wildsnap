import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/guest_profile_controller.dart';

class GuestProfileView extends GetView<GuestProfileController> {
  static launch(int index) =>
      Get.toNamed(Routes.GUEST_PROFILE, arguments: {"index": index});

  @override
  Widget build(BuildContext context) {
    final guestUserData =
        controller.searchController.posts[Get.arguments['index']];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: AppColors.white,
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
                        guestUserData.image,
                      ),
                      radius: 66,
                    ),
                  ),
                  Text(
                    guestUserData.userName,
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
                      guestUserData.name,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      guestUserData.phone +
                          "\n" +
                          guestUserData.email +
                          "\n" +
                          guestUserData.dob,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.grey,
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text('Follow/Unfollow'),
                        onPressed: controller.followUnfollow,
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
                    //'0',
                    guestUserData.followers.toString(),
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
                    //'0',
                    guestUserData.following.toString(),
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
      child: Obx(
        () => GridView.builder(
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.9,
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
    );
  }
}
