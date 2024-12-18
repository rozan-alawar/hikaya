import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/data/dummy_data.dart';
import 'package:hikaya/app/modules/home/controllers/home_controller.dart';
import 'package:hikaya/app/modules/home/views/Taps/profile/profile_view.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class MainCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            40.height,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => HomeCategoryWidget(
                  image: AppDummyData.categoryHomeData[index].image,
                  title: AppDummyData.categoryHomeData[index].title,
                  onTap: () {
                    switch (index) {
                      case 0:
                        Get.toNamed(Routes.COURSES);
                        break;
                      case 1:
                        Get.toNamed(Routes.ACTIVITIESANDSTORY);
                        break;
                      case 2:
                        Get.toNamed(Routes.GAME);
                        break;
                    }
                  },
                ),
                separatorBuilder: (context, index) => 30.height,
                itemCount: AppDummyData.categoryHomeData.length,
              ),
            ),
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
        height: 170.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                image,

                fit: BoxFit.cover,
                alignment: AlignmentDirectional.center,
              ),
            ),
            // Green overlay at the bottom
            Positioned(
              bottom: 0.w,
              left: 0.w,
              right: 0.h,
              child: Container(
                height: 40.h,
                decoration:  BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: CustomText(
                  title,
                  alignment: Alignment.center,
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
