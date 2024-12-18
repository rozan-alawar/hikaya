import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_theme.dart';
import 'package:hikaya/app/core/widgets/custom_snackbar.dart';
import 'package:hikaya/app/modules/auth/controllers/auth_controller.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxInt currentIndex = 2.obs;
  User? user = FirebaseAuth.instance.currentUser;
  final appService = Get.find<AppService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void toggleTheme(bool value) async {
    await appService.saveThemeMode(value);
  }

  bool get isDarkMode => appService.isDarkMode.value;

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
      await _auth.signOut();
      print('done');
      Get.offAllNamed(Routes.AUTH);
    } catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'خطأ',
        message: 'حدث خطأ أثناء تسجيل الخروج',
      );
    }
  }
}
