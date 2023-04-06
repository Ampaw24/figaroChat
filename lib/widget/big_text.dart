import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final int maxline;
  final String text;
  final double? size;
  final TextOverflow? overflow;
  final Color? color;

  const BigText(
      {super.key,
      required this.text,
      this.maxline = 1,
      this.size = 30.0,
      this.overflow = TextOverflow.ellipsis,
      this.color = const Color(0xff332d2b)});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines:maxline,
      text,
      overflow: overflow,
      style: TextStyle(
        
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      ),
    );
  }
}
