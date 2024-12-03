// verification_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/custom_button.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import '../controllers/auth_controller.dart';

class VerificationView extends GetView<AuthController> {
  VerificationView({Key? key}) : super(key: key);

  final List<TextEditingController> codeControllers = List.generate(
    4,
        (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(
    4,
        (index) => FocusNode(),
  );

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'التحقق من الرمز',
                  alignment: Alignment.center,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                16.height,
                CustomText(
                  'يرجى التحقق من بريدك الإلكتروني ... لرؤية رمز التحقق',
                  alignment: Alignment.center,
                  fontSize: 16,
                  color: AppColors.textLight,
                ),
                32.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                        (index) => SizedBox(
                      width: 70,
                      height: 60,
                      child: TextFormField(
                        controller: codeControllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
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
                        final code = codeControllers
                            .map((controller) => controller.text)
                            .join();
                        if (code.length == 4) {
                          await controller.verifyCode(code);
                        }
                      },
                      widget: controller.isLoading.value
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const CustomText(
                        'تحقق',
                        alignment: Alignment.center,
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                24.height,
                Center(
                  child: TextButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.resendVerificationCode(),
                    child: const Text(
                      'إعادة إرسال الرمز',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in codeControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
  }
}

// Add these methods to your AuthController
extension VerificationMethods on AuthController {
  Future<void> verifyCode(String code) async {
    try {
      isLoading.value = true;
      // Implement your verification logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      Get.offAllNamed('/home'); // Navigate to home after successful verification
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendVerificationCode() async {
    try {
      isLoading.value = true;
      // Implement your resend code logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      Get.snackbar(
        'نجاح',
        'تم إرسال رمز جديد إلى بريدك الإلكتروني',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'خطأ',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}