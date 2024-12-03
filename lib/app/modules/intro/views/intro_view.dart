import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../main.dar';

import 'package:get/get.dart';
import 'package:hikaya/app/modules/intro/views/widgets/onboarding_page.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});
  @override
  Widget build(BuildContext context) {
    final IntroController controller = Get.put(IntroController());

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              PageView.builder(
                onPageChanged: controller.selectedPageIndex.call,
                itemCount: controller.onboardingPages.length,

                itemBuilder: (context, index) {
                  return OnboardingPage(
                    page: controller.onboardingPages[index],
                  );
                },
                controller: PageController(
                    keepPage: false,
                    initialPage: controller.selectedPageIndex.value
                ),
              ),

              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.onboardingPages.length,
                        (index) => Obx(
                          () => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width:controller.selectedPageIndex.value == index? 35: 12,
                        height: 7,
                        decoration: BoxDecoration(
                            color: controller.selectedPageIndex.value == index
                                ? Color(0xFF1B5E20)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)
                          // shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),



            ],
          ),
          // ElevatedButton(onPressed: () {
          //
          // },
          //     child: Text('data'),style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.purple,
          //         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          //         textStyle: TextStyle(
          //             fontSize: 30,
          //             fontWeight: FontWeight.bold)))
        ],
      )
    );
  }
}
