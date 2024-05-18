import 'package:easyhome/consts/app_image.dart';

import 'package:easyhome/controllers/button_controller.dart';
import 'package:easyhome/views/widgets/custom_button.dart';
import 'package:easyhome/views/widgets/page_widget/signin_page.dart';
import 'package:easyhome/views/widgets/page_widget/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonController controller = Get.put(ButtonController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: 250,
                  height: 180,
                  child: Image(
                    image: AssetImage(AppImage.LOGO),
                  ),
                ),
                Column(
                  children: [
                    // LOGIN - SIGNUP BUTTON
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Login Butoon
                          Obx(() => CustomButton(
                                context,
                                title: "LOGIN",
                                selectedButton: controller.selectedButton.value,
                                icon: Icons.login,
                                func: () {
                                  controller.selectButton("LOGIN");
                                },
                              )),

                          // SIGNUP button
                          Obx(() => CustomButton(
                                context,
                                title: "SIGN UP",
                                selectedButton: controller.selectedButton.value,
                                func: () {
                                  controller.selectButton("SIGN UP");
                                },
                                icon: Icons.person_add_alt_1,
                              )),
                        ],
                      ),
                    ),
                    // LOGIN - SINGUP PAGE
                    Obx(
                      () => controller.selectedButton.value == "LOGIN"
                          ? SingInPage(context)
                          : RegisterPage(context),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
