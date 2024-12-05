import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/back_button.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/models/notification_model.dart';
import 'package:hikaya/app/modules/notification/controllers/notification_controller.dart';
import 'package:hikaya/app/modules/notification/views/notification_item_widget.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          alignment: Alignment.center,
          'الإشعارات',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        leading: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: BackButtonWidget(),
        ),
        actions: [
          TextButton(
            onPressed: () => controller.clearAllNotifications(),
            child: CustomText(
              'حذف الكل',
              fontSize: 20,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomText(
                      'محتوى جديد',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = controller.notifications[index];
                      return NotificationItem(
                        notification: notification,
                        isNew: index == 0,
                      );
                    },
                  ),
                ],
              ))),
    );
  }
}
