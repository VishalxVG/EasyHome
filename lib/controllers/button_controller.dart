import 'package:get/get.dart';

class ButtonController extends GetxController {
  var selectedButton = "LOGIN".obs;

  void selectButton(String button) {
    selectedButton.value = button;
  }
}
