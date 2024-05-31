import 'package:easyhome/controllers/slider_controller.dart';
import 'package:easyhome/views/pages/singup_login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

SliderController controller = Get.put(SliderController());

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  var username = "".obs;
  var email = "".obs;
  var password = "".obs;
  var rePassword = "".obs;
  var userType = controller.userType;

  void updateEmail(String value) {
    email.value = value;
  }

  void updateUsername(String value) {
    username.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  void updateRePassword(String value) {
    rePassword.value = value;
  }

  //VALIDATIONS

  String? validateUserName(String? name) {
    if (name == null || name.isEmpty) {
      return "Username cannot be empty";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    if (!GetUtils.isEmail(value)) {
      return "Email is not valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
      return "Password is less than 6";
    }
    if (password != rePassword) {
      return "Password doesnot match";
    }
    return null;
  }

  Future onRegister() async {
    if (!formkey.currentState!.validate()) {
      Get.snackbar(
        "Error",
        "Register validation failed",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // SIGNUP AUTHENTICATION LOGIC
  Future<void> createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar("Success", "Register Successfull");
      Get.offAll(() => const SignupPage());
      // if (credential.user != null) {
      //   await credential.user?.sendEmailVerification();
      //   await credential.user?.updateDisplayName(username.toString());
      //   Get.snackbar(
      //     "Check Email",
      //     "A mail is sent to your registered email for varificaiton",
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      //   Get.back();
      // }
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = ("The password provided is too weak");
      } else if (e.code == "invalid-email") {
        message = ("Your email id is invalid");
      } else if (e.code == "email-already-in-use") {
        message = ("The email is already in use");
      }
      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
