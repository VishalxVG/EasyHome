import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/consts/app_image.dart';
import 'package:easyhome/views/pages/singup_login.dart';
import 'package:easyhome/views/widgets/custom_signup_widget.dart';
import 'package:flutter/material.dart';

class SignupOptionsPage extends StatelessWidget {
  const SignupOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //* APP LOGO

              Container(
                margin: const EdgeInsets.only(top: 30, left: 81),
                child: Image.asset(
                  AppImage.LOGO,
                  width: 200,
                  height: 150,
                ),
              ),

              //* GOOGLE , APPLE , PHONE AUTH

              Container(
                margin: const EdgeInsets.only(
                  left: 80,
                  top: 30,
                ),
                child: const Text(
                  "LOGIN WITH",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primaryContainerOverlay,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 40, left: 70),
                width: 220,
                height: 200,
                child: Column(
                  children: [
                    customSignUpOptions(
                      ontap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customSignUpOptions(
                      title: "SIGN IN APPLE",
                      imagePath: AppIcons.APPLELOGO,
                      ontap: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customSignUpOptions(
                      title: "SIGN IN PHONE",
                      imagePath: AppIcons.PHONE,
                      ontap: () {},
                    )
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.only(
                  left: 80,
                  top: 30,
                ),
                child: const Text(
                  "(OR)",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryContainerOverlay,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //* SIGN IN WITH EMAIL

              customButton(
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ));
                },
              ),

              //* REGISTER TEXT BUTTON
              Container(
                margin: const EdgeInsets.only(left: 80, top: 10),
                width: 252,
                child: Row(
                  children: [
                    const Text("Dont Have an Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ));
                      },
                      child: const Text(
                        "SIGNUP",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.primaryContainerBackground,
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
    );
  }
}
