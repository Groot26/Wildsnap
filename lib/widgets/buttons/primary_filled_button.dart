import 'package:flutter/material.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import 'package:wildsnap/app/theme/styles.dart';

class PrimaryFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  PrimaryFilledButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: onTap,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          text,
          style: Styles.tsWhiteRegular18,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
