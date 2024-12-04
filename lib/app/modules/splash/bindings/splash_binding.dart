import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';

import '../controllers/splash_controller.dart';
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppService(), permanent: true); // Use put instead of putAsync
    Get.put(SplashController());  // Use put instead of lazyPut
  }
}