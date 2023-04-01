import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/data/values/strings.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:
        Text(Strings.appName),
      ),
    );
  }
}
