// auth_controller.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
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
      print(
          'Password: ${password.replaceAll(RegExp(r'.'), '*')}'); // Mask password for security

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
      print(
          'Last Sign In Time: ${userCredential.user?.metadata.lastSignInTime}');

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
        message = 'اسم المستخدم او كلمة المرور غير صحيحة';
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
      print(
          'Password: ${password.replaceAll(RegExp(r'.'), '*')}'); // Mask password for security

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
      Get.offAllNamed('/verification', arguments: {'email': email});

      await Future.delayed(const Duration(milliseconds: 500));
      CustomSnackBar.showCustomSnackBar(
        title: 'رمز التحقق الخاص بك هو: ',
        message: '6543',
        position: SnackPosition.TOP,

        duration: const Duration(seconds: 5),
      );
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

      if (code == "6543") {
        await Future.delayed(const Duration(seconds: 5));

        CustomSnackBar.showCustomSnackBar(
          title: 'نجاح',
          message: 'تم التحقق بنجاح',
        );
        Get.offAllNamed('/home');
      } else {
        CustomSnackBar.showCustomErrorSnackBar(
          title: 'خطأ',
          message: 'رمز التحقق غير صحيح',
        );
      }
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'خطأ', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendVerificationCode() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      CustomSnackBar.showCustomSnackBar(
        title: 'رمز التحقق الخاص بك هو: ',
        message: '6543',
        position: SnackPosition.TOP,

        duration: const Duration(seconds: 5),
      );
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'خطأ', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
    await _auth.signOut();
   } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'خطأ',
        message: 'حدث خطأ أثناء تسجيل الخروج',
      );
    }
}}
