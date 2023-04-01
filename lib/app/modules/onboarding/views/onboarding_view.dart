import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wildsnap/app/data/values/images.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/app/modules/auth/login/views/auth_login_view.dart';
import 'package:wildsnap/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:wildsnap/app/routes/app_pages.dart';
import 'package:wildsnap/app/theme/app_colors.dart';
import 'package:wildsnap/app/theme/styles.dart';

class OnboardingView extends GetView<OnboardingController> {
  static launch() => Get.offAllNamed(Routes.ON_BOARDING);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Obx(
                      () => Visibility(
                        visible: controller.currentPage == 0 ? false : true,
                        maintainState: true,
                        child: InkWell(
                          customBorder: CircleBorder(),
                          onTap: controller.moveToPreviousScreen,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Images.icBack,
                              height: 14,
                              width: 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Obx(
                      () => Opacity(
                        opacity: controller.currentPage == 2 ? 0 : 1,
                        child: GestureDetector(
                          onTap: AuthLoginView.launch,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Strings.skip,
                              style: Styles.tsLightGreyBold12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: [
                    OnBoardingScreens(
                      title: Strings.onboardingTitle1,
                      description: Strings.onboardingDescription1,
                      image: Images.imgOnboarding1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              Images.imgOnboarding2,
                              height: 346,
                              width: 346,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(Strings.onboardingTitle2,
                              style: Styles.tsBlackBold24),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            Strings.onboardingDescription2,
                            style: Styles.tsDarkGreyNormal16,
                          ),
                        ],
                      ),
                    ),
                    OnBoardingScreens(
                      title: Strings.onboardingTitle3,
                      description: Strings.onboardingDescription3,
                      image: Images.imgOnboarding3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: controller.pageController,
                        count: 3,
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 6,
                          dotColor: AppColors.lightGrey,
                          activeDotColor: AppColors.primaryColor,
                        ),
                      ),
                      Spacer(),
                      Obx(
                        () => controller.currentPage == 2
                            ? ScreenController(
                                controller: controller,
                                button: Strings.start,
                                function: AuthLoginView.launch,
                              )
                            : ScreenController(
                                controller: controller,
                                button: Strings.next,
                                function: controller.moveToNextScreen,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenController extends StatelessWidget {
  final String button;
  final OnboardingController controller;
  final VoidCallback function;

  const ScreenController(
      {required this.controller, required this.button, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        width: 50,
        child: Center(
          child: Text(
            button,
            style: Styles.tsWhiteBold12,
          ),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.primaryColor),
      ),
    );
  }
}

class OnBoardingScreens extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnBoardingScreens({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Styles.tsBlackBold24),
          SizedBox(
            height: 18,
          ),
          Text(
            description,
            style: Styles.tsDarkGreyNormal16,
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Image.asset(
              image,
              height: 372,
              width: 372,
            ),
          ),
        ],
      ),
    );
  }
}
