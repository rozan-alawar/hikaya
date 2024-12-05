// login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/validation.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/custom_button.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/core/widgets/custom_textfiled.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  LoginView({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  92.height,
                  CustomText(
                    'سجل دخولك الآن',
                    alignment: Alignment.center,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  8.height,
                  CustomText(
                    'لنستطيع البدء بالرحلة',
                    alignment: Alignment.center,
                    fontSize: 16,
                    color: AppColors.textLight,
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    hintText: 'البريد الإلكتروني',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return  value!.isValidEmail;

                    },
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomTextField(

                      controller: passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      validator: (value) {
                        return value!.isValidPassword;
                      },
                      hintText: 'كلمة المرور',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => Get.toNamed('/forgot-password'),
                      child: const Text(
                        'هل نسيت كلمة السر؟',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  24.height,
                  Obx(
                    () => CustomButton(
                      backgraoundColor: AppColors.primary,
                      onPressed: controller.isLoading.value
                          ? null
                          : () async {
                              if (formKey.currentState!.validate()) {
                                await controller.signIn(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                      widget: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const CustomText(
                              'تسجيل الدخول',
                              alignment: Alignment.center,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('لا تمتلك حساب؟'),
                        TextButton(
                          onPressed: controller.toggleView,
                          child: const Text(
                            'أنشئ حساب الآن',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
