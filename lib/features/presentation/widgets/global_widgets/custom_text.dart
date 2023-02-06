import 'package:client_core/core/styles/my_fonts.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final bool? alignCenter;
  final bool? ellipsis;
  const CustomText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textDecoration,
    this.ellipsis =false,
    this.alignCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: textDecoration ?? TextDecoration.none,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily ?? primaryFont,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      overflow: ellipsis==true?TextOverflow.ellipsis:null,
      textAlign: alignCenter == true ? TextAlign.center : null,
    );
  }
}
