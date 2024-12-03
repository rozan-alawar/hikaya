import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hikaya/app/modules/home/controllers/courses_controller.dart';

import '../controllers/home_controller.dart';

class CoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesController>(() => CoursesController());
  }
}