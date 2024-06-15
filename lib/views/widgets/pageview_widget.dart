// ignore: file_names

import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/consts/app_image.dart';

import 'package:easyhome/views/pages/singup_login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

//* Animation onBoardingScreen
// Widget appOnBoardingScreen(
//   PageController pageController,
//   BuildContext context, {
//   String imagePath = AppAnimations.ANIMATION1,
//   String title = "",
//   String subTitle = "",
//   String buttonTitle = "Next",
//   index = "0",
// }) {
//   return Column(
//     children: [
//       SizedBox(
//         height: 320.h,
//         width: 320.w,
//         child: Lottie.asset(imagePath),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       Container(
//         margin: const EdgeInsets.only(top: 30),
//         child: Text(
//           title,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).colorScheme.onSurface,
//           ),
//         ),
//       ),
//       Container(
//         margin: const EdgeInsets.only(top: 30),
//         child: Text(
//           subTitle,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 16,
//             // fontWeight: FontWeight.bold,
//             color: Color.fromRGBO(28, 49, 68, 0.7),
//           ),
//         ),
//       ),
//       const Spacer(),
//       Padding(
//         padding: const EdgeInsets.only(bottom: 70),
//         child: LoginSingUpButton(
//           context,
//           title: "NEXT",
//           func: () {
//             if (index < 3) {
//               pageController.animateToPage(
//                 index,
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.linear,
//               );
//             } else {
//               Get.to(const SignupPage());
//             }
//           },
//         ),
//       )
//     ],
//   );
// }

Widget appStructure(
  PageController pageController,
  BuildContext context, {
  Color? color,
  String imagePath = "",
  String title = "",
  String subTitle = "",
  index = "0",
}) {
  return Stack(
    children: [
      Positioned(
        left: 8,
        top: 10,
        right: 8,
        child: Container(
          height: 503.h,
          width: 412.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 327.w,
                height: 266.h,
                margin: const EdgeInsets.only(top: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 15.h,
        left: 8,
        right: 8,
        child: Container(
          height: 466.h,
          width: 412.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.5,
                blurRadius: 1.5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TITLE
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text("TITLE"),
              ),

              //SUBTILE
              const Text("Subtitle"),

              //* Skip and Next Button
              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(const SignupPage());
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (index < 3) {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceOut,
                          );
                        } else {
                          Get.to(const SignupPage());
                        }
                      },
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: HexColor("2C569C"),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_right_alt,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
