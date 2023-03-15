import 'package:flutter/material.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/theme/app_colors.dart';

class CustomBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 28,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.primaryColor,// Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.heart_broken_rounded)),
        BottomNavigationBarItem(label: Strings.empty, icon: Icon(Icons.account_circle_outlined)),
      ],
    );
  }
}
