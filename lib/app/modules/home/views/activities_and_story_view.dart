import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';

import '../controllers/activities_and_story_controller.dart';

class ActivitiesAndStoryView extends GetView<ActivitiesAndStoryController> {
  const ActivitiesAndStoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AppText(text: 'قصص تفاعلية ', fontSize: 20),
              32.ph(),
              Container(
                height: 238,
                color: Colors.green,
                child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 161,
                      height: 228,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 124,
                            width: 137,
                            color: Colors.red,
                          ),
                          11.ph(),
                          AppText(text: 'العمة زيون وشجرة الزيتون', fontSize: 14),
                          AppText(text: 'قصة تفاعلية مصورة', fontSize: 12,color: Color(0xff7D848D),),
                          11.ph(),
                          Container(
                            height: 22,
                            width: 96,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xffD9D9D9),),

                            child: AppText(text: 'شاهد الآن', fontSize: 12,color: Color(0xff1E6C41),),
                          )
                        ],
                      ),

                    );

                  },
                  itemCount: 5,
                  separatorBuilder: (context, index) => 14.pw(),
                ),
              ),
              8.ph(),
              AppText(text: 'مرفقات أنشطة للطفل  ', fontSize: 20),
              16.ph(),
              Expanded(child: ListView.separated(
                separatorBuilder:(context, index) => 16.ph() ,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  color: Colors.greenAccent,
                  child: Row(
                    children: [
                     Column(
                       children: [
                         AppText(text: 'مذكرات تسالي وتلوين ', fontSize: 16),
                         AppText(text: 'https://bit.ly/3UUOnMX', fontSize: 13,color: Color(0xff7D848D),),
                       ],
                     ),
                      Spacer(),
                      Container(
                        height: 80,
                          width: 80,
                        color: Colors.lightBlueAccent,
                      )

                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
