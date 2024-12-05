import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';
import 'package:hikaya/app/core/widgets/app_text.dart';
import 'package:hikaya/app/core/widgets/custom_text.dart';
import 'package:hikaya/app/modules/home/controllers/home_controller.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color textColor;
  final Color iconColor;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
      title: AppText(
        text: title,
        fontSize: 16,
        color: textColor,
      ),
      trailing: trailing,
      contentPadding: EdgeInsets.zero,
    );
  }
}
