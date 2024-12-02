import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

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
}
