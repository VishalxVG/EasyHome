// ignore_for_file: non_constant_identifier_names

import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/consts/app_image.dart';
import 'package:easyhome/controllers/signin_controller.dart';

import 'package:easyhome/views/widgets/custom_button.dart';
import 'package:easyhome/views/widgets/cutom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SigninController signInController = Get.put(SigninController());
Widget SingInPage(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(45),
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
      ],
    ),
    child: Form(
      key: signInController.formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "WELCOME BACK! GLAD TO SEE YOUR AGAIN",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          appTextField(
            context,
            hintText: "EMAIL",
            icon: AppIcons.EMAIL,
            isPasswordFiled: false,
            func: (value) {
              signInController.updateEmail(value);
            },
            validator: (value) => signInController.validateEmail(value),
          ),
          const SizedBox(
            height: 20,
          ),
          appTextField(
            context,
            hintText: "PASSWORD",
            icon: AppIcons.LOCK,
            isPasswordFiled: true,
            func: (value) {
              signInController.updatePassword(value);
            },
            validator: (value) => signInController.validatePassword(value),
          ),
          const SizedBox(
            height: 40,
          ),
          LoginSingUpButton(
            context,
            func: () {
              print(signInController.email.value);
              print(signInController.password.value);
              signInController.onLogin();
              signInController.signInWithEmailAndPassword(
                signInController.email.value,
                signInController.password.value,
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password ? ",
                style: TextStyle(color: AppColors.primaryContainerBackground),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
