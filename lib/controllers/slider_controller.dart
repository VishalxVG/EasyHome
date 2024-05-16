import 'package:get/get.dart';

class SliderController extends GetxController {
  var sliderPosition = 0.0.obs;
  var isOwner = true.obs;

  void updatePosition(double delta, double maxWidth) {
    sliderPosition.value += delta;
    sliderPosition.value = sliderPosition.value.clamp(0.0, maxWidth - 100);
    isOwner.value = sliderPosition.value < (maxWidth / 2 - 50);
  }
}
