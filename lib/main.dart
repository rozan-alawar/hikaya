import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_theme.dart';
import 'package:hikaya/app/modules/home/controllers/course_details_controller.dart';
import 'package:hikaya/app/modules/home/controllers/courses_controller.dart';
import 'package:hikaya/firebase_options.dart';
import 'app/core/services/connectivity_service.dart';
import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() => AppService().init(), permanent: true);
  Get.put(CoursesController());
  Get.put(ConnectivityService());
  Get.put(AuthController());

  Get.put(CourseDetailsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return Obx(() => GetMaterialApp(
          title: 'حكاية',
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          // initialRoute: Routes.SPLASH,
          getPages: AppPages.routes,
          locale: const Locale('ar'),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appService.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          // supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            // AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ));
      },
    );

  }
}

//rozan@gmail.com