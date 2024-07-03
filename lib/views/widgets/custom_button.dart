// ignore_for_file: non_constant_identifier_names

import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:flutter/material.dart';

Widget CustomButton(
  BuildContext context, {
  String? selectedButton = "LOGIN",
  String title = "SIGN UP",
  IconData? icon,
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      decoration: BoxDecoration(
          color: selectedButton == title
              ? AppColors.primaryContainerBackground
              : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.primaryContainerBackground.withOpacity(0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 0.5,
              spreadRadius: .5,
            )
          ]),
      height: 70,
      width: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selectedButton == title
                ? Colors.white
                : AppColors.primaryContainerOverlay,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: selectedButton == title
                  ? Colors.white
                  : AppColors.primaryContainerOverlay,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget LoginSingUpButton(
  BuildContext context, {
  String title = "LOGIN",
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 60,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryContainerBackground,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 130, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.arrow_right_alt,
                size: 35,
                color: AppColors.primaryContainerBackground,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
