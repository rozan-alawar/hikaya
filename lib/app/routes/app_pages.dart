import 'package:get/get.dart';
import 'package:hikaya/app/modules/home/bindings/activities_and_story_binding.dart';
import 'package:hikaya/app/modules/home/bindings/courses_binding.dart';
import 'package:hikaya/app/modules/home/views/activities_and_story_view.dart';
import 'package:hikaya/app/modules/home/views/courses_view.dart';
import 'package:hikaya/app/modules/splash/bindings/splash_binding.dart';
import 'package:hikaya/app/modules/splash/views/splash_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/course_details_binding.dart';
import '../modules/home/bindings/game_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/course_details_view.dart';
import '../modules/home/views/game_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
      GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.COURSES,
      page: () => const CoursesView(),
      binding: CoursesBinding(),
    ),
    GetPage(
      name: _Paths.COURSEDETAILSVIEW,
      page: () => const CourseDetailsView(),
      binding: CourseDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITIESANDSTORY,
      page: () => const ActivitiesAndStoryView(),
      binding: ActivitiesAndStoryBinding(),
    ),

    GetPage(
      name: _Paths.GAME,
      page: () => const GameView(),
      binding: GameBinding(),
    ),
  ];
}