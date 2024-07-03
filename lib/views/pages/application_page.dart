import 'package:easyhome/consts/app_colorscheme.dart';
import 'package:easyhome/controllers/bottom_navigation_controller.dart';
import 'package:easyhome/views/widgets/application_page/applicaton_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  BottomNavigationController controller = Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        body: Obx(() => buildPage(controller.index.value, context)),
        bottomNavigationBar: Obx(
          () => MoltenBottomNavigationBar(
            borderRaduis: BorderRadius.circular(15),
            domeCircleColor: AppColors.primaryContainerBackground,
            curve: Curves.easeIn,
            barColor: Colors.white,
            borderSize: 1,
            tabs: bottomTabs,
            borderColor: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            selectedIndex: controller.index.value,
            onTabChange: (index) {
              controller.updateIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
