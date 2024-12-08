import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/data/dummy_data.dart';
import 'package:hikaya/app/modules/home/controllers/courses_controller.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20,),
          child: Column(
            children: [
              Center(
                child:Container(
                  height: 110.8,
                  width: 315,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: 'تعليم أطفالنا عن فلسطين حِكَايَة تبدأ هنا....',
                          fontSize: 30),
                      Image.asset(
                        'assets/images/line_under_text.png',
                        height: 10.3,
                        width: 63,
                      )
                    ],
                  ),
                ),
              ),
              60.ph(),
              Container(
                // color: Colors.red,
                child: Column(
                  children: [
                   Padding(
                       padding:  const EdgeInsets.symmetric(horizontal: 20),
                     child:  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         AppText(text: 'الكورسات', fontSize: 20),
                         AppText(text: 'رؤية الكل', fontSize: 14,color: Color(0xff1E6C41),),

                       ],
                     ),
                   ),
                    22.ph(),
                    SizedBox(
                      height: 400,
                      child:  PageView.builder(
                        padEnds: false,
                        itemCount: AppDummyData.coursesData.length,
                        allowImplicitScrolling: true,
                        reverse: true,
                        controller: PageController(
                          viewportFraction: 0.8,
                          initialPage: 0,
                        ),

                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.COURSEDETAILSVIEW, arguments: AppDummyData.coursesData[index],);

                          },
                          child:  Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: 268,
                            // height: 384,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 286,
                                    // width: 240,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(AppDummyData.coursesData[index].imageCoursePath),fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(20),

                                    ),

                                  ),
                                  11.ph(),
                                  Expanded(child: Container(

                                    // color: Colors.greenAccent,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppText(text: 'اسم الكورس :${AppDummyData.coursesData[index].courseName}', fontSize: 18),
                                        AppText(text: 'عدد الفيديوهات : ${AppDummyData.coursesData[index].episodeModel.length}', fontSize: 18),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            AppText(text: 'الكورس مجاني بالكامل', fontSize: 15,color: Color(0xff7D848D),),

                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
