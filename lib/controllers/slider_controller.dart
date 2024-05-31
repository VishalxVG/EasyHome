import 'package:get/get.dart';

class SliderController extends GetxController {
  var sliderPosition = 0.0.obs;
  var userType = "Owner".obs;

  void updatePosition(double delta, double maxWidth) {
    sliderPosition.value += delta;
    sliderPosition.value = sliderPosition.value.clamp(0.0, maxWidth - 100);
    userType.value =
        sliderPosition.value < (maxWidth / 2 - 50) ? "Owner" : "Tennet";
  }
}
