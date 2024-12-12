import 'package:get/get.dart';
import 'package:hikaya/app/data/dummy_data.dart';

import '../../../models/course_model.dart';
import '../../../routes/app_pages.dart';

class CoursesController extends GetxController {
  //TODO: Implement HomeController
   final courseModel= AppDummyData.coursesData.obs;

   final selectedCourseModel = Rx<CourseModel?>(null);

  void selectCourseModel(CourseModel courseModel){
    selectedCourseModel.value = courseModel;
    Get.toNamed(Routes.COURSEDETAILSVIEW, arguments: courseModel);
  }

}
