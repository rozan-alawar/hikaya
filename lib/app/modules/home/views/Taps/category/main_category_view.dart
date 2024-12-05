import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/core/data/dummy_data.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/modules/home/controllers/home_controller.dart';
import 'package:hikaya/app/modules/home/views/Taps/profile/profile_view.dart';
import 'package:hikaya/app/routes/app_pages.dart';
class MainCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            40.ph(),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => HomeCategoryWidget(
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
                itemCount: AppDummyData.categoryHomeData.length,
              ),
            ),
            // Bottom Navigation Bar
          ],
        ),
      ),
    );
  }
}


class HomeCategoryWidget extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const HomeCategoryWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: AppText(text: title, fontSize: 20.17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}