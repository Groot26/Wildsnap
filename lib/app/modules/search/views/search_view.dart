import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/bottomBar/custom_bottom_bar.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  static launch() => Get.offAllNamed(Routes.SEARCH);

  final List<Map<String, String>> searchResults = [
    {
      'title': 'Result 1',
      'subtitle': 'Description for result 1',
      'imageUrl': 'Images.imgSample',
    },
    {
      'title': 'Result 2',
      'subtitle': 'Description for result 2',
      'imageUrl': 'Images.imgSample',
    },
    {
      'title': 'Result 3',
      'subtitle': 'Description for result 3',
      'imageUrl': 'Images.imgSample',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.white,
      //   foregroundColor: AppColors.primaryColor,
      //   child: Icon(Icons.add, size: 40),
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          Strings.appName,
          style: Styles.tsBlackBold24,
        ),
        //Add camera and send message
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SearchBar(),
            SearchResultTile(
              title: 'Result 1',
              subtitle: 'Description for result 1',
              imageUrl: Images.imgSample,
            ),
            SearchResultTile(
              title: 'Result 2',
              subtitle: 'Description for result 2',
              imageUrl: Images.imgSample,
            ),
          ],
        ),
      ),
    );
  }
}

//Search bar
class SearchBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform search operation here
              String query = searchController.text;
              print('Search query: $query');
            },
          ),
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
        leading: imageUrl.isNotEmpty
            ? CircleAvatar(
                backgroundImage: AssetImage(imageUrl) //Images.imgSample
                )
            : null,
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          // Perform action when tile is tapped
          print('Tile tapped: $title');
        },
      ),
    );
  }
}
