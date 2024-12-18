import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/modules/home/controllers/home_controller.dart';
import 'package:hikaya/app/modules/home/views/Taps/category/main_category_view.dart';
import 'package:hikaya/app/modules/home/views/Taps/main/home_view.dart';
import 'package:hikaya/app/modules/home/views/Taps/profile/profile_view.dart';
import 'package:hikaya/app/routes/app_pages.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return Obx(() =>
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: controller.currentIndex.value == 2
                ? Padding(
              padding: EdgeInsets.only(right: 10.0.w),
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appService.isDarkMode.value ? AppColors.flagBlack.withOpacity(0.8) : AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius:12.r,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    onTap:()=>Get.toNamed(Routes.NOTIFICATION),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 25,
                    ),
                  ),
                ),
              ),
            )
                : 0.ph(),
            centerTitle: true,
            title: AppText(
              text: controller.getAppBarText(controller.currentIndex.value),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => controller.changeBottomNavIndex(value),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined),
                  label: 'الملف الشخصي'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: 'الأقسام الرئيسية'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'الرئيسية'),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Color(0xff1E6C41),
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: [
              ProfileView(),
              MainCategoryScreen(),
              HomeScreen()
            ],
          ),
        ));
  }
}