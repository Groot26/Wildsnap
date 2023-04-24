import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/modules/guestProfile/views/guest_profile_view.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  static launch() => Get.toNamed(Routes.SEARCH);

  late final List<Map<String, dynamic>> searchResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchBar(),
            Obx(
              ()=> ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                return SearchResultTile(
                  title: controller.posts[index].name,
                  subtitle:  controller.posts[index].userName,
                  imageUrl: controller.posts[index].image,
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}

//Search bar
class SearchBar extends StatelessWidget {
final controller = Get.find<SearchController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller.searchWrapper.controller,
        onChanged: (value) async {
          String query = controller.searchWrapper.controller.text;
          print('Search query: $query');
         await controller.searchUser(query);
        },
        decoration: InputDecoration(
          hintText: 'Search...',
        ),
      ),
    );
  }
}

//Search Result tiles
class SearchResultTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const SearchResultTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl),
        // leading: imageUrl.isNotEmpty
        //     ? CircleAvatar(
        //         backgroundImage: AssetImage(imageUrl) //Images.imgSample
        //         )
        //     : null,
        title: Text(title),
        subtitle: Text(subtitle),
        onTap:
          // Perform action when tile is tapped
          GuestProfileView.launch
          //print("guest view");
          //print('Tile tapped: $title');

      ),
    );
  }
}
