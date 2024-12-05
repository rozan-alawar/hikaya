// verification_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_button.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import '../controllers/auth_controller.dart';
// verification_view.dart
class VerificationView extends GetView<AuthController> {
  VerificationView({Key? key}) : super(key: key);

  final List<TextEditingController> otpControllers = List.generate(
    4,
        (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    4,
        (index) => FocusNode(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
            alignment: Alignment.center   ,
               'التحقق من الرمز',
                fontSize: 24,
                fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            CustomText(
              alignment: Alignment.center   ,
              'يرجى التحقق من بريدك الإلكتروني ... لرؤية رمز التحقق',

                fontSize: 16,
                color: AppColors.textLight,
            ),
           60.height,
            CustomText(
              alignment: Alignment.topRight   ,
              'رمز التحقق',

                fontSize: 16,
                fontWeight: FontWeight.w600,

            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                    (index) => SizedBox(
                  width: 80,
                  child: TextFormField(
                    controller: otpControllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        focusNodes[index + 1].requestFocus();
                      }
                      if (value.isEmpty && index > 0) {
                        focusNodes[index - 1].requestFocus();
                      }
                      if (index == 3 && value.length == 1) {
                        String code = otpControllers.map((controller) => controller.text).join();
                        verifyEnteredCode(code);
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Obx(
                    () => CustomButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    String code = otpControllers.map((controller) => controller.text).join();
                    verifyEnteredCode(code);
                  },
                  widget: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'تحقق',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  backgraoundColor: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => controller.resendVerificationCode(),
                child: const Text(
                  'إعادة إرسال الرمز',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verifyEnteredCode(String code) {
    if (code == "6543") {
      Get.snackbar(
        'نجاح',
        'تم التحقق بنجاح',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed('/home');
    } else {
      Get.snackbar(
        'خطأ',
        'رمز التحقق غير صحيح',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }

  }
}