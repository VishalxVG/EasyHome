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
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Scaffold(
          body: Obx(() => buildPage(controller.index.value, context)),
          bottomNavigationBar: Obx(
            () => MoltenBottomNavigationBar(
              borderRaduis: BorderRadius.circular(8),
              curve: Curves.easeIn,
              barColor: Theme.of(context).colorScheme.secondaryContainer,
              tabs: bottomTabs,
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              selectedIndex: controller.index.value,
              onTabChange: (index) {
                controller.updateIndex(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
