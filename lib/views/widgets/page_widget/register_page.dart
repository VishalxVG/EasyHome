// ignore_for_file: non_constant_identifier_names

import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/consts/app_image.dart';

import 'package:easyhome/controllers/signup_controller.dart';
import 'package:easyhome/controllers/slider_controller.dart';
import 'package:easyhome/views/widgets/custom_button.dart';
import 'package:easyhome/views/widgets/cutom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final SliderController controller = Get.put(SliderController());
SignupController signupController = Get.put(SignupController());
Widget RegisterPage(BuildContext context) {
  final maxWidth = MediaQuery.of(context).size.width - 144;

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
      key: signupController.formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),

          Text(
            "PLEASE CREATE A ACCOUNT",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Draggable container
          Obx(
            () => Stack(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Owner',
                        style: TextStyle(
                          fontSize: 15,
                          color: controller.userType.value == "Owner"
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                      Text(
                        'Tenant',
                        style: TextStyle(
                          fontSize: 15,
                          color: controller.userType.value == "Owner"
                              ? Colors.black
                              : Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: controller.sliderPosition.value,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      controller.updatePosition(details.delta.dx, maxWidth);
                    },
                    child: Container(
                      width: 170,
                      height: 50,
                      decoration: BoxDecoration(
                        color: controller.userType.value == "Owner"
                            ? AppColors.primaryContainerBackground
                            : Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          controller.userType.value == "Owner"
                              ? 'Owner'
                              : 'Tenant',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          appTextField(
            context,
            hintText: "Type your name",
            icon: AppIcons.PROFILE,
            func: (value) => signupController.updateUsername(value),
            validator: (value) => signupController.validateUserName(value),
          ),
          const SizedBox(
            height: 20,
          ),
          appTextField(
            context,
            hintText: "Type your email",
            icon: AppIcons.EMAIL,
            func: (value) => signupController.updateEmail(value),
            validator: (value) => signupController.validateEmail(value),
          ),
          const SizedBox(
            height: 20,
          ),
          appTextField(
            context,
            hintText: "Type your password",
            icon: AppIcons.LOCK,
            isPasswordFiled: true,
            func: (value) => signupController.updatePassword(value),
            validator: (value) => signupController.validatePassword(value),
          ),
          const SizedBox(
            height: 20,
          ),
          appTextField(
            context,
            hintText: "Type your password",
            icon: AppIcons.LOCK,
            isPasswordFiled: true,
            func: (value) => signupController.updateRePassword(value),
            validator: (value) => signupController.validatePassword(value),
          ),
          const SizedBox(
            height: 30,
          ),
          LoginSingUpButton(
            title: "SIGN UP",
            context,
            func: () {
              signupController.onRegister();
              signupController.createUserWithEmailAndPassword(
                signupController.email.value,
                signupController.password.value,
                context,
              );
            },
          ),
        ],
      ),
    ),
  );
}
