// ignore_for_file: file_names

import 'package:dots_indicator/dots_indicator.dart';
import 'package:easyhome/consts/app_image.dart';
import 'package:easyhome/controllers/dot_controller.dart';
import 'package:easyhome/views/widgets/pageview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final DotController dotController = Get.put(DotController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                dotController.updateIndex(value);
              },
              children: [
                appOnBoardingScreen(
                  _pageController,
                  context,
                  imagePath: AppAnimations.ANIMATION3,
                  title: "MAKE A BUDGET",
                  subTitle:
                      "Take control of your spending by creating personalized budgets tailored to your lifestyle and financial goals.",
                  index: 1,
                ),
                appOnBoardingScreen(
                  _pageController,
                  context,
                  imagePath: AppAnimations.ANIMATION1,
                  title: "TRACK YOUR SPENDING",
                  subTitle:
                      "Stay informed about your daily expenses and habits with our intuitive spending tracker",
                  index: 2,
                ),
                appOnBoardingScreen(
                  _pageController,
                  context,
                  imagePath: AppAnimations.ANIMATION2,
                  title: "ANALYZE YOUR FINANCES",
                  subTitle:
                      "Gain valuable insights into your financial health and make informed decisions",
                  index: 3,
                ),
              ],
            ),
            Obx(
              () => Positioned(
                bottom: 30,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: dotController.index.value,
                  decorator: DotsDecorator(
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
        ),
      )),
    );
  }
}
