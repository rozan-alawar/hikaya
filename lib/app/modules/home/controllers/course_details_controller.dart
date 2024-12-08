import 'package:get/get.dart';
import 'package:hikaya/app/models/episode_model.dart';

class CourseDetailsController extends GetxController {
  //TODO: Implement HomeController



  final currentTabIndex = 1.obs;
  final selectedEpisodeIndex = 0.obs;

  void selectEpisode(int index) {
    selectedEpisodeIndex.value = index;
  }

  void setTabIndex(int index) {
    currentTabIndex.value = index;
  }


}
