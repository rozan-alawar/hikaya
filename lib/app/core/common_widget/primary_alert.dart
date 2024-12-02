import 'package:flutter/material.dart';

class PrimaryAlert extends StatelessWidget {
  const PrimaryAlert({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      title: content,
    );
  }
}
