import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/core/data/dummy_data.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: controller.currentIndex.value == 2
                ? Container(
                    child: Icon(Icons.notifications_none_outlined),
                    margin: EdgeInsets.symmetric(horizontal: 12),
                  )
                : 0.ph(),
            centerTitle: true,
            title: AppText(
              text: getAppBarText(controller.currentIndex.value),
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
              profileScreen(),
              homeCategoryScreen(),
              homeScreen(),
            ],
          ),
        ));
  }

  Widget homeScreen() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              AppText(
                text:
                    ' ابدأ الآن واكتشف تجربة تعليمية ممتعة دليلك بين يديك في مكان واحد',
                fontSize: 25,
              ),
              Image.asset(
                'assets/images/line_under_text.png',
                height: 10.3,
                width: 63,
              )
            ],
          ),

          50.ph(),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => _buildHomeWidget(
                      image: AppDummyData.HomeData[index].imagePath,
                      title: AppDummyData.HomeData[index].title,
                      by: AppDummyData.HomeData[index].by,
                      url: AppDummyData.HomeData[index].url,
                      date: AppDummyData.HomeData[index].date,
                    ),
                separatorBuilder: (context, index) => 16.ph(),
                itemCount: AppDummyData.HomeData.length),
          ),

          // Bottom Navigation Bar
        ],
      ),
    ));
  }

  Widget homeCategoryScreen() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          40.ph(),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => _buildHomeCategoryWidget(
                        image: 'assets/images/flag1.png',
                        title: AppDummyData.categoryHomeData[index].title,
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(Routes.COURSES);
                          } else if (index == 1) {
                            Get.toNamed(Routes.ACTIVITIESANDSTORY);
                          } else {
                            Get.toNamed(Routes.GAME);
                          }
                        },
                      ),
                  separatorBuilder: (context, index) => 40.ph(),
                  itemCount: AppDummyData.categoryHomeData.length)),

          // Bottom Navigation Bar
        ],
      ),
    ));
  }

  Widget profileScreen() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xff1E6C41),
                )),
            child: Icon(
              Icons.person_outline,
              size: 200,
              color: Color(0xff1E6C41),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Expanded(
              flex: 8,
              child: ListView.separated(
                  itemBuilder: (context, index) => _buildProfileWidget(
                        image: 'assets/images/flag1.png',
                        title: 'البلاد والكثبان الرملية معامله',
                        subtitle: 'للطلبات من للتعاملات',
                        price: '115.99',
                        rating: '4.8',
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                  itemCount: 7)),
          Expanded(
              flex: 1,
              child: _buildProfileWidget(
                image: 'assets/images/flag1.png',
                title: 'البلاد والكثبان الرملية معامله',
                subtitle: 'للطلبات من للتعاملات',
                price: '115.99',
                rating: '4.8',
              )),
        ],
      ),
    ));
  }

  Widget _buildHomeWidget({
    required String image,
    required String title,
    required String by,
    required String url,
    required String date,
  }) {
    return Container(
      height: 140,
      width: 335,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: title, fontSize: 14),
                AppText(text: by, fontSize: 16),
                AppText(text: url, fontSize: 16, color: Color(0xff7D848D)),
                11.ph(),
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    AppText(
                        text: date,
                        fontSize: 13,
                        color: const Color(0xff7D848D))
                  ],
                )
              ],
            ),
            11.pw(),
            Container(
              height: 116,
              width: 95,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeCategoryWidget(
      {required String image,
      required String title,
      required void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 161,
        width: 341,
        decoration: const BoxDecoration(
          color: Colors.red,
          // borderRadius: BorderRadius.circular(16)
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 136,
              width: 276,
              color: Colors.amber,
            ),
            Container(
              height: 47,
              width: 341,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: AppText(text: title, fontSize: 20.17),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileWidget({
    required String image,
    required String title,
    required String subtitle,
    required String price,
    required String rating,
  }) {
    return const ListTile(
      title: Text(
        'الرئيسية ',
        style: TextStyle(fontSize: 16, color: Color(0xff868686)),
      ),
      leading: Icon(Icons.home_filled),
    );
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
}
