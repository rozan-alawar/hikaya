import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/modules/home/controllers/home_controller.dart';
import 'package:hikaya/app/modules/home/views/Taps/profile/menu_item_widget.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            10.height,
            Center(
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_outline,
                    size: 50,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            16.height,
            // User Name
            CustomText(
              alignment: Alignment.center,
              controller.user?.displayName ?? "نور محمد",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),

         40.height,
            // Menu Items
            MenuItem(
                icon: Icons.notifications_outlined,
                title: 'الإشعارات',
                onTap: () => Get.toNamed(Routes.NOTIFICATION)),
        10.height,
            MenuItem(
                icon: Icons.info_outline,
                title: 'عن التطبيق',
                onTap: () => Get.toNamed(Routes.ABOUT)),
            10.height,

            MenuItem(
              icon: Icons.dark_mode_outlined,
              title: 'وضع داكن',
              trailing: Obx(() => Switch(
                    value: controller.isDarkMode,
                    onChanged: controller.toggleTheme,
                    activeColor: AppColors.primary,
                  )),
            ),
            10.height,

            MenuItem(
              icon: Icons.logout,
              title: 'تسجيل خروج',
              onTap: () => controller.signOut(),
              textColor: Colors.red,
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
