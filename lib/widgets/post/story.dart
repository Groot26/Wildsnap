import 'package:flutter/material.dart';
import 'package:wildsnap/app/theme/app_colors.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.blue,
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
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
