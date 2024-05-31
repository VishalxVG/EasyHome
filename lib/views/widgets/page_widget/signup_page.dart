// ignore_for_file: non_constant_identifier_names

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
  final maxWidth = MediaQuery.of(context).size.width - 120;

  return Container(
    padding: const EdgeInsets.all(10),
    child: Form(
      key: signupController.formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          Text(
            "PLEASE CREATE A ACCOUNT",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Draggable container
          Obx(
            () => Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
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
                      height: 40,
                      decoration: BoxDecoration(
                        color: controller.userType.value == "Owner"
                            ? Colors.blue
                            : Colors.green,
                        borderRadius: BorderRadius.circular(12),
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
            height: 20,
          ),
          appTextField(
            context,
            text: "Username",
            hintText: "Type your name",
            icon: AppIcons.PROFILE,
            func: (value) => signupController.updateUsername(value),
            validator: (value) => signupController.validateUserName(value),
          ),
          const SizedBox(
            height: 10,
          ),
          appTextField(
            context,
            text: "Email",
            hintText: "Type your email",
            icon: AppIcons.EMAIL,
            func: (value) => signupController.updateEmail(value),
            validator: (value) => signupController.validateEmail(value),
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
            func: (value) => signupController.updatePassword(value),
            validator: (value) => signupController.validatePassword(value),
          ),
          const SizedBox(
            height: 10,
          ),
          appTextField(
            context,
            text: "Confirm Password",
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
