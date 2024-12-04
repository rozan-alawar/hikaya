// auth_controller.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/widgets/custom_snackbar.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isLogin = true.obs;
  Rxn<User?> user = Rxn<User?>();


  void toggleView() {
    isLogin.value = !isLogin.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      print('🚀 Sign In Request:');
      print('Email: $email');
      print('Password: ${password.replaceAll(RegExp(r'.'), '*')}'); // Mask password for security

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('\n✅ Sign In Response:');
      print('User ID: ${userCredential.user?.uid}');
      print('Email: ${userCredential.user?.email}');
      print('Email Verified: ${userCredential.user?.emailVerified}');
      print('Display Name: ${userCredential.user?.displayName}');
      print('Creation Time: ${userCredential.user?.metadata.creationTime}');
      print('Last Sign In Time: ${userCredential.user?.metadata.lastSignInTime}');

      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      String message = 'حدث خطأ ما';

      print('\n❌ Sign In Error:');
      print('Error Code: ${e.code}');
      print('Error Message: ${e.message}');
      print('Full Error: $e');

      if (e.code == 'user-not-found') {
        message = 'لم يتم العثور على المستخدم';
      } else if (e.code == 'wrong-password') {
        message = 'كلمة المرور غير صحيحة';
      } else if (e.code == 'invalid-credential') {
        message = 'بيانات الاعتماد غير صحيحة';
      }
      CustomSnackBar.showCustomErrorSnackBar(title: 'خطأ', message: message);
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
      print('🚀 Sign Up Request:');
      print('Name: $name');
      print('Email: $email');
      print('Password: ${password.replaceAll(RegExp(r'.'), '*')}'); // Mask password for security

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('\n✅ Sign Up Response:');
      print('User ID: ${userCredential.user?.uid}');
      print('Email: ${userCredential.user?.email}');
      print('Creation Time: ${userCredential.user?.metadata.creationTime}');

      await userCredential.user?.updateDisplayName(name);
      print('Display Name Updated: $name');

      await userCredential.user?.sendEmailVerification();
      print('Verification Email Sent');

      Get.offAllNamed('/verification', arguments: {'email': email});
    } on FirebaseAuthException catch (e) {
      String message = 'حدث خطأ ما';

      print('\n❌ Sign Up Error:');
      print('Error Code: ${e.code}');
      print('Error Message: ${e.message}');
      print('Full Error: $e');

      if (e.code == 'weak-password') {
        message = 'كلمة المرور ضعيفة جداً';
      } else if (e.code == 'email-already-in-use') {
        message = 'البريد الإلكتروني مستخدم بالفعل';
      } else if (e.code == 'invalid-email') {
        message = 'البريد الإلكتروني غير صالح';
      }
      CustomSnackBar.showCustomErrorSnackBar(title: 'خطأ', message: message);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      isLoading.value = true;
      await _auth.sendPasswordResetEmail(email: email);
      Get.toNamed('/verification', arguments: {'email': email});
      Get.snackbar(
          'نجاح', 'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني',
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      String message = 'حدث خطأ ما';
      if (e.code == 'user-not-found') {
        message = 'لم يتم العثور على المستخدم';
      }
      CustomSnackBar.showCustomErrorSnackBar(title: 'خطأ', message: message);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyCode(String code) async {
    try {
      isLoading.value = true;
      final email = Get.arguments['email'] as String;

      // For email verification
      // if (user.value?.emailVerificationCode == code) {
      //   await user.value?.reload();
      //   Get.offAllNamed('/home');
      // } else {
      //   Get.snackbar('خطأ', 'رمز التحقق غير صحيح', snackPosition: SnackPosition.BOTTOM);
      // }
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title: 'خطأ', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendVerificationCode() async {
    try {
      isLoading.value = true;
      if (user.value != null) {
        await user.value?.sendEmailVerification();
        Get.snackbar('نجاح', 'تم إرسال رمز جديد إلى بريدك الإلكتروني',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(title: 'خطأ', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
