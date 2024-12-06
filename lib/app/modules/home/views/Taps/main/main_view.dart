import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/core/data/dummy_data.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
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
    return Obx(() =>
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: controller.currentIndex.value == 2
                ? Container(
              child: Icon(Icons.notifications_none_outlined),
              margin: EdgeInsets.symmetric(horizontal: 12),
            )
                : 0.ph(),
            centerTitle: true,
            title: AppText(
              text: controller.getAppBarText(controller.currentIndex.value),
              fontSize: 20,
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