import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.color,
    required this.onPressed,
    this.width,
    this.height ,
    this.fontSize = 16,
    this.borderColor,
    this.isDisable = false, required this.child,
  }) : super(key: key);
  final Color? color;
  final double? width;
  final double? height;
  final double fontSize;
  final void Function()? onPressed;
  final Color? borderColor;
  final bool isDisable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width??double.infinity,
        height: height??60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Center(
            child:child
          ),
        ),
      ),
    );
  }
}
