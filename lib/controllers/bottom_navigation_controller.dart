import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt index = 0.obs;

  void updateIndex(int value) {
    index.value = value;
  }
}
