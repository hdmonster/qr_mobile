import 'package:get/get.dart';

class MainController extends GetxController {
  // Bottom nav index
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void switchIndex(index) => currentIndex.value = index;
}
