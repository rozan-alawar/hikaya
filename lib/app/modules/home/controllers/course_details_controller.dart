import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/data/dummy_data.dart';
import 'package:hikaya/app/models/course_model.dart';
import 'package:hikaya/app/models/episode_model.dart';
import 'package:hikaya/app/modules/home/controllers/courses_controller.dart';

class CourseDetailsController extends GetxController {
  //TODO: Implement HomeController
  final coursesController = Get.find<CoursesController>();


  final currentTabIndex = 1.obs;
  int selectedEpisodeIndex = 0;
  late var selectedImage=coursesController.selectedCourseModel.value!.episodeModel[0].image.obs;
  late var linkOfVideo=coursesController.selectedCourseModel.value!.episodeModel[0].url.obs;

  late Rx<CourseModel?> currentCourse= Rx<CourseModel?>(null);

  void selectEpisode(int index) {
    selectedEpisodeIndex = index;
    selectedImage.value=coursesController.selectedCourseModel.value!.episodeModel[index].image;
    linkOfVideo.value=coursesController.selectedCourseModel.value!.episodeModel[index].url;
    update();
  }

  void setTabIndex(int index) {
    currentTabIndex.value = index;
  }


}
