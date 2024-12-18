import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hikaya/app/core/extensions/sized_box_extension.dart';
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
        padding: EdgeInsets.only(right: 8.0.w),
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:appService.isDarkMode.value ? AppColors.flagBlack: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 8.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20.r),
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