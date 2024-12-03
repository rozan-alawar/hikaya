import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),() {
      Get.toNamed(Routes.AUTH);
    },);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpeg',
              width: 367,
              height: 367,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1B5E20)), // داكن أخضر
            // ),
          ],
        ),
      ),
    );
  }
}
