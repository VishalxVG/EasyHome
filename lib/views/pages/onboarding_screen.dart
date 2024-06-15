// ignore_for_file: file_names

import 'package:dots_indicator/dots_indicator.dart';
import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/consts/app_image.dart';

import 'package:easyhome/controllers/dot_controller.dart';
import 'package:easyhome/views/widgets/pageview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final DotController dotController = Get.put(DotController());
  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              dotController.updateIndex(value);
            },
            children: [
              appStructure(
                _pageController,
                context,
                index: 1,
                imagePath: AppImage.PAGE1,
                color: AppColors.PAGE1COLOR,
              ),
              appStructure(
                _pageController,
                context,
                index: 2,
                imagePath: AppImage.PAGE2,
                color: AppColors.PAGE2COLOR,
              ),
              appStructure(
                _pageController,
                context,
                index: 3,
                imagePath: AppImage.PAGE3,
                color: AppColors.PAGE3COLOR,
              )
            ],
          ),
          Obx(
            () => Positioned(
              top: 360.h,
              child: DotsIndicator(
                dotsCount: 3,
                position: dotController.index.value,
                decorator: DotsDecorator(
                  color: Colors.white,
                  activeColor: HexColor("2C569C"),
                  size: const Size.square(9.0),
                  activeSize: const Size(18, 8),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
