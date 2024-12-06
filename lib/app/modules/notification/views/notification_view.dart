import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/empty_space_extension.dart';
import 'package:hikaya/app/core/services/app_service.dart';
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
    final appService = Get.find<AppService>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomText(
          alignment: Alignment.center,
          'الإشعارات',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: BackButtonWidget(),
        actions: [
          TextButton(
            onPressed: () => controller.clearAllNotifications(),
            child: CustomText(
              'حذف الكل',
              fontSize: 20,
              color: appService.isDarkMode.value ? AppColors.flagGreen : AppColors.primary
            ),
          ),
        ],
      ),
      body: Obx(
            () =>
        controller.notifications.isEmpty
            ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                        children: [
              20.height,
              CustomText(
                'لا توجد إشعارات',
                fontSize: 20,
                color: appService.isDarkMode.value
                    ? Colors.grey[400]
                    : Colors.grey[600],
              ),
              const SizedBox(height: 8),
              CustomText(
                'سيتم عرض الإشعارات الجديدة هنا',
                fontSize: 16,
                color: Colors.grey,
              ),
              200.height,

              Icon(
                Icons.notifications_off_outlined,
                size: 200,
                color: appService.isDarkMode.value
                    ? Colors.grey[600]
                    : Colors.grey[400],
              ),
              const SizedBox(height: 16),

                        ],
                      ),
            )
            : ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            return NotificationItem(
              notification: controller.notifications[index],
              isNew: index == 0,
            );
          },
        ),
      ),
    );
  }
}
