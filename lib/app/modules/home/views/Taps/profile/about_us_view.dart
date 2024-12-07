import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/back_button.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';

class AboutView extends StatelessWidget{
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          alignment: Alignment.center,
          'عن التطبيق',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        // centerTitle: true,
        leading: BackButtonWidget(),
        actions: [60.width],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appService.isDarkMode.value ? AppColors.white.withOpacity(.1) : AppColors.flagBlack.withOpacity(.1) ,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: CustomText(
                 '"حكاية" تطبيق جوال مصمم كدليل شامل للآباء والأمهات لتعليم أبنائهم عن القضية الفلسطينية. يجمع التطبيق محتوى متنوعاً، بما في ذلك المقالات والدورات المتسلسلة والقصص المختارة والأنشطة الإبداعية والألعاب التعليمية. وهو مصمم خصيصاً لفئات عمرية مختلفة ويهدف إلى \nتعزيز الوعي والتعاطف والهوية الثقافية من خلال معايير تجزئة الموارد وتقديمها في شكل منظم وسهل الاستخدام. يوفر "حكاية" للآباء والأمهات أداة عملية لتعزيز فهم أبنائهم لهذه القضية الحيوية.',
                fontSize: 20,
                height: 1.8,
                textAlign: TextAlign.justify,
                maxLines: 500,
              ),
            ),
            const SizedBox(height: 20),
            // You can add more sections here like version info, developer info, etc.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appService.isDarkMode.value ? AppColors.white.withOpacity(.1) : AppColors.flagBlack.withOpacity(.1) ,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                   'إصدار التطبيق',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                     '1.0.0',
                    fontSize: 14,
                    color: Colors.grey[600],
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
