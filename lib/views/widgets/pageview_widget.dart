// ignore: file_names

import 'package:easyhome/consts/app_image.dart';
import 'package:easyhome/views/pages/singup_login.dart';
import 'package:easyhome/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget appOnBoardingScreen(
  PageController pageController,
  BuildContext context, {
  String imagePath = AppAnimations.ANIMATION1,
  String title = "",
  String subTitle = "",
  String buttonTitle = "Next",
  index = "0",
}) {
  return Column(
    children: [
      SizedBox(
        height: 320,
        width: 320,
        child: Lottie.asset(imagePath),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            // fontWeight: FontWeight.bold,
            color: Color.fromRGBO(28, 49, 68, 0.7),
          ),
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: LoginSingUpButton(
          context,
          title: "NEXT",
          func: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            } else {
              Get.to(const SignupPage());
            }
          },
        ),
      )
    ],
  );
}

// Widget nextButton(String buttontitle, index, PageController pageController,
//     BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//       if (index < 3) {
//         pageController.animateToPage(
//           index,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.linear,
//         );
//       } else {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => const SignupPage()));
//       }
//     },
//     child: Container(
//       width: 325,
//       height: 50,
//       margin: const EdgeInsets.symmetric(
//         horizontal: 25,
//         vertical: 80,
//       ),
//       // decoration: appBoxShadow(),
//       child: Center(
//         child: Text(
//           buttontitle,
//         ),
//       ),
//     ),
//   );
// }
