import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget widget;
  final void Function()? onPressed;
  final Color backgraoundColor;
  final Color borderColor;
  final bool wihtBorder;
  final bool disable;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.widget,
    required this.onPressed,
    this.wihtBorder = false,
    this.disable = false,
    required this.backgraoundColor,
    this.borderColor = const Color(0xFF6D6D6D),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: backgraoundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Center(child: widget),
        ),
      ),
    );

    //
    // ElevatedButton(
    //
    //   onPressed:disable?(){}: onPressed,
    //   style: ElevatedButton.styleFrom(
    //     elevation: 0,
    //     side: wihtBorder
    //         ? BorderSide(
    //             width: 1,
    //             strokeAlign: BorderSide.strokeAlignCenter,
    //             color: borderColor,
    //           )
    //         : BorderSide.none,
    //     backgroundColor: backgraoundColor,
    //     minimumSize: const Size(double.infinity, 80),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //   ),
    //   child: disable?SizedBox()
    //   //     ?  SpinKitThreeBounce(
    //   //   color: Colors.white,
    //   //   size: 20.0,
    //   // )
    //       : widget);
  }
}
