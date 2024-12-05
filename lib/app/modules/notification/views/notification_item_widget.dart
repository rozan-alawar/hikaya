import 'package:flutter/material.dart';
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
    return Container(
      color: isNew ? Colors.blue.shade50 : Colors.white,
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
          color: Colors.black87,
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
