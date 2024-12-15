import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? textColor;
  final Color? iconColor;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
      title: AppText(
        text: title,
        fontSize: 16,
        color: textColor ,
      ),
      trailing: trailing,
      contentPadding: EdgeInsets.zero,

    );
  }
}