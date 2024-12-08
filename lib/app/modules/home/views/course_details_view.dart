import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/modules/home/controllers/course_details_controller.dart';

import '../../../core/widgets/app_text.dart';
import '../../../models/course_model.dart';

class CourseDetailsView extends GetView<CourseDetailsController> {
  CourseDetailsView({super.key});

  final courseModel = Get.arguments as CourseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBackButton(),
                16.ph(),
                _buildCourseHeader(),
                16.ph(),
                _buildCourseInfo(),
                27.ph(),
                _buildActionButtons(),
                18.ph(),
                _buildTabContent(),
              ],
            ),)
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildCourseHeader() {
    return Container(
      height: 189,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(courseModel.episodeModel.first.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildCourseInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'اسم الكورس: ${courseModel.courseName}',
          fontSize: 18,
        ),
        8.ph(),
        AppText(
          text: 'عدد الفيديوهات: ${courseModel.episodeModel.length}',
          fontSize: 18,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildButton(
            title: 'الوصف',
            isActive: controller.currentTabIndex.value==0,
            onPressed: () => controller.setTabIndex(0),
          ),
        ),

        8.pw(), // Small gap
        Expanded(
          child: _buildButton(
            title: 'الحلقات',
            isActive: controller.currentTabIndex.value==1,
            onPressed: () => controller.setTabIndex(1),
          ),
        ),// between buttons

      ],
    );
  }


  Widget _buildButton({
    required String title,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? const Color(0xff1E6C41) : const Color(0xFFE8E8E8),
          foregroundColor: isActive ? Colors.white : Colors.black,
          elevation: 0, // Remove shadow
          padding: EdgeInsets.zero, // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Center(
          child: AppText(
            text: title,
            fontSize: 16,
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _buildTabContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(31),
      ),
      height: 269,
      child: _getTabContent(controller.currentTabIndex.value),
    );
  }

  Widget _getTabContent(int index) {
    switch (index) {
      case 0:
        return _buildDescription();
      case 1:
        return _buildEpisodesList();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildEpisodesList() {
    return ListView.separated(
      itemCount: courseModel.episodeModel.length,
      separatorBuilder: (_, __) => 14.ph(),
      itemBuilder: (context, index) => _buildEpisodeItem(index),
    );
  }

  Widget _buildEpisodeItem(int index) {
    final episode = courseModel.episodeModel[index];
    final isSelected = controller.selectedEpisodeIndex.value == index;

    return InkWell(
      onTap: () => controller.selectEpisode(index),
      child: Container(
        height: 37,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xff1E6C41) : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? const Color(0xff1E6C41).withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              Icons.play_circle,
              color: isSelected ? const Color(0xff1E6C41) : Colors.black,
            ),
            10.pw(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'الحلقة ${index + 1}',
                  fontSize: 12,
                  color: isSelected ? const Color(0xff1E6C41) : Colors.black,
                ),
                AppText(
                  text: episode.formattedDuration,
                  fontSize: 10,
                  color: isSelected ? const Color(0xff1E6C41) : Colors.grey[600],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return SingleChildScrollView(
      child: AppText(
        text: 'خلال هذا الكورس: سنتعرف معًا على تاريخ فلسطين العريق وأهم الأحداث التي مرت بها منذ آلاف السنين. ستتعلم عن أول من بنى المسجد الأقصى، والأنبياء الذين عاشوا ودفنوا في أرضها المباركة، وقصصهم مع بني إسرائيل. سنجيب أيضًا على أسئلة مهمة مثل: هل فلسطين أرض عربية؟ وما حقيقة هيكل سليمان الذي يدّعي اليهود وجوده؟',
        fontSize: 15,
      ),
    );
  }
}
//
// class CourseDetailsView extends GetView<CourseDetailsController> {
//    CourseDetailsView({super.key});
//
//   final courseModel = Get.arguments as CourseModel;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
//           child: Column(
//             children: [
//               Container(
//                 height: 189,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(image: NetworkImage(courseModel.episodeModel.first.image),fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(20)),
//               ),
//               16.ph(),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(text: 'اسم الكورس :${courseModel.courseName}', fontSize: 18),
//                   AppText(text: 'عدد الفيديوهات : ${courseModel.episodeModel.length}', fontSize: 18),
//                   27.ph(),
//                   SizedBox(
//                     height: 40,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 130,
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(20)),
//                         ),
//                         Container(
//                           height: 40,
//                           decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(20)),
//                           width: 130,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               18.ph(),
//               Container(
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(31)
//                 ),
//                 height: 269,
//                 child:courseDetailViewWidget(1)
//
//                 // color: Colors.greenAccent,
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }
// Widget courseDetailViewWidget(int index){
//   switch(index){
//     case 0:
//       return ListView.separated(
//   itemBuilder: (context, index) => Padding(
//   padding: EdgeInsets.symmetric(horizontal: 20),
//   child: Container(
//   height: 37,
//   decoration: BoxDecoration(
//   border: Border.all(color: Colors.grey),
//   borderRadius: BorderRadius.circular(20)),
//   child: Row(
//   children: [
//   Icon(Icons.play_circle),
//   10.pw(),
//   Column(
//   children: [
//   AppText(text: 'الحلقة الأولى ', fontSize: 10),
//   AppText(text: '10 دقيقة و 31ثانية', fontSize: 10,color: Color(0xff111111),),
//
//   ],
//   )
//   ],
//   ),
//   ),
//   ),
//   separatorBuilder: (context, index) => 14.ph(),
//   itemCount: 5);
//     case 1:
//       return AppText(text: ''
//           'خلال هذا الكورس :      سنتعرف معًا على تاريخ فلسطين العريق وأهم الأحداث التي مرت بها منذ آلاف السنين. ستتعلم عن أول من بنى المسجد الأقصى، والأنبياء الذين عاشوا ودفنوا في أرضها المباركة، وقصصهم مع بني إسرائيل. سنجيب أيضًا على أسئلة مهمة مثل: هل فلسطين أرض عربية؟ وما حقيقة هيكل سليمان الذي يدّعي اليهود وجوده؟'
//           '', fontSize: 15);
//
//     default:
//       return 0.pw();
//   }
// }
