// forgot_password_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/validation.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/custom_button.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/core/widgets/custom_textfiled.dart';
import '../controllers/auth_controller.dart';

class ForgotPasswordView extends GetView<AuthController> {
  ForgotPasswordView({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'نسيت كلمة المرور',
                    alignment: Alignment.center,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  16.height,
                  CustomText(
                    'أدخل حساب الايميل الخاص بك لاسترداد حسابك',
                    alignment: Alignment.center,
                    fontSize: 16,
                    color: AppColors.textLight,
                  ),
                  32.height,
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return value!.isValidEmail ;
                    },
                    hintText: 'البريد الالكتروني',
                  ),
                  24.height,
                  Obx(
                        () => SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                        backgraoundColor: AppColors.primary,
                        onPressed: controller.isLoading.value
                            ? null
                            : () async {
                          if (formKey.currentState!.validate()) {
                            // Call forgot password function from controller
                            await controller.forgotPassword(
                              email: emailController.text,
                            );
                          }
                        },
                        widget: controller.isLoading.value
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const CustomText(
                          'إعادة تعيين كلمة المرور',
                          alignment: Alignment.center,
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                      ),
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
