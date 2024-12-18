import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/services/connectivity_service.dart';
import 'package:hikaya/app/core/utils/snackbar_util.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/back_button.dart';
import 'package:hikaya/app/data/dummy_data.dart';
import 'package:hikaya/app/models/activity_model.dart';
import 'package:hikaya/app/routes/app_pages.dart';

import '../../../core/utils/lunch_urls.dart';
import '../../../models/story_model.dart';
import '../controllers/activities_and_story_controller.dart';


class ActivitiesAndStoryView extends GetView<ActivitiesAndStoryController> {
  const ActivitiesAndStoryView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButtonWidget(),
      title: _HeaderText(text: 'قصص تفاعلية'),centerTitle: true,),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              32.height,
              _InteractiveStoriesList(onTap: URLLauncherUtil.launchURL,),
              8.height,
              const _HeaderText(text: 'مرفقات أنشطة للطفل'),
              16.height,
               _ActivitiesList(onTap: URLLauncherUtil.launchURL,),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;

  const _HeaderText({required this.text});

  @override
  Widget build(BuildContext context) {
    return AppText(text: text, fontSize: 20);
  }
}

class _InteractiveStoriesList extends StatelessWidget {
  Future<void> Function(String) onTap;
   _InteractiveStoriesList({required this.onTap});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: AppDummyData.storiesData.length,
        reverse: true,
        separatorBuilder: (context, index) => 14.width,
        itemBuilder: (context, index) => _StoryCard(
          story: AppDummyData.storiesData[index],
          onTap: () => onTap(AppDummyData.storiesData[index].url),
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final StoryModel story;
  final VoidCallback onTap;

  const _StoryCard({
    required this.story,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 161.w,
        height: 228.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Container(
              height: 124.h,
              width: 137.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(story.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            11.height,
            AppText(
              text: story.title,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: 'قصة تفاعلية مصورة',
              fontSize: 12,
              color: const Color(0xff7D848D),
            ),
            11.height,
            _WatchNowButton(),
          ],
        ),
      ),
    );
  }
}

class _WatchNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 96.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color(0xffD9D9D9),
      ),
      child:  Center(
        child: AppText(
          text: 'شاهد الآن',
          fontSize: 12,
          color: Color(0xff1E6C41),
        ),
      ),
    );
  }
}

class _ActivitiesList extends StatelessWidget {
  Future<void> Function(String) onTap;

   _ActivitiesList({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => 16.height,
        itemCount: AppDummyData.activitiesData.length,
        itemBuilder: (context, index) => _ActivityCard(
          activity: AppDummyData.activitiesData[index],
          onTap: () async {
            debugPrint((await ConnectivityService.to.checkConnection()).toString());

    if (!await ConnectivityService.to.checkConnection()) {
    SnackbarUtil.showError(
    'No Internet Connection',
    'Please check your network connection and try again.'
    );
    return;
    }
    Get.toNamed(Routes.ARTICLE_VIEW, arguments: {'url': AppDummyData.activitiesData[index].url});
    },
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final ActivityModel activity;
  final VoidCallback onTap;

  const _ActivityCard({
    required this.activity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: activity.title, fontSize: 16),
                  AppText(
                    text: activity.url,
                    fontSize: 13,
                    color: const Color(0xff7D848D),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(activity.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
