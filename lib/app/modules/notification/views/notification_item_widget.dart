import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final bool isNew;

  const NotificationItem({
    Key? key,
    required this.notification,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      decoration: BoxDecoration(
        color: appService.isDarkMode.value ? AppColors.flagBlack: AppColors.white ,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fill,
          width: 60,
          height: 60,
        ),
        title: CustomText(
          notification.title,
          fontSize: 14,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: CustomText(
            notification.time,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
