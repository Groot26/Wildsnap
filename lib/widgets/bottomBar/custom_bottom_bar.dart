import 'package:flutter/material.dart';
import 'package:wildsnap/app/modules/activity/views/activity_view.dart';
import 'package:wildsnap/app/modules/home/views/home_view.dart';
import 'package:wildsnap/app/modules/profile/views/profile_view.dart';
import 'package:wildsnap/app/modules/search/views/search_view.dart';
import 'package:wildsnap/app/theme/app_colors.dart';

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
            icon: const Icon(Icons.home, color: AppColors.white),
            onPressed: HomeView.launch,
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search, color: AppColors.white),
            onPressed: SearchView.launch,
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            tooltip: 'Activity',
            icon: const Icon(Icons.favorite, color: AppColors.white),
            onPressed: ActivityView.launch,
          ),
          IconButton(
            tooltip: 'Profile',
            icon: const Icon(Icons.account_circle, color: AppColors.white),
            onPressed: ProfileView.launch,
          ),
        ],
      ),
    );
  }
}
