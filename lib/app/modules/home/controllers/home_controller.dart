import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxInt currentIndex = 2.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeBottomNavIndex(int index) {
    currentIndex.value = index;
    update();
  }

  void increment() => count.value++;
}
