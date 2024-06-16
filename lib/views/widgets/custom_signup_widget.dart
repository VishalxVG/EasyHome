import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/consts/app_image.dart';
import 'package:flutter/material.dart';

Widget customSignUpOptions({
  String title = "SIGN IN GOOGLE",
  String? imagePath = AppIcons.GOOGLELOGO,
  void Function()? ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: SizedBox(
      width: 200,
      height: 50,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath!,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget customButton({
  void Function()? ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: const EdgeInsets.only(
        left: 80,
        top: 60,
      ),
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryContainerBackground,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "SIGN IN EMAIL",
              style: TextStyle(color: Colors.white),
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
