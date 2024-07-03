import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        appBar: mainPageAppBar(context),
      ),
    );
  }
}
