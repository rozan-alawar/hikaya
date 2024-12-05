import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hikaya/app/core/data/dummy_data.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/modules/home/controllers/home_controller.dart';
import 'package:hikaya/app/modules/home/views/Taps/profile/profile_view.dart';
import 'package:hikaya/app/routes/app_pages.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                AppText(
                  text:
                  ' ابدأ الآن واكتشف تجربة تعليمية ممتعة دليلك بين يديك في مكان واحد',
                  fontSize: 25,
                ),
                Image.asset(
                  'assets/images/line_under_text.png',
                  height: 10.3,
                  width: 63,
                )
              ],
            ),
            50.ph(),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => HomeWidget(
                  image: AppDummyData.HomeData[index].imagePath,
                  title: AppDummyData.HomeData[index].title,
                  by: AppDummyData.HomeData[index].by,
                  url: AppDummyData.HomeData[index].url,
                  date: AppDummyData.HomeData[index].date,
                ),
                separatorBuilder: (context, index) => 16.ph(),
                itemCount: AppDummyData.HomeData.length,
              ),
            ),
            // Bottom Navigation Bar
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
    return Container(
      height: 140,
      width: 335,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: title, fontSize: 14),
                AppText(text: by, fontSize: 16),
                AppText(text: url, fontSize: 16, color: const Color(0xff7D848D)),
                11.ph(),
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    AppText(
                      text: date,
                      fontSize: 13,
                      color: const Color(0xff7D848D),
                    ),
                  ],
                ),
              ],
            ),
            11.pw(),
            Container(
              height: 116,
              width: 95,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
