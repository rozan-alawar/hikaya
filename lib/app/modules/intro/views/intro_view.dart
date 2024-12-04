import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../main.dar';

import 'package:get/get.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_button.dart';
import 'package:hikaya/app/modules/intro/views/widgets/onboarding_page.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a PageController
    final PageController pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Get.offAllNamed('/auth'),
                child:  Text(
                  'تخطي',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController, // Use the controller here
                onPageChanged: (index) {
                  controller.selectedPageIndex.value = index;
                },
                children: controller.onboardingPages
                    .map((page) => OnboardingPage(
                          page: page,
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingPages.length,
                      (index) => Obx(() => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: controller.selectedPageIndex.value == index
                                ? 35
                                : 12,
                            height: 7,
                            decoration: BoxDecoration(
                              color: controller.selectedPageIndex.value == index
                                  ? const Color(0xFF1B5E20)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Obx(() => CustomButton(
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
                        )),
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
