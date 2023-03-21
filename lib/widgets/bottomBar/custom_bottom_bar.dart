import 'package:flutter/material.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/app/modules/search/views/search_view.dart';
import 'package:starter/app/theme/app_colors.dart';

class CustomBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      height: 50,
      shape: CircularNotchedRectangle(),
      color: AppColors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            tooltip: 'Home',
            icon: const Icon(Icons.home,color: AppColors.white),
            onPressed:(){HomeView.launch();},
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search,color: AppColors.white),
            onPressed: SearchView.launch,
          ),
          SizedBox(width: 20,),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.favorite,color: AppColors.white),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Profile',
            icon: const Icon(Icons.account_circle,color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
    //   BottomNavigationBar(
    //   elevation: 0,
    //   iconSize: 28,
    //   type: BottomNavigationBarType.fixed,
    //   backgroundColor: AppColors.white,
    //   selectedItemColor: AppColors.primaryColor,
    //   unselectedItemColor: AppColors.primaryColor,// Colors.white.withOpacity(.60),
    //   selectedFontSize: 14,
    //   unselectedFontSize: 14,
    //   //shape: CircularNotchedRectangle(),
    //   onTap: (value) {
    //     // Respond to item press.
    //   },
    //   items: [
    //     BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.home_outlined)),
    //     BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.search)),
    //     BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.heart_broken_rounded)),
    //     BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.account_circle_outlined)),
    //   ],
    // );
  }
}
