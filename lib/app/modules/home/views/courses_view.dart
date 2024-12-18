import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/back_button.dart';
import 'package:hikaya/app/data/dummy_data.dart';
import 'package:hikaya/app/modules/home/controllers/courses_controller.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: AppText(
          text: 'الكورسات',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
            AppText(
              text: 'تعليم أطفالنا عن فلسطين\n حِكَايَة تبدأ هنا....',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            Image.asset(
              'assets/images/line_under_text.png',
              height: 10.3,
              width: 63,
            ),
            20.height,
            AppText(text: 'الكورسات', fontSize: 20),
            22.height,
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => 10.height,
                itemCount: AppDummyData.coursesData.length,
                itemBuilder: (context, index) => SizedBox(
                  height: 400.h,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      controller.selectCourseModel(
                          controller.courseModel.value[index]);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppDummyData.coursesData[index].imageCoursePath,
                          height: 250.h,
                          width: double.infinity.w,
                          fit: BoxFit.fill,
                        ),
                        11.height,
                        Expanded(
                          child: Container(
                            // color: Colors.greenAccent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    text:
                                        'اسم الكورس :${AppDummyData.coursesData[index].courseName}',
                                    fontSize: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                        text:
                                            'عدد الفيديوهات : ${AppDummyData.coursesData[index].episodeModel.length}',
                                        fontSize: 18),
                                    AppText(
                                      text: 'الكورس مجاني بالكامل',
                                      fontSize: 15,
                                      color: Color(0xff7D848D),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
