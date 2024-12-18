import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../main.dar';

import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_button.dart';
import 'package:hikaya/app/modules/intro/views/widgets/onboarding_page.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                controller.selectedPageIndex.value = index;
              },
              children: controller.onboardingPages
                  .map((page) => OnboardingPage(page: page))
                  .toList(),
            ),
            Positioned(
              right: 20.w,
              top: 10.h,
              child: Obx(
                    () => TextButton(
                onPressed: () => Get.offAllNamed('/auth'),
                child: AppText(
                  text: 'تخطي',
                  color:controller.selectedPageIndex==0? Colors.white:AppColors.flagBlack,
                  fontSize: 18,
                ),
              ),
              ),
            ),
            // Bottom indicators and button
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 30.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dots indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingPages.length,
                      (index) => Obx(
                        () => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: controller.selectedPageIndex.value == index
                              ? 35.w
                              : 12.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            color: controller.selectedPageIndex.value == index
                                ? const Color(0xFF1B5E20)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.height,
                  // Next/Start button
                  Obx(
                    () => CustomButton(
                      backgraoundColor: AppColors.primary,
                      onPressed: () {
                        if (controller.selectedPageIndex.value ==
                            controller.onboardingPages.length - 1) {
                          Get.offAllNamed('/auth');
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      widget: AppText(
                        text: controller.selectedPageIndex.value ==
                                controller.onboardingPages.length - 1
                            ? 'ابدأ الآن'
                            : 'التالي',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
