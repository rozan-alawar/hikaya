
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


extension SizedBoxExtension on num {
  Widget ph() => SizedBox(
    height: toDouble().h,  // Convert num to double
  );
  Widget pw() => SizedBox(
    width: toDouble().w,   // Convert num to double
  );
}