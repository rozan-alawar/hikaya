import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/modules/home/controllers/course_details_controller.dart';

import '../../../core/widgets/app_text.dart';
import '../../../routes/app_pages.dart';

class CourseDetailsView extends GetView<CourseDetailsController> {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            children: [
              Container(
                height: 189,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
              ),
              16.ph(),
              Container(
                // height: 115,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: 'اسم الكورس :حكاية قدس', fontSize: 18),
                    AppText(text: 'عدد الفيديوهات : 13', fontSize: 18),
                    27.ph(),
                    Container(
                      height: 40,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 130,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              18.ph(),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(31)),
                height: 269,
                child:courseDetailViewWidget(1)

                // color: Colors.greenAccent,
              ),

            ],
          ),
        ),
      ),
    );
  }


}
Widget courseDetailViewWidget(int index){
  switch(index){
    case 0:
      return ListView.separated(
  itemBuilder: (context, index) => Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Container(
  height: 37,
  decoration: BoxDecoration(
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(20)),
  child: Row(
  children: [
  Icon(Icons.play_circle),
  10.pw(),
  Column(
  children: [
  AppText(text: 'الحلقة الأولى ', fontSize: 10),
  AppText(text: '10 دقيقة و 31ثانية', fontSize: 10,color: Color(0xff111111),),

  ],
  )
  ],
  ),
  ),
  ),
  separatorBuilder: (context, index) => 14.ph(),
  itemCount: 5);
    case 1:
      return AppText(text: ''
          'خلال هذا الكورس :      سنتعرف معًا على تاريخ فلسطين العريق وأهم الأحداث التي مرت بها منذ آلاف السنين. ستتعلم عن أول من بنى المسجد الأقصى، والأنبياء الذين عاشوا ودفنوا في أرضها المباركة، وقصصهم مع بني إسرائيل. سنجيب أيضًا على أسئلة مهمة مثل: هل فلسطين أرض عربية؟ وما حقيقة هيكل سليمان الذي يدّعي اليهود وجوده؟'
          '', fontSize: 15);

    default:
      return 0.pw();
  }
}
