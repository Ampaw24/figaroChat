import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double? size;
  final double? height;
  final Color? color;

  const SmallText(
      {super.key,
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.color = const Color(0xffccc7c5)});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      ),
    );
  }
}
