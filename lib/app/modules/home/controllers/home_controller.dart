import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/widgets/custom_snackbar.dart';
import 'package:hikaya/app/modules/auth/controllers/auth_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxInt currentIndex = 2.obs;
  User? user = FirebaseAuth.instance.currentUser;
  final RxBool isDarkMode = false.obs;

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
  }

  void changeBottomNavIndex(int index) {
    currentIndex.value = index;
    update();
  }

  String getAppBarText(int value) {
    switch (value) {
      case 2:
        return 'أهم المقالات';
      case 1:
        return 'الأقسام الرئيسية';
      case 0:
        return 'الملف الشخصي';
      default:
        return '';
    }
  }
  
  Future<void> signOut() async {
    try {
      await Get.find<AuthController>().signOut();
      Get.offAllNamed('/auth');
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'خطأ',
        message: 'حدث خطأ أثناء تسجيل الخروج',
      );
    }
  }
}
