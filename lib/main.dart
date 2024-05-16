import 'package:easyhome/consts/app_themedata.dart';
import 'package:easyhome/views/pages/singup_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: flexLightTheme,
      darkTheme: flexDarkTheme,
      themeMode: ThemeMode.system,
      home: const SignupPage(),
    );
  }
}