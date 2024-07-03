import 'package:easyhome/views/pages/application_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  //Form key
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString email = "".obs;
  RxString password = "".obs;

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  //VALIDATIONS

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
    return null;
  }

  Future onLogin() async {
    if (!formKey.currentState!.validate()) {
      Get.snackbar(
        "Error",
        "Login validation failed",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
  }

  //! FIREBASE AUTHENCATION LOGIC USING EMAIL AND PASSWORD
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Successfull Singin
      Get.snackbar(
        'Success',
        'Signed in Successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to HomePage
      Get.off(const ApplicationPage());
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = "User not found for that email";
      } else if (message == 'wrong-password') {
        message = 'Wrong Email or Password';
      } else {
        message = e.message ?? "An error occured";
      }
      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        "An unexpected error occoured",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
