import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';

import '../controllers/activities_and_story_controller.dart';

class GameView extends GetView<ActivitiesAndStoryController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 230,
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.red,
                ),
              ),
              20.ph(),
              AppText(text: 'تصميم: تُراب حاضنة الهوية الفلسطينية ', fontSize: 15,color: Color(0xff7D848D),),
              7.ph(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(text: 'وصف اللعبة:', fontSize: 24,color: Color(0xff1E6C41),),
                ],
              ),
              11.ph(),

              AppText(text: 'لعبة افتراضيّة تفاعليّة تروي قصة حسن، اللاجئ الفلسطينيّ، وتحكي من خلالها حكاية التغريبة وتهجير الفلسطينيّين. عندما تلعب/ين هذه اللعبة سيمكنك الخوض في جميع مراحل حياة حسن ومحطّات التهجير، وستعيش/ين التجربة في وجداتك وتحفظها لتبقى داخلك وتفوز فيها، وبذلك سوف تحيا الرواية وتنجو الحقيقة.'
              , fontSize: 13,color: Color(0xff7D848D),),
              15.ph(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppText(text: 'Google Play', fontSize: 18,color: Color(0xff1E6C41),),
                      9.ph(),
                      Container(
                        height: 116,
                        width: 125,
                        color: Colors.amber,
                      )

                    ],
                  ),

                  Column(
                    children: [
                      AppText(text: 'App Store', fontSize: 18,color: Color(0xff1E6C41),),
                      9.ph(),
                      Container(
                        height: 116,
                        width: 125,
                        color: Colors.amber,
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
