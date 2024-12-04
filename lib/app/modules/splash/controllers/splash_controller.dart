import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final _appService = Get.find<AppService>();
  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    handleNavigation();
  }

  Future<void> handleNavigation() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash screen duration

    if (_appService.isFirstTime()) {
      await _appService.setFirstTime(false);
      Get.offAllNamed(Routes.INTRO);
    } else {
      if (_auth.currentUser != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.AUTH);
      }
    }
  }
}