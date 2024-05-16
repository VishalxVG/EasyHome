// ignore_for_file: non_constant_identifier_names

import 'package:easyhome/consts/app_image.dart';
import 'package:easyhome/views/widgets/custom_button.dart';
import 'package:easyhome/views/widgets/cutom_textfiled.dart';
import 'package:flutter/material.dart';

Widget SingInPage(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "WELCOME BACK",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        appTextField(
          context,
          text: "Email",
          hintText: "Type your email",
          icon: AppIcons.EMAIL,
        ),
        const SizedBox(
          height: 10,
        ),
        appTextField(
          context,
          text: "Password",
          hintText: "Type your password",
          icon: AppIcons.LOCK,
          isPasswordFiled: true,
        ),
        const SizedBox(
          height: 30,
        ),
        LoginSingUpButton(
          context,
          func: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {},
            child: const Text("Forgot Password ? "),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(AppIcons.GOOGLELOGO),
              radius: 15,
            ),
            SizedBox(
              width: 30,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(AppIcons.APPLELOGO),
              radius: 15,
            ),
            SizedBox(
              width: 30,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(AppIcons.PHONEAUTH),
              radius: 20,
            ),
          ],
        )
      ],
    ),
  );
}