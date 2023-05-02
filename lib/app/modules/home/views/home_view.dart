import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/widgets/post/custom_post.dart';
import 'package:wildsnap/widgets/post/story.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static launch() => Get.toNamed(Routes.HOME);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //todo story
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //       Story(),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.fromLTRB(16,16,16,0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: controller.postsDash.value.length,
                  itemBuilder: (context, index) {
                    final currentPost = controller.postsDash[index];
                    final currentUser = controller.postsDash[index].user!;
                    return Obx(
                        ()=> CustomPost(
                        onLikeTap: () {
                          controller.isLiked.value = !controller.isLiked.value;
                        },
                        profilePic: currentUser.profilePic ,
                        userName: currentUser.userName,
                        description: currentPost.caption,
                        imageUrl: currentPost.imageUrl,
                        lat: currentPost.location.lat,
                        lng: currentPost.location.lng,
                        isLiked: controller.isLiked.value,
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
