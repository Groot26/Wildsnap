import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.pink,
          border: Border.all(color: AppColors.primaryColor, width: 2)),
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Text('story'),
        ),
      ),
    );
  }
}
