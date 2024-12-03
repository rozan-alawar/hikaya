import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/modules/auth/views/login_view.dart';
import 'package:hikaya/app/modules/auth/views/signup_view.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: controller.isLogin.value ? LoginView() : SignupView(),
      )),
    );

  }
}
