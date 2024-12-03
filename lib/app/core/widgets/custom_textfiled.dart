import 'package:flutter/material.dart';
import 'package:hikaya/app/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final bool? multiLines;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final dynamic inputFormater;
  final Color fillColor;
  final bool hideError;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomTextField(
      {Key? key,
      this.hintText,
      this.obscureText = false,
      required this.controller,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.onTap,
      this.readOnly = false,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.hideError = false,
      this.multiLines = false,
      this.textAlign = TextAlign.start,
      this.onChanged,
      this.inputFormater,
      this.textInputAction = TextInputAction.none,
      this.hintStyle,
        this.fillColor  =AppColors.textField,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        textAlign: textAlign!,
        onChanged: onChanged,
        textInputAction: textInputAction,
        maxLines: multiLines! ? 3 : 1,
        inputFormatters: inputFormater,
        obscureText: obscureText,
        style: textStyle ?? TextStyle(fontSize: 16),
        keyboardType: keyboardType,
        onTap: onTap ?? () {},
        onFieldSubmitted: onFieldSubmitted ?? (v) {},
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: prefixIcon,
          ),
          helperText: ' ',
          suffixIcon: suffixIcon,
          hintText: hintText ?? '',
          fillColor: fillColor,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 14
              ),
          filled: true,

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.transparent),
            borderRadius: BorderRadius.circular(15),
          ),

          focusedBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: ColorManager.transparent),
            borderRadius: BorderRadius.circular(15),
          ),

          contentPadding: EdgeInsets.symmetric(vertical: 17),

          suffixIconConstraints:
              BoxConstraints(minWidth: 45, minHeight: 45),
          prefixIconConstraints:
              BoxConstraints(minWidth: 45, minHeight: 45),
          // fillColor: fillColor,
          errorStyle: TextStyle(
              // color: ColorManager.Custom,
              fontFamily: 'Almarai',
              fontSize: 12),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
