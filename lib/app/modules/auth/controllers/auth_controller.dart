import 'package:get/get.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isLogin = true.obs;


  void toggleView() {
    isLogin.value = !isLogin.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      // Implement your sign in logic here
      // Example:
      // final response = await authRepository.signIn(email: email, password: password);
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      Get.offAllNamed('/home'); // Navigate to home after successful login
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }




  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      // Implement your sign up logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> forgotPassword({required String email}) async {
    try {
      isLoading.value = true;
      // Implement your forgot password logic here
      // await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      Get.snackbar(

        'نجاح',
        'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primary,
        colorText:  AppColors.white,
      );
      Get.toNamed(Routes.VERIFICATION); // Return to login screen
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
