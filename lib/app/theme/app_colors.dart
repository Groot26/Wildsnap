import 'package:flutter/material.dart';

class AppColors {
 // static const primaryColor = Color(0xFF000000);
  //static const white = Color(0xFFFFFFFF);
  static final shimmerBaseColor = Colors.grey[200]!;
  static final shimmerHighlightColor = Colors.grey[350]!;

  //copied
  static const primaryColor = Color(0xFF000000);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFA7A6A6);
  static const darkGrey = Color(0xFF6A6A6A);
  static const errorRed = Colors.redAccent;
  static const lightBlue = Color(0xFF4D9FD9);
  static const blue = Color(0xFF4198D7);
  static const grey = Color(0xFFCCCCCC);
  static const greyDark = Color(0xFFB5B5B5);
  static const greyLight = Color(0xFFEDEDED);
  static const blackGrey = Color(0xFF343434);
  static const green = Color(0xFF548B0E);
  static final grey10 = grey.withOpacity(0.1);
  static const pink = Color(0xFFEBABE4);
  static const darkPink = Color(0xFFB41FB7);
  static const bookingDetailsText = Color(0xFF6A6A6A);
  static const darkBlue = Color(0xFF275DAE);
  static final shadowColor = primaryColor.withOpacity(0.2);
  static const cardBg1 = Color(0xFF093145);
  static const cardBg2 = Color(0xFF107896);
  static const cardBg3 = Color(0xFF829356);
  static const cardBg4 = Color(0xFFBCA136);
  static const cardBg5 = Color(0xFFC2571A);

  static const cardBgs = [
    AppColors.cardBg1,
    AppColors.cardBg2,
    AppColors.cardBg3,
    AppColors.cardBg4,
    AppColors.cardBg5,
  ];
}
