import 'episode_model.dart';

class CourseModel{
  String imageCoursePath;
  String courseName;
  List<EpisodeModel> episodeModel;
  String description;
  CourseModel({
    required this.imageCoursePath,
    required this.courseName,
    required this.description,
    required this.episodeModel,
});
}