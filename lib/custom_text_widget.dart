import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.containerColor,
    required this.textColor,
  });

  final String text;
  final Color containerColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: containerColor,
      child: Text(text, style: TextStyle(color: textColor, fontSize: 30)),
    );
  }
}
