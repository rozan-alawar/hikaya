import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/services/app_service.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  final Color? iconColor;
  final VoidCallback? onPressed;

  const BackButtonWidget({
    Key? key,
    this.iconColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appService = Get.find<AppService>();

    return   Padding(
        padding: EdgeInsets.only(right: 8.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appService.isDarkMode.value ? AppColors.white.withOpacity(0.2) : AppColors.white.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onPressed ?? () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: iconColor ?? Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}