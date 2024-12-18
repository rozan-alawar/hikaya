import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/utils/lunch_urls.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/back_button.dart';
import 'package:hikaya/app/models/course_model.dart';
import '../../../models/episode_model.dart';
import '../controllers/course_details_controller.dart';

class CourseDetailsView extends GetView<CourseDetailsController> {
  final CourseModel courseModel;

  CourseDetailsView({super.key}) : courseModel = Get.arguments as CourseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 70,
      leading: BackButtonWidget(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
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

        const CourseHeader(),
        16.height,
        CourseInfo(courseModel: courseModel),
        27.height,
        CourseTabButtons(controller: controller),
        18.height,
        CourseTabContent(
          courseModel: courseModel,
          controller: controller,
        ),
      ],
    );
  }
}


class CourseHeader extends GetView<CourseDetailsController> {

  const CourseHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(onTap: ()async =>await URLLauncherUtil.launchURL(controller.linkOfVideo.value),child: Container(
      height: 189.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        // Use the reactive selectedImage
        imageUrl: controller.selectedImage.value,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ),));
  }
}

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
        8.height,
        AppText(
          text: 'عدد الفيديوهات: ${courseModel.episodeModel.length}',
          fontSize: 18,
        ),
      ],
    );
  }
}

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
        8.width,
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
      height: 40.h,
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
        borderRadius: BorderRadius.circular(31.r),
      ),
      height: 269.h,
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
    return GetBuilder<CourseDetailsController>(builder: (controller) => ListView.separated(
      itemCount: courseModel.episodeModel.length,
      separatorBuilder: (_, __) => 14.height,
      itemBuilder: (_, index) {
        return EpisodeItem(
          episode: courseModel.episodeModel[index],
          index: index,
          isSelected: controller.selectedEpisodeIndex == index,
          onTap: (){
            return controller.selectEpisode(index);
          },
        );
      },
    ),);
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
        height: 37.h,
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        decoration: _buildDecoration(),
        child: Row(
          children: [
            Icon(
              Icons.play_circle,
              color: isSelected ? const Color(0xff1E6C41) : Colors.black,
            ),
            10.width,
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
      borderRadius: BorderRadius.circular(20.r),
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