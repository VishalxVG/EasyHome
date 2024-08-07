import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/consts/app_image.dart';

import 'package:easyhome/controllers/button_controller.dart';
import 'package:easyhome/views/widgets/custom_button.dart';
import 'package:easyhome/views/widgets/auth_page_widgets/signin_page.dart';
import 'package:easyhome/views/widgets/auth_page_widgets/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonController controller = Get.put(ButtonController());
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            child: const Icon(
              Icons.arrow_left_rounded,
              size: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: 200,
                  height: 130,
                  child: Image(
                    image: AssetImage(
                      AppImage.LOGO,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    // LOGIN - SIGNUP BUTTON
                    Row(
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
