import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/back_button.dart';

import '../controllers/activities_and_story_controller.dart';

class GameView extends GetView<ActivitiesAndStoryController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
      title:   AppText(
          text: 'لعبة التغريبة',
          fontSize: 18.sp,
                 ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.height,
              Image.asset(
                'assets/images/game1.png',
                width: 230.w,
                height: 230.h,
                fit: BoxFit.cover,
              ),
              20.height,
              AppText(
                text: 'تصميم: تُراب حاضنة الهوية الفلسطينية ',
                fontSize: 14,
                color: AppColors.textLight,              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: 'وصف اللعبة:',
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                ],
              ),
              11.height,
              AppText(
                text:
                'لعبة افتراضيّة تفاعليّة تروي قصة حسن، اللاجئ الفلسطينيّ، وتحكي من خلالها حكاية التغريبة وتهجير الفلسطينيّين. عندما تلعب/ين هذه اللعبة سيمكنك الخوض في جميع مراحل حياة حسن ومحطّات التهجير، وستعيش/ين التجربة في وجداتك وتحفظها لتبقى داخلك وتفوز فيها، وبذلك سوف تحيا الرواية وتنجو الحقيقة.',
                fontSize: 14,

                color: AppColors.textLight,
              ),
              40.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AppText(
                        text: 'Play Store',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      10.height,
                     Container(
                       width: 150,
                       height: 150,
                       child:  Image.asset(
                         'assets/images/playstore.jpeg',

                         fit: BoxFit.cover,
                       ),
                     )
                    ],
                  ),
                  Column(
                    children: [
                      AppText(
                        text: 'App Store',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      10.height,
                    Container(
                      width: 150,
                      height: 150,
                      child:   Image.asset(
                        'assets/images/appstore.jpeg',
                        width: 150.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
