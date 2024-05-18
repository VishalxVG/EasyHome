import 'package:easyhome/views/pages/application_page.dart';
import 'package:easyhome/views/pages/welcome_page.dart';
import 'package:easyhome/views/themes/app_themedata.dart';

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
      home: const ApplicationPage(),
    );
  }
}
