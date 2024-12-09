// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
// import 'package:hikaya/app/modules/home/controllers/course_details_controller.dart';
//
// import '../../../core/widgets/app_text.dart';
// import '../../../models/course_model.dart';
//
// class CourseDetailsView extends GetView<CourseDetailsController> {
//   CourseDetailsView({super.key});
//
//   final courseModel = Get.arguments as CourseModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
//             child: Obx(() => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildBackButton(),
//                 16.ph(),
//                 _buildCourseHeader(),
//                 16.ph(),
//                 _buildCourseInfo(),
//                 27.ph(),
//                 _buildActionButtons(),
//                 18.ph(),
//                 _buildTabContent(),
//               ],
//             ),)
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBackButton() {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: IconButton(
//         icon: const Icon(Icons.arrow_back_ios),
//         onPressed: () => Get.back(),
//       ),
//     );
//   }
//
//   Widget _buildCourseHeader() {
//     return Container(
//       height: 189,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(courseModel.episodeModel.first.image),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//   }
//
//   Widget _buildCourseInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AppText(
//           text: 'اسم الكورس: ${courseModel.courseName}',
//           fontSize: 18,
//         ),
//         8.ph(),
//         AppText(
//           text: 'عدد الفيديوهات: ${courseModel.episodeModel.length}',
//           fontSize: 18,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildActionButtons() {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildButton(
//             title: 'الوصف',
//             isActive: controller.currentTabIndex.value==0,
//             onPressed: () => controller.setTabIndex(0),
//           ),
//         ),
//
//         8.pw(), // Small gap
//         Expanded(
//           child: _buildButton(
//             title: 'الحلقات',
//             isActive: controller.currentTabIndex.value==1,
//             onPressed: () => controller.setTabIndex(1),
//           ),
//         ),// between buttons
//
//       ],
//     );
//   }
//
//
//   Widget _buildButton({
//     required String title,
//     required bool isActive,
//     required VoidCallback onPressed,
//   }) {
//     return SizedBox(
//       height: 40,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isActive ? const Color(0xff1E6C41) : const Color(0xFFE8E8E8),
//           foregroundColor: isActive ? Colors.white : Colors.black,
//           elevation: 0, // Remove shadow
//           padding: EdgeInsets.zero, // Remove default padding
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         child: Center(
//           child: AppText(
//             text: title,
//             fontSize: 16,
//             color: isActive ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildTabContent() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(31),
//       ),
//       height: 269,
//       child: _getTabContent(controller.currentTabIndex.value),
//     );
//   }
//
//   Widget _getTabContent(int index) {
//     switch (index) {
//       case 0:
//         return _buildDescription();
//       case 1:
//         return _buildEpisodesList();
//       default:
//         return const SizedBox.shrink();
//     }
//   }
//
//   Widget _buildEpisodesList() {
//     return ListView.separated(
//       itemCount: courseModel.episodeModel.length,
//       separatorBuilder: (_, __) => 14.ph(),
//       itemBuilder: (context, index) => _buildEpisodeItem(index),
//     );
//   }
//
//   Widget _buildEpisodeItem(int index) {
//     final episode = courseModel.episodeModel[index];
//     final isSelected = controller.selectedEpisodeIndex.value == index;
//
//     return InkWell(
//       onTap: () => controller.selectEpisode(index),
//       child: Container(
//         height: 37,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: isSelected ? const Color(0xff1E6C41) : Colors.grey.shade300,
//           ),
//           borderRadius: BorderRadius.circular(20),
//           color: isSelected ? const Color(0xff1E6C41).withOpacity(0.1) : Colors.white,
//         ),
//         child: Row(
//           children: [
//             Icon(
//               Icons.play_circle,
//               color: isSelected ? const Color(0xff1E6C41) : Colors.black,
//             ),
//             10.pw(),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppText(
//                   text: 'الحلقة ${index + 1}',
//                   fontSize: 12,
//                   color: isSelected ? const Color(0xff1E6C41) : Colors.black,
//                 ),
//                 AppText(
//                   text: episode.formattedDuration,
//                   fontSize: 10,
//                   color: isSelected ? const Color(0xff1E6C41) : Colors.grey[600],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDescription() {
//     return SingleChildScrollView(
//       child: AppText(
//         text: 'خلال هذا الكورس: سنتعرف معًا على تاريخ فلسطين العريق وأهم الأحداث التي مرت بها منذ آلاف السنين. ستتعلم عن أول من بنى المسجد الأقصى، والأنبياء الذين عاشوا ودفنوا في أرضها المباركة، وقصصهم مع بني إسرائيل. سنجيب أيضًا على أسئلة مهمة مثل: هل فلسطين أرض عربية؟ وما حقيقة هيكل سليمان الذي يدّعي اليهود وجوده؟',
//         fontSize: 15,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/models/course_model.dart';
import '../../../models/episode_model.dart';
import '../controllers/course_details_controller.dart';

/// A view that displays detailed information about a course
class CourseDetailsView extends GetView<CourseDetailsController> {
  /// The course model passed as arguments
  final CourseModel courseModel;

  /// Creates a [CourseDetailsView] with the required course model
  CourseDetailsView({super.key}) : courseModel = Get.arguments as CourseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: CourseContent(
              courseModel: courseModel,
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}

/// Main content widget for the course details
class CourseContent extends StatelessWidget {
  final CourseModel courseModel;
  final CourseDetailsController controller;

  const CourseContent({
    super.key,
    required this.courseModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackButton(),
        16.ph(),
        CourseHeader(imageUrl: courseModel.episodeModel.first.image),
        16.ph(),
        CourseInfo(courseModel: courseModel),
        27.ph(),
        CourseTabButtons(controller: controller),
        18.ph(),
        CourseTabContent(
          courseModel: courseModel,
          controller: controller,
        ),
      ],
    );
  }
}

/// Custom back button widget
class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Get.back(),
      ),
    );
  }
}

/// Widget displaying the course header image
class CourseHeader extends StatelessWidget {
  final String imageUrl;

  const CourseHeader({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

/// Widget displaying basic course information
class CourseInfo extends StatelessWidget {
  final CourseModel courseModel;

  const CourseInfo({
    super.key,
    required this.courseModel,
  });

  @override
  Widget build(BuildContext context) {
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
}

/// Widget containing the tab selection buttons
class CourseTabButtons extends StatelessWidget {
  final CourseDetailsController controller;

  const CourseTabButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Row(
      children: [
        Expanded(
          child: TabButton(
            title: 'الوصف',
            isActive: controller.currentTabIndex.value == 0,
            onPressed: () => controller.setTabIndex(0),
          ),
        ),
        8.pw(),
        Expanded(
          child: TabButton(
            title: 'الحلقات',
            isActive: controller.currentTabIndex.value == 1,
            onPressed: () => controller.setTabIndex(1),
          ),
        ),
      ],
    ),);
  }
}

/// Individual tab button widget
class TabButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  const TabButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buildButtonStyle(),
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

  ButtonStyle _buildButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: isActive ? const Color(0xff1E6C41) : const Color(0xFFE8E8E8),
      foregroundColor: isActive ? Colors.white : Colors.black,
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

/// Widget containing the tab content
class CourseTabContent extends StatelessWidget {
  final CourseModel courseModel;
  final CourseDetailsController controller;

  const CourseTabContent({
    super.key,
    required this.courseModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(31),
      ),
      height: 269,
      child: _buildContent(),
    ),);
  }

  Widget _buildContent() {

    return controller.currentTabIndex.value == 0
        ? const CourseDescription()
        : EpisodesList(
      courseModel: courseModel,
      controller: controller,
    );
  }
}

/// Widget displaying the course description
class CourseDescription extends StatelessWidget {
  const CourseDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: AppText(
        text: 'خلال هذا الكورس: سنتعرف معًا على تاريخ فلسطين العريق وأهم الأحداث التي مرت بها منذ آلاف السنين. ستتعلم عن أول من بنى المسجد الأقصى، والأنبياء الذين عاشوا ودفنوا في أرضها المباركة، وقصصهم مع بني إسرائيل. سنجيب أيضًا على أسئلة مهمة مثل: هل فلسطين أرض عربية؟ وما حقيقة هيكل سليمان الذي يدّعي اليهود وجوده؟',
        fontSize: 15,
      ),
    );
  }
}

/// Widget displaying the list of episodes
class EpisodesList extends StatelessWidget {
  final CourseModel courseModel;
  final CourseDetailsController controller;

  const EpisodesList({
    super.key,
    required this.courseModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: courseModel.episodeModel.length,
      separatorBuilder: (_, __) => 14.ph(),
      itemBuilder: (_, index) => EpisodeItem(
        episode: courseModel.episodeModel[index],
        index: index,
        isSelected: controller.selectedEpisodeIndex.value == index,
        onTap: () => controller.selectEpisode(index),
      ),
    );
  }
}

/// Widget representing an individual episode item
class EpisodeItem extends StatelessWidget {
  final EpisodeModel episode;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const EpisodeItem({
    super.key,
    required this.episode,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Container(
        height: 37,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: _buildDecoration(),
        child: Row(
          children: [
            Icon(
              Icons.play_circle,
              color: isSelected ? const Color(0xff1E6C41) : Colors.black,
            ),
            10.pw(),
            _buildEpisodeInfo(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: isSelected ? const Color(0xff1E6C41) : Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.circular(20),
      color: isSelected ? const Color(0xff1E6C41).withOpacity(0.1) : Colors.white,
    );
  }

  Widget _buildEpisodeInfo() {
    return Column(
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
    );
  }
}