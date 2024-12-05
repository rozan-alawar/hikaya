// signup_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/validation.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/custom_button.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/core/widgets/custom_textfiled.dart';
import '../controllers/auth_controller.dart';

class SignupView extends GetView<AuthController> {
  SignupView({Key? key}) : super(key: key);

  final nameController = TextEditingController();
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
                    'إنشاء حساب جديد',
                    alignment: Alignment.center,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  8.height,
                  CustomText(
                    'فقط اتبع الخطوات التالية',
                    alignment: Alignment.center,
                    fontSize: 16,
                    color: AppColors.textLight,
                  ),
                  60.height,
                  CustomTextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                    hintText: 'الاسم',
                  ),
                  16.height,
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return value!.isValidEmail ;
                    },
                    hintText: 'البريد الإلكتروني',
                  ),
                  16.height,
                  Obx(
                        () => CustomTextField(
                      controller: passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      validator: (value) {
                        return value!.isValidPassword ;
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
                  24.height,
                  Obx(
                        () => CustomButton(
                          backgraoundColor: AppColors.primary,
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                            if (formKey.currentState!.validate()) {
                              await controller.signUp(
                                name: nameController.text,
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
                            'إنشاء حساب',
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
                        const Text('لديك حساب بالفعل؟'),
                        TextButton(
                          onPressed: controller.toggleView,
                          child: const Text(
                            'سجل دخولك',
                            style: TextStyle(color: AppColors.primary),
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