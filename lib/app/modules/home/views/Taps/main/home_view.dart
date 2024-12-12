import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/data/dummy_data.dart';
import 'package:hikaya/app/modules/home/controllers/home_controller.dart';
import 'package:hikaya/app/modules/home/views/Taps/profile/profile_view.dart';
import 'package:hikaya/app/routes/app_pages.dart';

import '../../../../../core/services/connectivity_service.dart';
import '../../../../../core/utils/snackbar_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            AppText(
              text:
                  ' ابدأ الآن واكتشف تجربة تعليمية ممتعة دليلك بين يديك في مكان واحد',
              fontSize: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/line_under_text.png',
                  height: 10,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                125.width,

              ],
            ),
            40.height,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => HomeWidget(
                image: AppDummyData.HomeData[index].imagePath,
                title: AppDummyData.HomeData[index].title,
                by: AppDummyData.HomeData[index].by,
                url: AppDummyData.HomeData[index].url,
                date: AppDummyData.HomeData[index].date,
              ),
              separatorBuilder: (context, index) => 30.height,
              itemCount: AppDummyData.HomeData.length,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final String image;
  final String title;
  final String by;
  final String url;
  final String date;

  const HomeWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.by,
    required this.url,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();
    return  InkWell(
        onTap: ()async{
          debugPrint((await ConnectivityService.to.checkConnection()).toString());
           if (!await ConnectivityService.to.checkConnection()) {
          SnackbarUtil.showError(
          'No Internet Connection',
          'Please check your network connection and try again.'
          );
          return;
          }
           Get.toNamed(Routes.ARTICLE_VIEW, arguments: {'url': url});
        },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appService.isDarkMode.value ? AppColors.white.withOpacity(.1) : AppColors.flagBlack.withOpacity(0.1) ,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      alignment: Alignment.topRight,
                      title,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      'بقلم:',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      url,
                      fontSize: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        CustomText(
                          date,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              16.height,
              Container(
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
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

