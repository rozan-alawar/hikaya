// import 'package:dakakeen/config/theme/color_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class PrimaryTextField extends StatelessWidget {
//   final String? hintText;
//   final TextEditingController? controller;
//   final FormFieldValidator<String>? validator;
//   final TextInputType? keyboardType;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final VoidCallback? onTap;
//   final Function(String)? onFieldSubmitted;
//   final bool readOnly;
//   final bool? multiLines;
//   final TextInputAction? textInputAction;
//   final TextAlign? textAlign;
//   final dynamic inputFormater;
//   // Color? fillColor = ColorManager.borderColor;
//   final bool hideError;
//   final bool obscureText;
//   final ValueChanged<String>? onChanged;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//
//   const PrimaryTextField(
//       {Key? key,
//       this.hintText,
//       this.obscureText = false,
//       required this.controller,
//       required this.validator,
//       this.keyboardType = TextInputType.text,
//       this.prefixIcon,
//       this.onTap,
//       this.readOnly = false,
//       this.onFieldSubmitted,
//       this.suffixIcon,
//       this.hideError = false,
//       this.multiLines = false,
//       this.textAlign = TextAlign.start,
//       this.onChanged,
//       this.inputFormater,
//       this.textInputAction = TextInputAction.none,
//       this.hintStyle,
//       this.textStyle})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: TextFormField(
//         controller: controller,
//         readOnly: readOnly,
//         textAlign: textAlign!,
//         onChanged: onChanged,
//         textInputAction: textInputAction,
//         maxLines: multiLines! ? 3 : 1,
//         inputFormatters: inputFormater,
//         obscureText: obscureText,
//         style: textStyle ?? TextStyle(fontSize: 16.sp),
//         keyboardType: keyboardType,
//         onTap: onTap ?? () {},
//         onFieldSubmitted: onFieldSubmitted ?? (v) {},
//         decoration: InputDecoration(
//           isDense: true,
//           prefixIcon: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.w),
//             child: prefixIcon,
//           ),
//           helperText: ' ',
//           suffixIcon: suffixIcon,
//           hintText: hintText ?? '',
//           fillColor: Colors.grey.withOpacity(0.2),
//           hintStyle: hintStyle ??
//               TextStyle(
//                 // color: ColorManager.hintTextColor,
//                 fontSize: 14.sp,
//                 height: 0,
//                 // fontFamily: FontConstants.arabicFontFamily,
//               ),
//           filled: true,
//
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: ColorManager.transparent),
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: ColorManager.transparent),
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//
//           contentPadding: EdgeInsets.symmetric(vertical: 17.h),
//
//           suffixIconConstraints:
//               BoxConstraints(minWidth: 45.w, minHeight: 45.h),
//           prefixIconConstraints:
//               BoxConstraints(minWidth: 45.w, minHeight: 45.h),
//           // fillColor: fillColor,
//           errorStyle: TextStyle(
//               // color: ColorManager.primary,
//               fontFamily: 'Almarai',
//               fontSize: 12.sp),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red),
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red),
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//         ),
//         validator: validator,
//       ),
//     );
//   }
// }
