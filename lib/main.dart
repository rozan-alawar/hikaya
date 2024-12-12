import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_theme.dart';
import 'package:hikaya/firebase_options.dart';
import 'app/routes/app_pages.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() => AppService().init(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();
    return Obx(() => SafeArea(
      child: GetMaterialApp(
        title: 'حكاية',
        debugShowCheckedModeBanner: false,
        // initialRoute: AppPages.INITIAL,
        initialRoute: Routes.HOME,
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
          ),
    ),
    );
  }
}

//rozan@gmail.com