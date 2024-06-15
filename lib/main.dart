import 'package:easyhome/firebase_options.dart';

import 'package:easyhome/views/pages/onboarding_screen.dart';

import 'package:easyhome/views/themes/app_themedata.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: flexLightTheme,
          darkTheme: flexDarkTheme,
          themeMode: ThemeMode.system,
          home: const OnboardingScreen(),
        );
      },
    );
  }
}
